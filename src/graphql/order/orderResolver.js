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
    async createOrder(
      root,
      { totalPrice, subTotalPrice, ProductId },
      { models, user }
    ) {
      try {
        const order = await models.Order.create({
          status: true,
          confirmation_num: parseInt(Date.now() / 1000),
          totalPrice: totalPrice,
          subTotalPrice: subTotalPrice,
          UserId: user.id,
        });
        const addProductToOrder = await models.ProductOrder.create({
          ProductId: ProductId,
          OrderId: order.id,
        });

        return {
          code: 200,
          message: "Successfully Ordered",
          order: order,
        };
      } catch (error) {
        return {
          code: 500,
          message: "An Error Occured while proccessing the order",
          order: order,
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
