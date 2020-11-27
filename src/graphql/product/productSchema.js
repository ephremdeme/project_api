import { gql } from "apollo-server-express";

export const typeDefs = gql`
  type Product {
    id: Int
    name: String
    model: String
    price: Float
    quantity: Int
    views: Int
    description: String
    comments: [Comment!]!
    seller: User!
    category: Category!
    subCategory: Category!
    images: [Image!]!
    rating: Rate!
  }

  extend type Query {
    products: [Product!]!
    popularProducts: [Product!]!
    product(id: Int): Product
  }

  extend type Mutation {
    createProduct(
      name: String!
      price: Float!
      quantity: Int!
      description: String!
      categoryId: Int!
      subCategoryId: Int!
      images: [Upload!]
      file_3d: Upload!
    ): Product

    updateProduct(
      id: Int!
      name: String!
      price: Float!
      quantity: Int!
      description: String!
      categoryId: Int!
      subCategoryId: Int!
      images: [Upload]
      file_3d: Upload
    ): Product

    deleteProduct(id: Int!): Product!
  }
`;
