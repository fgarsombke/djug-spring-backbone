define (require) ->

  $ = require 'jquery'
  _ = require 'underscore'
  userView = require 'cs!views/userView'

  createUserView = ->
    return new userView()
      
  getUserView : _.once(createUserView)