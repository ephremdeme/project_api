export const resolvers = {
    Query: {
      async wishlists(root, args, { models, user }) {
        try {
          const wishlsts = await models.Wishlist.findAll({
            where: {
              UserId: user.id,
            },
          });
  
          return wishlsts;
        } catch (error) {
          return new Error(error.message);
        }
      },
  
      async wishlist(root, { id }, { models, user }) {
        try {
          const wish = await models.Wishlist.findByPk(id);
          return wish;
        } catch (error) {}
      },
    },
    Mutation: {
      async createWishlist(root, { productId }, { models, user }) {
        try {
          const wish = await models.Wishlist.create({
            UserId: user.id,
            ProductId: productId,
          });
          return {
            code: "200",
            success: true,
            message: "Successfully Created a Wishlist",
            wishlist: wish,
          };
        } catch (error) {
          return {
            code: "400",
            success: false,
            message: error.message,
            wishlist: null,
          };
        }
      },
      async deleteWishlist(root, { id }, { models, user }) {
        try {
          const status = await models.Wishlist.destroy({
            where: { id },
          });
          if(status){
              return {
                  code: "200",
                  success: true,
                  message: "Successfully Deleted a Wishlist",
                  wishlist: null
              }
          }
          return {
              code: "404",
              success: false,
              message: "Not Successfully Deleted a Wishlist",
              wishlist: null
          }
          
        } catch (error) {
          return {
              code: "501",
              status: false,
              message: error.message,
              wishlist: null
          }
        }
      },
    },
    Wishlist:{
        product(wishlist){
            return wishlist.getProduct()
        }
    }
  };
  