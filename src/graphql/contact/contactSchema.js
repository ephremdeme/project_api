import { gql } from "apollo-server-express";

export const typeDefs = gql`
  type Contact {
    id: Int
    name: String
    subject: String
    email: String
    message: String
  }

  extend type Query {
    contacts: [Contact]!
  }

  extend type Mutation {
    createContact(
      name: String!
      subject: String!
      email: String!
      message: String!
    ): Contact!
    deleteContact(id: Int!): Contact!
  }
`;
