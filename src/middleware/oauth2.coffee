DiscordStrategy = require("passport-discord").Strategy
passport = require "passport"
passport.serializeUser (user, done) -> done null, user
passport.deserializeUser (user, done) -> done null, user
passport.use new DiscordStrategy {
  clientID: process.env.clientID
  clientSecret: process.env.clientSecret
  callbackURL: process.env.callbackURL
  scope: ['identify']
}, (accessToken, refreshToken, profile, cb) ->
    return cb err, user