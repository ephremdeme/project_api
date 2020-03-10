

export const resolvers = {
  Query: {
    async category(root, { id }, { models }) {
      return models.Category.findByPk(id);
    },
    async categories(root, args, { models }) {
      return models.Category.findAll();
    }
  },
  Mutation: {
    async createCategory(root, { category }, { models }) {
      return models.Category.create({
        category
      });
    },
    async updateCategory(root, { id, category }, { models }) {
      await models.Category.update(
        {
          category
        },
        { where: { id: id } }
      );
      const date = await models.Category.findByPk(id);
      return date;
    },

    async deleteCategory(root, { id }, { models }) {
      const date = await models.Category.findByPk(id);
      models.Category.destroy({
        where: { id: id }
      });

      return date;
    }
  },

  Category: {
    async products(category) {
      return category.getProducts();
    }
  }
};
