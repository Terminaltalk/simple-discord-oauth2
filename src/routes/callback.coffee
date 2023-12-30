{ Router }  = require "@antibot/server"
router = Router()
passport = require "passport"
require "../middleware/oauth2"

router.get "/api/callback", (req, res) -> passport.authenticate "discord", failureRedirect : "/login"

exports.default = router