const { gql } = require("apollo-server-express");

export const typeDefs = gql`
  type Comment {
    id: Int
    comment: String
    user: User!
    rating: Rate
  }

  type PaginatedComments {
    count: Int
    comments: [Comment!]!
  }

  extend type Query {
    comment(id: Int!): Comment!
    # comments: [Comment!]!
    comments(productId: Int, offset: Int, limit: Int): PaginatedComments
  }

  extend type Mutation {
    createComment(comment: String!, productId: Int): Comment
    deleteComment(id: Int!): Comment!
    updateComment(id: Int!, comment: String!): Comment!
  }
`;
