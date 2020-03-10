import { gql } from "apollo-server-express";

export const typeDefs = gql`
  type Category {
    id: Int
    category: String
    products: [Product!]!
  }

  extend type Query{
      categories: [Category!]!
      category(id: Int!): Category!
  }

  extend type  Mutation{
      createCategory(category: String!): Category!
      updateCategory(id: Int!, category: String!): Category!
      deleteCategory(id: Int!): Category!
  }

`;
