#!/usr/bin/env node

/**
 * Module dependencies.
 */
require("dotenv").config();
var debug = require("debug")("server:server");
const { ApolloServer } = require("apollo-server-express");

import { schema } from "../graphql/schema";
import { applyMiddleware } from "graphql-middleware";
const { permissions } = require("../middleware/permissions");

const expressJwt = require("express-jwt");

const models = require("../models");
const app = require("../app");

/**
 * Alter tables and its constraints
 */

models.sequelize.sync({ alter: true });

/**
 * Get port from environment and store in Express.
 */

var port = normalizePort(process.env.PORT || "5001");

/**
 * Create HTTP server.
 */

// app.use(authMiddleware);

app.use(function (err, req, res, next) {
  if (err.name === "UnauthorizedError") {
    res.send({
      status: 401,
      message: "Invalid Token.......",
    });
  }
});

app.get("/about", (req, res) => {
  res.send({
    Author: "Ephrem Demelash",
    Github: "github.com/ephremdeme",
    Email: "demelashephrem@gmail.com",
    LinkedIn: "linkedin.com/in/ephrem-demelash/",
  });
});

app.use(
  expressJwt({
    secret: Buffer.from(process.env.ACESS_TOKEN_SECRET_KEY).toString("base64"),
    algorithms: ["HS256"],
    credentialsRequired: false,
  })
);

const server = new ApolloServer({
  schema: applyMiddleware(schema, permissions),
  context: ({ req, res }) => {
    const user = req?.user?.user || null;
    return { user, models };
  },
  introspection: true,
  playground: true,
});

server.applyMiddleware({ app });

/**
 * Listen on provided port, on all network interfaces.
 */

app.listen(port, () =>
  console.log(`🚀 Server ready on port : ${process.env.PORT || 5001}`)
);
app.on("error", onError);
app.on("listening", onListening);

/**
 * Normalize a port into a number, string, or false.
 */

function normalizePort(val) {
  var port = parseInt(val, 10);

  if (isNaN(port)) {
    // named pipe
    return val;
  }

  if (port >= 0) {
    // port number
    return port;
  }

  return false;
}

process.on("UnauthorizedError", (error) => {
  console.log("Error is found");
  console.log(error);
});

/**
 * Event listener for HTTP server "error" event.
 */

function onError(error) {
  if (error.syscall !== "listen") {
    throw error;
  }

  var bind = typeof port === "string" ? "Pipe " + port : "Port " + port;

  // handle specific listen errors with friendly messages
  switch (error.code) {
    case "EACCES":
      console.error(bind + " requires elevated privileges");
      process.exit(1);
      break;
    case "EADDRINUSE":
      console.error(bind + " is already in use");
      process.exit(1);
      break;
    default:
      throw error;
  }
}

/**
 * Event listener for HTTP server "listening" event.
 */

function onListening() {
  var addr = server.address();
  var bind = typeof addr === "string" ? "pipe " + addr : "port " + addr.port;
  debug("Listening on " + bind);
}

// for (let model of Object.keys(models)) {
//   if(!models[model].name)
//     continue;

//   console.log("\n\n----------------------------------\n",
//   models[model].name,
//   "\n----------------------------------");

//   // console.log("\nAttributes");
//   // for (let attr of Object.keys(models[model].attributes)) {
//   //     console.log(models[model].name + '.' + attr);
//   // }

//   console.log("\nAssociations");
//   for (let assoc of Object.keys(models[model].associations)) {
//     for (let accessor of Object.keys(models[model].associations[assoc].accessors)) {
//       console.log(models[model].name + '.' + models[model].associations[assoc].accessors[accessor]+'()');
//     }
//   }

//   // console.log("\nCommon");
//   // for (let func of Object.keys(models[model].Instance.super_.prototype)) {
//   //   if(func === 'constructor' || func === 'sequelize')
//   //     continue;
//   //   console.log(models[model].name + '.' + func+'()');
//   // }
// }
