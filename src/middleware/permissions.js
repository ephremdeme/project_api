const { rule, shield, allow, or, not } = require("graphql-shield");
const { Op } = require("sequelize");

const isAuthenticated = rule()((parent, args, { user }) => {
  return user !== null;
});

const isAdmin = rule()((parent, args, { user }) => {
  return user.roles.some((role) => role == "Admin");
});
const isOperator = rule()((parent, args, { user }) => {
  return user.roles.some((role) => role == "Operator");
});

const isCommentOwner = rule()(async (parent, { id }, { models, user }) => {
  let comment = await models.Comment.findOne({
    where: { id: id, UserId: user.id },
  });
  return comment == null;
});

const permissions = shield({
  Query: {
    getUser: isAuthenticated,
    users: isAuthenticated,
  },

  Mutation: {
    "*": isAuthenticated,
    deleteComment: or(isAdmin, isCommentOwner),
    createOperator: isAdmin,
    updateComment: not(isCommentOwner, new Error("You're not the author!")),
    suspendUser: or(isOperator, isAdmin),
    unSuspendUser: or(isOperator, isAdmin),
    createUser: allow,
    login: allow,
  },
});

module.exports = { permissions };
