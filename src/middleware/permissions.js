const { rule, shield, deny, allow, or } = require("graphql-shield");

const isAuthenticated = rule()((parent, args, { user }) => {
  return user !== null;
});

const isAdmin = rule()((parent, args, { user, models }) => {
  return user.roles.some((role) => role == "Admin");
});
const isOperator = rule()((parent, args, { user, models }) => {
  return user.roles.some((role) => role == "Operator");
});

const isCommentOwner = rule()((parent, args, { models, user }) => {
  let comment = models.Comment.findOne({
    where: {
      UserId: user.id,
    },
  });
  return comment != null;
});

const permissions = shield({
  Query: {
    getUser: isAuthenticated,
    users: isAuthenticated,
  },

  Mutation: {
    "*": isAuthenticated,
    deleteComment: or(isAuthenticated, isOperator, isAdmin),
    createOperator: isAdmin,
    updateComment: or(isAdmin, isAuthenticated),
    suspendUser: or(isOperator, isAdmin),
    unSuspendUser: or(isOperator, isAdmin),
    createUser: allow,
    login: allow,
  },
});

module.exports = { permissions };
