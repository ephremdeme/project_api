const { gql } = require("apollo-server-express");

export const typeDefs = gql`
  type User {
    id: Int
    username: String
    phone: String
    status: Boolean
    password: String
    comments: [Comment!]!
    products: [Product!]!
    profile: Profile
    role: Role
  }

  type Role {
    id: Int!
    role: String!
  }

  type AuthData {
    id: Int
    token: String!
    User: User!
  }

  extend type Query {
    user(id: Int!): User
    getUser: User!
    users: [User]!
    getSuspendedUsers: [User]!
  }

  type Mutation {
    createUser(
      username: String
      phone: String!
      password: String!
      first_name: String!
      last_name: String!
      email: String
    ): AuthData

    login(password: String, phone: String): AuthData

    deleteUser(id: Int!): User!

    suspendUser(id: Int!): User!

    unSuspendUser(id: Int!): User!

    updateUser(
      id: Int!
      firstName: String
      lastName: String
      email: String
      password: String
    ): User!
  }
`;
