const { gql } = require("apollo-server-express");

export const typeDefs = gql`
  type Comment {
    id: Int
    comment: String
    user: User!
  }

  extend type Query {
    comment(id: Int!): Comment!
    # comments: [Comment!]!
    comments(productId: Int): [Comment!]!
  }

  extend type Mutation {
    createComment(comment: String!, productId: Int): Comment
    deleteComment(id: Int!): Comment!
    updateComment(id: Int!, comment: String!): Comment!
  }
`;
