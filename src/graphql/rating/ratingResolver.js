const { Op } = require("sequelize");

export const resolvers = {
  Query: {
    async rating(root, { productId }, { models }) {
      let data = {
        rating: await models.Rate.sum("rating", {
          where: { productId: productId }
        }),
        count: await models.Rate.count({
          where: { productId: productId }
        })
      };
      data.rating = data.rating / data.count;
      return data;
    }
  },
  Mutation: {
    async rate(root, { productId, rating }, { models }) {
      await models.Rate.create({
        rating,
        productId,
        userId: 2
      });
      let data = {
        rating: await models.Rate.sum("rating", {
          where: { productId: productId, userId: 2 }
        }),
        count: await models.Rate.count({
          where: { [Op.and]: [{ productId: productId }, { userId: 2 }] }
        })
      };
      data.rating = data.rating / data.count;
      return data;
    }
  }
};
