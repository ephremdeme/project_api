const { rule, shield, deny, allow, or } = require("graphql-shield");

const isAuthenticated = rule()((parent, args, { user }) => {
  return user !== null;
});


const isAdmin = rule()( async (parent, args, { user, models }) => {
  admin = await models.User.findOne({
    where: {
      id: user.id,
    },
    include: models.Role,
  });

  return true
});



const isCommentOwner = rule()(async (parent, args, { models, user }) => {
  let comment = await models.Comment.findOne({
    where : {
      UserId : user.id
    }
  })
  return comment!=null;
});

const permissions = shield({
  Query: {
    getUser: isAuthenticated,
    users: isAuthenticated,
  },

  Mutation: {
    "*": isAuthenticated,
    deleteComment : or(isCommentOwner, isAdmin),
    updateComment : isCommentOwner,
    createUser: allow,
    login: allow,
  },
});

module.exports = { permissions };
