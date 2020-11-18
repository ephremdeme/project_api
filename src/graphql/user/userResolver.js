const bcrypt = require("bcryptjs");
import { setTokens } from "../../helper/setTokens";

export const resolvers = {
  Query: {
    async user(root, { id }, { models }) {
      return models.User.findByPk(id, {
        attributes: { exclude: ["password"] },
      });
    },
    async getUser(root, args, { models, user }) {
      return models.User.findByPk(user.id, {
        attributes: { exclude: ["password"] },
      });
    },
    async getSuspendedUsers(root, args, { models }) {
      return models.User.findAll({
        where: {
          status: false,
        },
      });
    },
    async users(root, args, { models }) {
      return models.User.findAll({ attributes: { exclude: ["password"] } });
    },
  },
  Mutation: {
    async createUser(
      root,
      { username, phone, password, first_name, last_name, email },
      { models }
    ) {
      const user = await models.User.create({
        username,
        phone,
        password: await bcrypt.hash(password, 10),
      });

      user.password = null;

      const profile = await models.Profile.create({
        first_name: first_name,
        last_name: last_name,
        email: email,
        UserId: user.id,
      });

      // this.login(root, {username, password}, {models})

      const { accessToken, refreshToken } = setTokens(user);

      return {
        id: user.id,
        token: accessToken,
        User: user,
      };
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
          password: await bcrypt.hash(password, 10),
        },
        { where: { id: id } }
      );
      const data = await models.User.findByPk(id);
      return data;
    },
    async suspendUser(root, { id }, { models }) {
      await models.User.update(
        {
          status: false,
        },
        { where: { id: id } }
      );
      const data = await models.User.findByPk(id);
      return data;
    },
    async unSuspendUser(root, { id }, { models }) {
      await models.User.update(
        {
          status: true,
        },
        { where: { id: id } }
      );
      const data = await models.User.findByPk(id);
      return data;
    },

    async login(root, { username, password }, { models }) {
      const user = await models.User.findOne({
        where: { username: username },
      });

      if (!user) return new Error("user not found");

      const value = await bcrypt.compare(password, user.get().password);
      if (!value) return new Error("Invalid Credentials");
      else {
        user.password = null;
        const { id } = user;
        const { accessToken, refreshToken } = setTokens(user);
        return {
          id: id,
          token: accessToken,
          User: user,
        };
      }
    },

    async deleteUser(root, { id }, { models }) {
      const data = await models.User.findByPk(id);
      models.User.destroy({
        where: { id: id },
      });

      return data;
    },
  },
  User: {
    async comments(user) {
      console.log(user);
      return user.getComments();
    },
    async products(user) {
      return user.getProducts();
    },
    async profile(user) {
      return user.getProfile();
    },
  },
};
