const fs = require("fs");
const path = require("path");
const Rate = require("../../models").Rate;
export const resolvers = {
  Query: {
    async products(root, args, { models }) {
      return await models.Product.findAll();
    },
    async product(root, { id }, { models }) {
      let product = await models.Product.findByPk(id);
      product.views += 1;
      product.save();
      return product;
    },

    async popularProducts(root, args, { models }) {
      return await models.Product.findAll({
        order: [["views", "DESC"]],
      });
    },
  },
  Mutation: {
    async createProduct(
      root,
      {
        name,
        description,
        price,
        quantity,
        categoryId,
        subCategoryId,
        file_3d,
        images,
      },
      { models }
    ) {
      let res = await Promise.all(images)
        .then(async (datas) => {
          let { createReadStream, filename } = await file_3d;
          filename = Date.now() + filename;
          createReadStream().pipe(
            fs.createWriteStream(
              path.join(
                __dirname,
                "../../../dist/public/images/products/" + filename
              )
            )
          );
          const prod = await models.Product.create({
            name,
            quantity,
            price,
            description,
            model: filename,
            CategoryId: categoryId,
            SubCategoryId: subCategoryId,
            UserId: 6,
          });

          let imagesData = [];

          datas.map(async (file) => {
            let { createReadStream, filename } = file;

            createReadStream().pipe(
              fs.createWriteStream(
                path.join(
                  __dirname,
                  "../../../dist/public/images/products/" + filename
                )
              )
            );

            imagesData.push({
              ProductId: prod.id,
              filename,
              UserId: 2,
            });

            await models.Image.bulkCreate(imagesData);
          });
          return prod;
        })
        .then((prod) => prod)
        .catch((err) => {
          return new Error("An Error Occured while uploading images");
        });
      return res;
    },
    async updateProduct(
      root,
      {
        id,
        name,
        description,
        price,
        quantity,
        subCategoryId,
        categoryId,
        file_3d,
        images,
      },
      { models }
    ) {
      let modleName;
      file_3d?.then(async ({ createReadStream, filename }) => {
        modleName = Date.now() + filename;
        createReadStream().pipe(
          fs.createWriteStream(
            path.join(
              __dirname,
              "../../../dist/public/images/products/" + modleName
            )
          )
        );

        await models.Product.update(
          {
            name,
            quantity,
            price,
            description,
            model: modleName,
            CategoryId: categoryId,
            SubCategoryId: subCategoryId,
            UserId: 6,
          },
          { where: { id: id } }
        );
      });
      if (!file_3d) {
        await models.Product.update(
          {
            name,
            quantity,
            price,
            description,
            CategoryId: categoryId,
            SubCategoryId: subCategoryId,
            UserId: 6,
          },
          { where: { id: id } }
        );
      }

      if (images) {
        let res = await Promise.all(images)
          .then(async (datas) => {
            let imagesData = [];
            datas.map(async (file) => {
              let { createReadStream, filename } = file;

              createReadStream().pipe(
                fs.createWriteStream(
                  path.join(
                    __dirname,
                    "../../../dist/public/images/products/" + filename
                  )
                )
              );

              imagesData.push({
                ProductId: id,
                filename,
                UserId: 2,
              });
            });

            await models.Image.destroy({
              where: {
                ProductId: id,
              },
            });

            await models.Image.bulkCreate(imagesData);
            return false;
          })
          .catch((err) => {
            return new Error("An Error Occured while uploading images");
          });

        if (res) return res;
      }

      const data = await models.Product.findByPk(id);
      return data;
    },
    async deleteProduct(root, { id }, { models }) {
      const data = await models.Product.findByPk(id);
      models.Product.destroy({
        where: { id: id },
      });
      return data;
    },
  },
  Product: {
    async seller(product) {
      return product.getUser();
    },
    async comments(product) {
      return product.getComments();
    },
    async images(product) {
      return product.getImages();
    },
    async rating(product) {
      let data = {
        rating: await Rate.sum("rating", {
          where: { productId: product.id },
        }),
        count: await Rate.count({
          where: { productId: product.id },
        }),
      };
      data.rating = data.rating / data.count;
      return data;
    },
    async category(product) {
      return product.getCategory();
    },
    async subCategory(product) {
      return product.getSubCategory();
    },
  },
};

// const prod = await models.Product.create({
//   name,
//   quantity,
//   price,
//   description,
//   CategoryId: categoryId,
//   SubCategoryId: subCategoryId,
//   UserId: 2,
// });
// models.Image.create({ ProductId: prod.id, filename, UserId: 2 });
