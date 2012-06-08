define (require) ->

  $ = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'
  userTemplate = require 'text!templates/user/userTemplate.html'
  
  userView = Backbone.View.extend
  
    el: $("#page")

    render: ->
      compiledTemplate = _.template userTemplate
      @$el.html compiledTemplate
  
  return userView