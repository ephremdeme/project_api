import { gql } from "apollo-server-express";

export const typeDefs = gql`
  type Order {
    id: Int!
    status: Boolean!
    confirmation_num: Int!
    totalPrice: Float!
    subTotalPrice: Float!
    products: [Product!]
  }

  type OrderMutationResponse implements MutationResponse {
    code: String!
    message: String!
    order: Order
  }

  extend type Query {
    order(confirmation_num: Int!): Order!
    orders: [Order!]
  }

  extend type Mutation {
    createOrder(
      subTotalPrice: Float!
      totalPrice: Float!
      ProductId: Int!
    ): OrderMutationResponse!
  }
`;
