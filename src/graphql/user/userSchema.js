const { gql } = require("apollo-server-express");

export const typeDefs = gql`
  type User {
    id: Int
    firstName: String
    lastName: String
    email: String
    password: String
    comments: [Comment!]!
    products: [Product!]!
  }

  extend type Query {
    user(id: Int!): User
    login(password: String, email: String): User
    users: [User]!
  }

  type Mutation {
    createUser(
      firstName: String!
      lastName: String!
      email: String!
      password: String!
    ): User
    deleteUser(id: Int!): User!
    updateUser(
      id: Int!
      firstName: String!
      lastName: String!
      email: String!
      password: String!
    ): User!
  }
`;
