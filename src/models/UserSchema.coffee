{ Schema, model } = require "mongoose"

User = new Schema
    _id : { type : String }
    avatarID : { type : String }

module.exports = model "users", User