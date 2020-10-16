import { mergeSchemas, makeExecutableSchema } from "apollo-server-express";

import { typeDefs as User } from "./user/userSchema";
import { typeDefs as Comment } from "./comment/commentSchema";
import { typeDefs as Product } from "./product/productSchema";
import { typeDefs as Rate } from "./rating/ratingSchema";
import { typeDefs as Category } from "./catagory/categorySchema";
import { typeDefs as Image } from "./image/imageSchema";
import { typeDefs as Profile } from "./profile/profileSchema";

import { resolvers as commentResolver } from "./comment/commentResolver";
import { resolvers as userResolver } from "./user/userResolver";
import { resolvers as productResolver } from "./product/productResolver";
import { resolvers as rateResolver } from "./rating/ratingResolver";
import { resolvers as categoryResolver } from "./catagory/categoryResolver";
import { resolvers as imageResolver } from "./image/imageResolver";
import { resolvers as profileResolver } from "./profile/profileResolver";

const Query = `
  type Query {
    _empty: String
  }
`;

const resolvers = {};

export const schema = makeExecutableSchema({
  typeDefs: [Query, User, Comment, Product, Profile, Rate, Category, Image],
  resolvers: [
    resolvers,
    userResolver,
    commentResolver,
    profileResolver,
    productResolver,
    rateResolver,
    categoryResolver,
    imageResolver,
  ],
});
