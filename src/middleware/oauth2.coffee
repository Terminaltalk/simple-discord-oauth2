DiscordStrategy = require("passport-discord").Strategy
passport = require "passport"
UserSchema = require "../models/UserSchema"
session = require "express-session"
cookieParser  = require "cookie-parser"
module.exports = (router) ->
  router.use cookieParser require('crypto').randomBytes(64).toString "hex" 
  router.use session
    secret : require('crypto').randomBytes(64).toString "hex"
    resave : false
    saveUninitialized : true
    cookie : expires: 60000

  router.use passport.initialize()
  router.use passport.session()
  passport.serializeUser (user, done) -> done null, user
  passport.deserializeUser (user, done) -> done null, user
  passport.use new DiscordStrategy {
    clientID : process.env.clientID
    clientSecret : process.env.clientSecret
    callbackURL : process.env.callbackURL
    scope : ['identify']
  }, (accessToken, refreshToken, profile, cb) ->
        user = await UserSchema.findOne { _id : profile.id }
        if user
          console.log user
        else
          console.log profile
          await new UserSchema({ _id : profile.id, avatarID : profile.avatar }).save()
        cb null, profile
      
