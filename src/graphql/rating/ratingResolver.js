const { Op } = require("sequelize");

export const resolvers = {
  Query: {
    async rating(root, { ProductId }, { models }) {
      let data = {
        rating: await models.Rate.sum("rating", {
          where: { ProductId: ProductId },
        }),
        count: await models.Rate.count({
          where: { ProductId: ProductId },
        }),
      };
      data.rating = data.rating / data.count;
      return data;
    },
  },
  Mutation: {
    async rate(root, { ProductId, rating }, { models, user }) {
      await models.Rate.create({
        rating,
        ProductId,
        UserId: user.id,
      });
      let data = {
        rating: await models.Rate.sum("rating", {
          where: { ProductId: ProductId },
        }),
        count: await models.Rate.count({
         where: { ProductId: ProductId }
        }),
      };
      data.rating = data.rating / data.count;
      return data;
    },
  },
};
