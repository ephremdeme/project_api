const fs = require("fs");
const path = require("path");
const Rate = require("../../models").Rate;

let dir = path.join(__dirname, "../../../dist/public/products/");

export const resolvers = {
  Query: {
    async products(root, { offset, limit, by_date, by_sold }, { models }) {
      let products = await models.Product.findAndCountAll({
        limit: limit,
        offset: offset,
        order: by_date
          ? [["createdAt", "DESC"]]
          : by_sold
          ? [["sold", "DESC"]]
          : null,
      });

      return {
        count: products.count,
        products: products.rows,
      };
    },
    async product(root, { id }, { models }) {
      let product = await models.Product.findByPk(id);
      product.views += 1;
      product.save();
      return product;
    },

    async popularProducts(root, { offset, limit }, { models }) {
      let products = await models.Product.findAndCountAll({
        limit: limit,
        offset: offset,
        order: [["views", "DESC"]],
      });

      return {
        count: products.count,
        products: products.rows,
      };
    },
  },
  Mutation: {
    async createProduct(
      root,
      {
        name,
        shortDescription,
        fullDescription,
        price,
        quantity,
        categoryId,
        subCategoryId,
        file_3d,
        images,
      },
      { models }
    ) {
      if (images.length > 5) {
        images = images.slice(0, 5);
      }
      let res = await Promise.all(images)
        .then(async (datas) => {
          let { createReadStream, filename } = await file_3d;
          filename = Date.now() + filename;

          const prod = await models.Product.create({
            name,
            quantity,
            price,
            shortDescription,
            fullDescription,
            model: filename,
            CategoryId: categoryId,
            SubCategoryId: subCategoryId,
            UserId: 3,
          });

          await fs.promises.mkdir(
            path.join(dir, String(prod.id) + "/images/"),
            {
              recursive: true,
            }
          );
          await fs.promises.mkdir(
            path.join(dir, String(prod.id) + "/models/"),
            {
              recursive: true,
            }
          );

          createReadStream().pipe(
            fs.createWriteStream(
              path.join(dir, String(prod.id) + "/models/" + filename)
            )
          );

          let allImages = datas.map((file) => {
            let { createReadStream, filename } = file;
            filename = Date.now() + filename;

            createReadStream().pipe(
              fs.createWriteStream(
                path.join(dir, String(prod.id) + "/images/" + filename)
              )
            );

            return {
              ProductId: prod.id,
              filename,
              UserId: 3,
            };
          });
          console.log("Images", allImages);

          await models.Image.bulkCreate(allImages);

          return prod;
        })
        .then((prod) => prod)
        .catch((err) => {
          return err;
        });
      return res;
    },
    async updateProduct(
      root,
      {
        id,
        name,
        shortDescription,
        fullDescription,
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

      if (images.length > 5) {
        images = images.slice(0, 5);
      }

      file_3d?.then(async ({ createReadStream, filename }) => {
        modleName = Date.now() + filename;
        createReadStream().pipe(
          fs.createWriteStream(
            path.join(dir, String(id) + "/models/" + filename)
          )
        );

        await models.Product.update(
          {
            name,
            quantity,
            price,
            shortDescription,
            fullDescription,
            model: modleName,
            CategoryId: categoryId,
            SubCategoryId: subCategoryId,
            UserId: 3,
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
            shortDescription,
            fullDescription,
            CategoryId: categoryId,
            SubCategoryId: subCategoryId,
            UserId: 3,
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
                  path.join(dir, String(id) + "/images/" + filename)
                )
              );

              imagesData.push({
                ProductId: id,
                filename,
                UserId: 3,
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
      let res = await models.Product.destroy({
        where: { id: id },
      });

      if (res && fs.existsSync(path.join(dir, String(id)))) {
        await fs.promises.rmdir(path.join(dir, String(id)), {
          recursive: true,
        });
      }
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
