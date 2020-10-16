import { gql } from "apollo-server-express";

export const typeDefs = gql`
  type Rate {
    rating: Float
    count: Int
  }

  extend type Query {
    rating(ProductId: Int!): Rate!
  }

  extend type Mutation {
    rate(rating: Int!, ProductId: Int!): Rate!
  }
`;
