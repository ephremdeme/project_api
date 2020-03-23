export const resolvers = {
  Query: {
    async category(root, { id }, { models }) {
      return models.Category.findByPk(id);
    },
    async categories(root, args, { models }) {
      return models.Category.findAll({
        where:{
          parent:null
        }
      });
    }
  },
  Mutation: {
    async createCategory(root, { category }, { models }) {
      return models.Category.create({
        category
      });
    },
    async createSubCategory(root, { category, categoryId }, { models }) {
      let sub =await models.Category.create({
        category,
        categoryId
      });
      models.Category.findByPk(categoryId).then(elec=>{ 
        elec.addChild(sub);
      });
      
      // console.log(elec.getChilds());
      return sub;
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
      return category.getCategory();
    },
    async subProducts(category) {
      return category.getSubCategory()
    },
    async SubCategory(category) {
      return category.getChild();
    }
  }
};
