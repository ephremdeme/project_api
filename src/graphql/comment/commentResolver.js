export const resolvers = {
  Query: {
    async comment(root, { id }, { models }) {
      return models.Comment.findByPk(id);
    },

    async comments(root, { productId, limit, offset }, { models }) {
      let comments = await models.Comment.findAndCountAll({
        where: { ProductId: productId },
        offset: offset,
        limit: limit,
      });

      return {
        count: comments.count,
        comments: comments.rows,
      };
    },
  },
  Mutation: {
    async createComment(root, { comment, productId }, { models, user }) {
      return models.Comment.create({
        comment,
        UserId: user.id,
        ProductId: productId,
      });
    },
    async updateComment(root, { id, comment }, { models }) {
      await models.Comment.update(
        {
          comment,
        },
        { where: { id: id } }
      );
      const data = await models.Comment.findByPk(id);
      return data;
    },

    async deleteComment(root, { id }, { models }) {
      const data = await models.Comment.findByPk(id);
      models.Comment.destroy({
        where: { id: id },
      });

      return data;
    },
  },

  Comment: {
    async user(comment) {
      return comment.getUser();
    },
    async rating(comment) {
      return comment.getRate();
    },
  },
};
