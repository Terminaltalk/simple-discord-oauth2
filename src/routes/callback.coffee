{ Router } = require "@antibot/server"
passport = require "passport"
session = require "express-session"
DiscordStrategy = require("passport-discord").Strategy
UserSchema = require "../models/UserSchema"

router = Router()

require("../middleware/oauth2")(router)

router.get "/api/callback", passport.authenticate("discord", failureRedirect: "/api/login"), (req, res) ->
    res.redirect "/dashboard" 

exports.default = router
