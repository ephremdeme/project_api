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

  input Item {
    id: Int!
    quantity: Int!
  }

  input OrderInput {
    products: [Item]!
    pin: Int!
    sellerPhone: String!
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
    createOrder(orders: OrderInput!): OrderMutationResponse!
  }
`;
