'use strict';
module.exports = (sequelize, DataTypes) => {
  const Product = sequelize.define('Product', {
    name: DataTypes.STRING,
    price: DataTypes.DOUBLE,
    description: DataTypes.TEXT,
    quantity: DataTypes.STRING
    
  }, {});
  Product.associate = function(models) {
    // associations can be defined here
    Product.belongsTo(models.User)
    Product.belongsTo(models.Category, {as: "Category", foreignKey:"CategoryId"});
    Product.belongsTo(models.Category, {as: "SubCategory", foreignKey: 'SubCategoryId'} );
    Product.hasMany(models.Comment)
    Product.hasMany(models.Rate)
    Product.hasMany(models.Image);
  };
  return Product;
};