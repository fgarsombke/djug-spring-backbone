define (require) ->

  $ = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'
  once = require 'cs!once'
  userView = require 'cs!views/userView'

  AppRouter = Backbone.Router.extend
  
    userView: null

    routes:
      '/users': 'showUsers'
      '*actions': 'defaultAction'
    
    showUsers: () ->
      @userView = once.getUserView()
      @userView.render()
  
    defaultAction: (actions) ->
      ## We have no matching route, lets display the servers
      @showUsers()
      
  initialize: ->
    app_router = new AppRouter()
    Backbone.history.start()
    @