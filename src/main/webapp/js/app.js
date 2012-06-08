define([
  'jquery',
  'underscore',
  'backbone',
  'cs!router', // Request router.coffee
], function($, _, Backbone, Router){
  var initialize = function(){
    // Pass in our Router module and call it's initialize function
    Router.initialize();
  }
  return {
    initialize: initialize
  };
});