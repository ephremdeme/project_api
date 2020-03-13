const fs = require("fs");
const path = require("path");
const Rate = require('../../models').Rate
export const resolvers = {
  Query: {
    async products(root, args, { models }) {
      return models.Product.findAll();
    },
    async product(root, { id }, { models }) {
      return models.Product.findByPk(id);
    }
  },
  Mutation: {
    async createProduct(
      root,
      { name, description, price, quantity, categoryId, file },
      { models }
    ) {
      let { createReadStream, filename } = await file;
      filename = Date.now() + filename;
      createReadStream().pipe(
        fs.createWriteStream(
          path.join(__dirname, "../../../dist/public/images/" + filename)
        )
      );
      const prod = await models.Product.create({
        name,
        quantity,
        price,
        description,
        categoryId,
        userId: 2
      });
      models.Image.create({ productId: prod.id, filename, userId: 2 });
      return prod;
    },
    async updateProduct(
      root,
      { id, name, description, price, quantity, categoryId },
      { models }
    ) {
      await models.Product.update(
        {
          name,
          quantity,
          price,
          description,
          categoryId,
          userId: 2
        },
        { where: { id: id } }
      );
      const data = await models.Product.findByPk(id);
      return data;
    },
    async deleteProduct(root, { id }, { models }) {
      const data = await models.Product.findByPk(id);
      models.Product.destroy({
        where: { id: id }
      });
      return data;
    }
  },
  Product: {
    async seller(product) {
      return product.getUser();
    },
    async comments(product) {
      return product.getComments();
    },
    async images(product) {
      return product.getImages();
    },
    async rating(product) {
      let data = {
        rating: await Rate.sum("rating", {
          where: { productId: product.id }
        }),
        count: await Rate.count({
          where: { productId: product.id }
        })
      };
      data.rating = data.rating / data.count;
      return data;
    },
    async category(product) {
      return product.getCategory();
    }
  }
};
