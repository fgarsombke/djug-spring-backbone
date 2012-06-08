// main.js using RequireJS 2.0.1
require.config({
    paths: {
         //Major libraries
        'jquery': 'libs/jquery/1.7.2/jquery.min',
        'underscore': 'libs/underscore/1.3.1-amdjs/underscore-min', // AMD support
        'backbone': 'libs/backbone/0.9.1-amdjs/backbone-min', // AMD support
        // Require.js plugins
        'text': 'libs/require/2.0.1/text',
        'domReady': 'libs/require/2.0.1/domReady',
        'cs': 'libs/require/2.0.1/cs',
        // Just a short cut so we can put our html outside the js dir
        // When you have HTML/CSS designers this aids in keeping them out of the js directory        
        'templates': '../templates'       
    }
});

require([
    'domReady', // optional, using RequireJS domReady plugin
    'app',
], function(domReady, app){
    domReady(function () {
        app.initialize();
    });
});