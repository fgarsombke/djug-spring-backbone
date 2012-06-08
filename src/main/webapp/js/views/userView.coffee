define (require) ->

  $ = require 'jquery'
  _ = require 'underscore'
  Backbone = require 'backbone'
  userCollection = require 'cs!collections/userCollection'  
  userModel = require 'cs!models/userModel'  
  userTemplate = require 'text!templates/user/userTemplate.html'
  
  class userView extends Backbone.View
  
    el: $("#page")

    init: (options)->
      @userCollection = new userCollection()
      @userCollection.bind 'reset', @render, @      
      ## render the page after any changes in the collection - refresh the page to reflect the server that was removed
      @userCollection.bind 'remove', @render, @
      @refreshData()

    events:
        "click .createUser": "createUser" 
        "click .deleteUser": "deleteUser" 

    createUser: ->
      ## Create a new user model instance and set the fields from the form
      newUserModel = new userModel()
      userName = $("#userName").val()
      newUserModel.set 'name', userName
      ## persist the model
      @userCollection.create newUserModel, success: (model, response) =>
        @refreshData()
        error: (model, response) ->        
          console.log 'ERROR' + response

    deleteUser: (event)->
      ## retrieve the id from clicked icon
      userId = $(event.currentTarget).attr 'id'        
      ## destroy the model
      modelToDestroy = @userCollection.get userId
      modelToDestroy.destroy()
      ## remove the model from the collection
      @userCollection.remove(modelToDestroy);
          
    refreshData: ->
      @userCollection.fetch()
      
    render: ->
      sortedByNameUsers = _.sortBy @userCollection.models, (model) ->
        model.get 'name'
      data = 
        users : sortedByNameUsers
        _: _ 
      compiledTemplate = _.template userTemplate, data
      @$el.html compiledTemplate
  
  return userView