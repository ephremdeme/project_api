export const resolvers = {
  Query: {
    async contacts(root, args, { models }) {
      return models.Contact.findAll();
    },
  },
  Mutation: {
    async createContact(root, { name, subject, email, message }, { models }) {
      console.log("Contact", name, email, subject, message);
      return models.Contact.create({
        name,
        subject,
        email,
        message,
      });
    },

    async deleteContact(root, { id }, { models }) {
      const data = await models.Contact.findByPk(id);
      models.Contact.destroy({
        where: { id: id },
      });

      return data;
    },
  },
};
