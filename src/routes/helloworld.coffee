{ Router } = require "@antibot/server"
router = Router()

router.get "/helloworld", (req, res) -> res.status(200).json message : "Hello World!"

exports.default = router