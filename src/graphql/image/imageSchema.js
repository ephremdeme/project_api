import { gql } from "apollo-server-express";


export const typeDefs = gql`
  type Image {
    id: Int!
    filename: String!
  }
  extend type Query {
    image(id: Int!): Image!
  }
  extend type Mutation {
    uploadImage(file: Upload!, productId: Int!): Image!
  }
  scalar Upload
`;
