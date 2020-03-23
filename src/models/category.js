"use strict";
module.exports = (sequelize, DataTypes) => {
  const Category = sequelize.define(
    "Category",
    {
      category: DataTypes.STRING,
      parent: DataTypes.INTEGER
    },
        {}
  );
  Category.associate = function(models) {
    // associations can be defined here
    Category.hasMany(models.Category, {
      as: "child", foreignKey: 'parent'
    });
    Category.hasMany(models.Product, {as: "Category", foreignKey:"CategoryId"});
    Category.hasMany(models.Product, {as: "SubCategory", foreignKey: 'SubCategoryId'} );
      
  };
  return Category;
};
