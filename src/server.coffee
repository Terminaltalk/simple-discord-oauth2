path = require "path"
{ Server, Router } = require "@antibot/server"
{ config } = require "dotenv"
passport = require "passport"
session = require "express-session"
Strategy = require "passport-discord"
mongoose = require "mongoose"
config()
require "./middleware/oauth2"
server = new Server
        port : process.env.port
        settings : {
            routesDirectory : path.join process.cwd(), "js/routes/"
            routesEndpoint : "/"
            useJson : true
            viewEngine : "ejs"
            views : path.join process.cwd(), "public/views"
            viewExt : "ejs"
            debug : true
        }
        cors : {
            origin : "*"
            methods : "GET,HEAD,PUT,PATCH,POST,DELETE"
        }


mongoose.connection.on "connected", () ->
    console.log "MongoDb  connection has been fired."

mongoose.connection.on "disconnecteed", () -> 
    console.log "MongoDB connection has been put out."

mongoose.connection.on "error", (e) -> 
    console.log e

mongoose.connect process.env.mongoDB

server.start()