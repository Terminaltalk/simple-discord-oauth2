path = require "path"
{ Server, Router } = require "@antibot/server"
{ config } = require "dotenv"
passport = require "passport"
session = require "express-session"
Strategy = require "passport-discord"
config()

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

server.start()