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
    ): Product

    updateProduct(
      id: Int!
      name: String!
      price: Float!
      quantity: Int!
      description: String!
    ): Product

    deleteProduct(id: Int!): Product!
  }
`;
