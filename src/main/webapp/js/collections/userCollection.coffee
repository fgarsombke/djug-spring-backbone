define (require) ->

  $ = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'
  userModel = require 'cs!models/userModel'

  userCollection = Backbone.Collection.extend
    url: -> 'users',
    model: userModel

  return userCollection