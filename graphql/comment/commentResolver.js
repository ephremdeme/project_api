
export const resolvers = {
  Query: {
    async comment(root, { id }, { models }) {
      return models.Comment.findByPk(id);
    },
    async comments(root, args, { models }) {
      return models.Comment.findAll();
    }
  },
  Mutation: {
    async createComment(
      root,
      { comment, productId },
      { models }
    ) {
      return models.Comment.create({
        comment,
        userId: 1,
        productId
      });
    },
    async updateComment(
      root,
      { id, comment },
      { models }
    ) {
      await models.Comment.update(
        {
          comment
        },
        { where: { id: id } }
      );
      const data = await models.Comment.findByPk(id);
      return data;
    },

    async deleteComment(root, { id }, { models }) {
      const data = await models.Comment.findByPk(id);
      models.Comment.destroy({
        where: { id: id }
      });

      return data;
    }
  },

  Comment : {
    async user(comment){
      return comment.getUser();
    }
  }
};
