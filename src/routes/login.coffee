{ Router }  = require "@antibot/server"
router = Router()
passport = require "passport"

router.get "/login", (req, res) -> res.render "login"

router.get "/api/login", passport.authenticate "discord"

exports.default = router