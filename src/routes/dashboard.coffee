{ Router } = require "@antibot/server"
router = Router()

router.get "/dashboard", (req, res) ->
    return res.redirect "/api/login" unless req.user
    res.render "dashboard", username : req.user.username, userid : req.user.id, avatarid : req.user.avatar

exports.default = router