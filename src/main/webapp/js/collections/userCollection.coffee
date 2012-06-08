define (require) ->

  $ = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'
  userModel = require 'cs!models/userModel'

  class userCollection extends Backbone.Collection
  
    url: -> 'users'
  
    model: userModel

  return userCollection