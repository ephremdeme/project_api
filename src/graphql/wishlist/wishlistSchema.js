import { gql } from "apollo-server-express";

export const typeDefs = gql`
  type Wishlist {
    id: Int!
    product: Product!
  }

  type WishlistMutationResponse implements MutationResponse{
    code: String!
    message: String!
    wishlist: Wishlist
  }

  extend type Query {
    wishlists: [Wishlist!]
    wishlist(id: Int): Wishlist
  }

  extend type Mutation{
      createWishlist(productId: Int!): WishlistMutationResponse!
      deleteWishlist(id: Int!): WishlistMutationResponse!
  }
`;
