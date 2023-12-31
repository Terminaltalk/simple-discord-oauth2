{ Router } = require "@antibot/server"
router = Router()

router.get "/logout", (req, res) -> 
    req.session.destroy() 
    res.clearCookie("userid")
    res.clearCookie("username")
    res.clearCookie("avatarid")
    res.redirect "/login"

exports.default = router