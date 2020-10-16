import { gql } from "apollo-server-express";

export const typeDefs = gql`
  type Profile {
    id: Int
    first_name: String
    last_name: String
    email: String
    image: Image
  }

  extend type Query{
      profile: Profile!
  }
`;
