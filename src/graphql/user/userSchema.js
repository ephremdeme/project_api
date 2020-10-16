const { gql } = require("apollo-server-express");

export const typeDefs = gql`
  type User {
    id: Int
    username: String
    phone: String
    password: String
    comments: [Comment!]!
    products: [Product!]!
    profile: Profile
  }

  type AuthData {
    id: Int
    accessToken: String!
    refreshToken: String!
    User: User!
  }

  extend type Query {
    user(id: Int!): User
    getUser: User!
    users: [User]!
  }

  type Mutation {
    createUser(
      username: String!
      phone: String!
      password: String!
      first_name: String!
      last_name: String!
      email: String!
    ): AuthData

    login(password: String, username: String): AuthData


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
