import { gql } from "apollo-server-express";

export const typeDefs = gql`
  type Product {
    id: Int
    name: String
    price: Float
    quantity: Int
    description: String
    comments: [Comment!]!
    seller: User!
    category: Category!
  }

  extend type Query {
    products: [Product!]!
    product(id: Int): Product
  }

  extend type Mutation {
    createProduct(
      name: String!
      price: Float!
      quantity: Int!
      description: String!
      categoryId: Int!
    ): Product

    updateProduct(
      id: Int!
      name: String!
      price: Float!
      quantity: Int!
      description: String!
      categoryId: Int!
    ): Product

    deleteProduct(id: Int!): Product!
  }
`;
