var gpc = require("generate-pincode");
var axios = require("axios");

export const resolvers = {
  Query: {
    async orders(root, args, { models, user }) {
      const userOrders = await models.Order.findAll({
        where: { UserId: user.id },
      });
      return userOrders;
    },
    async order(root, { confirmation_num }, { models }) {
      const userOrder = await models.Order.findOne({
        where: { confirmation_num: confirmation_num },
      });

      return userOrder;
    },
  },
  Mutation: {
    async createOrder(root, { orders }, { models, user }) {
      try {
        let sum = 0;
        console.log(orders);
        let { pin, sellerPhone } = orders;
        let buyer = await models.User.findByPk(user.id);
        let res = orders.products.map(async ({ id, quantity }) => {
          return models.Product.findByPk(id).then((pr) => {
            sum += pr.price * quantity;
            return pr;
          });
        });

        let allProducts = await Promise.all(res);

        const order = await models.Order.create({
          status: true,
          confirmation_num: gpc(6),
          totalPrice: sum * 1.15,
          subTotalPrice: sum,
          UserId: user.id,
        });

        order.addProducts(allProducts);
        let tx = await axios.post("http://10.240.68.58:3001/txs/", {
          amount: sum,
          buyerPhone: buyer.phone,
          sellerPhone: sellerPhone,
          pin: pin,
        });

        console.log(tx.data);

        return {
          code: 200,
          message: "Successfully Ordered",
          order: order,
        };
      } catch (error) {
        console.log(error);
        return {
          code: 500,
          message: "An Error Occured while proccessing the order",
          order: null,
        };
      }
    },
  },
  Order: {
    products(order) {
      return order.getProducts();
    },
  },
};
