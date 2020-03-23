import { gql } from "apollo-server-express";

export const typeDefs = gql`
  type Category {
    id: Int
    category: String
    products: [Product!]!
    subProducts: [Product!]!
    SubCategory: [Category!]!
  }

  extend type Query{
      categories: [Category!]!
      category(id: Int!): Category!
  }

  extend type  Mutation{
      createCategory(category: String!): Category!
      createSubCategory(category: String!, categoryId: Int): Category!
      updateCategory(id: Int!, category: String!): Category!
      deleteCategory(id: Int!): Category!
  }

`;
