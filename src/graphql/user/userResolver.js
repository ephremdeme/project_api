const bcrypt = require("bcryptjs");

export const resolvers = {
  Query: {
    async user(root, { id }, { models }) {
      return models.User.findByPk(id);
    },
    async users(root, args, { models }) {
      return models.User.findAll();
    }
  },
  Mutation: {
    async createUser(
      root,
      { firstName, lastName, email, password },
      { models }
    ) {
      return models.User.create({
        firstName,
        lastName,
        email,
        password: await bcrypt.hash(password, 10)
      });
    },
    async updateUser(
      root,
      { id, firstName, lastName, email, password },
      { models }
    ) {
      await models.User.update(
        {
          firstName,
          lastName,
          email,
          password: await bcrypt.hash(password, 10)
        },
        { where: { id: id } }
      );
      const data = await models.User.findByPk(id);
      return data;
    },

    async deleteUser(root, { id }, { models }) {
      const data = await models.User.findByPk(id);
      models.User.destroy({
        where: { id: id }
      });

      return data;
    }
  },
  User: {
    async comments(user) {
      console.log(user)
      return user.getComments();
    },
    async products(user){
      return user.getProducts()
    }
  }
};
