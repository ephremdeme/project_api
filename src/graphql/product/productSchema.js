import { gql } from "apollo-server-express";

export const typeDefs = gql`
  type Product {
    id: Int
    name: String
    model: String
    price: Float
    sold: Int
    quantity: Int
    views: Int
    shortDescription: String
    fullDescription: String
    comments: [Comment!]!
    seller: User!
    category: Category!
    subCategory: Category!
    images: [Image!]!
    rating: Rate!
  }

  type PaginatedProducts {
    count: Int
    products: [Product!]!
  }

  extend type Query {
    products(
      offset: Int
      limit: Int
      by_date: Boolean
      by_sold: Boolean
    ): PaginatedProducts!
    popularProducts(offset: Int, limit: Int): PaginatedProducts!
    product(id: Int): Product
  }

  extend type Mutation {
    createProduct(
      name: String!
      price: Float!
      quantity: Int!
      shortDescription: String!
      fullDescription: String!
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
      shortDescription: String!
      fullDescription: String!
      categoryId: Int!
      subCategoryId: Int!
      images: [Upload]
      file_3d: Upload
    ): Product

    deleteProduct(id: Int!): Product!
  }
`;
