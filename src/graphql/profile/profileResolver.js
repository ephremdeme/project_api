const Image = require("./../../models").Image;

export const resolvers = {
  Query: {
    async profile(root, args, { models, user }) {
      const userProfile = await models.Profile.findOne({
        where: {
          UserId: user.id,
        }
      });
      return userProfile;
    },
  },

  Profile: {
    async image(profile) {
      const userProfile = await Image.findOne({
        where: {
          ProfileId: profile.id,
        },
        order: [["id", "DESC"]],
      });
      return userProfile;
    },
  },
};
