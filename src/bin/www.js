#!/usr/bin/env node

/**
 * Module dependencies.
 */

var express = require("express");
var debug = require("debug")("server:server");
const { ApolloServer } = require("apollo-server-express");
// const { schema } = require("../graphql/schema");

import { schema } from "../graphql/schema";

const models = require("../models");

/**
 * Get port from environment and store in Express.
 */


 console.log("schema \n" + schema);

const app = express();
var port = normalizePort(process.env.PORT || "5000");
// app.set("port", port);

app.get("/test", (req, res) => {
  models.User.findAll()
    .then(data => res.json(data))
    .catch(err => res.json("error"));
});

// models.User.findAll({raw : true}).then(data=> console.log(data))

/**
 * Create HTTP server.
 */

const server = new ApolloServer({
  schema,
  context: { models },
  playground: true
});

server.applyMiddleware({ app });

/**
 * Listen on provided port, on all network interfaces.
 */

app.listen(port , () =>
  console.log(`Server started on port ${process.env.PORT}`)
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
