import { gql } from "apollo-server-express";

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
      { name, description, price, quantity, categoryId },
      { models }
    ) {
      return models.Product.create({
        name,
        quantity,
        price,
        description,
        categoryId,
        userId: 2
      });
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
    async category(product) {
      return product.getCategory();
    }
  }
};
