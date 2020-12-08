"use strict";
module.exports = (sequelize, DataTypes) => {
  const Comment = sequelize.define(
    "Comment",
    {
      comment: { type: DataTypes.STRING, allowNull: false },
    },
    {}
  );
  Comment.associate = function (models) {
    // associations can be defined here
    Comment.belongsTo(models.User);
    Comment.belongsTo(models.Product);
    Comment.hasOne(models.Rate);
  };
  return Comment;
};
