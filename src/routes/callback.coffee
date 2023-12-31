{ Router } = require "@antibot/server"
passport = require "passport"
session = require "express-session"
DiscordStrategy = require("passport-discord").Strategy
UserSchema = require "../models/UserSchema"

router = Router()

require("../middleware/oauth2")(router)

router.get "/api/callback", passport.authenticate("discord", failureRedirect: "/api/login"), (req, res) ->
    req.session.user = userid : req.user.id, username : req.user.username, avatarid : req.user.avatar
    defaultOptions =
            maxAge : 90000
            httpOnly : true
            signed : true
    res.cookie "userid", req.session.user.id, defaultOptions
    res.cookie "username", req.session.user.username, defaultOptions
    res.cookie "avatarid", req.session.user.avatarid, defaultOptions
    res.redirect "/dashboard" 

exports.default = router
