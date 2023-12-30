{ Router }  = require "@antibot/server"
router = Router()
passport = require "passport"
require "../middleware/oauth2"

router.get "/login", (req, res) -> passport.authenticate "discord"

exports.default = router