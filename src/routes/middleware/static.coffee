{ Router } = require "@antibot/server"
path = require "path"
express = require "express"
router = Router()

router.use express.static path.join(process.cwd(), "public"), maxAge: 31557600000, extensions: ["css", "png", "js"]

exports.default = router