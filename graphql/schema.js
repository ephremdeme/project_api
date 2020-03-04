import { mergeSchemas, makeExecutableSchema } from "apollo-server-express";

import { typeDefs as User } from "./user/userSchema";
import { typeDefs as Comment } from "./comment/commentSchema";
import { typeDefs as Product } from "./product/productSchema";
import { typeDefs as Rate } from "./rating/ratingSchema";


import { resolvers as commentResolver } from "./comment/commentResolver";
import { resolvers as userResolver } from "./user/userResolver";
import { resolvers as productResolver } from "./product/productResolver";
import { resolvers as rateResolver } from "./rating/ratingResolver";

const Query = `
  type Query {
    _empty: String
  }
`;
const resolvers ={}

export const schema = makeExecutableSchema({
    typeDefs : [Query, User, Comment, Product, Rate],
    resolvers : [resolvers, userResolver, commentResolver, productResolver, rateResolver]
});