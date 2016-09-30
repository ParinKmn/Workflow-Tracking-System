/***source & destination ********/
var source = "source/";
var destination = "build/";
var loggedin = source + "loggedin/";
/*******************************/

/***********source setup****************/
/******assets source *****************/
var css = source + "assets/css/";
var js = source + "assets/js/";
var images = source + "assets/images/"
/***********************************/

/********destination setup ************/
var loggedinDestination = destination + "loggedin/";
var cssDestination = destination + "assets/css/";
var jsDestination = destination + "assets/js/";
var imagesDestination = destination + "assets/images/";
/*************************************/

/******bower components*********/
var bower = "bower.json";
var bower_directory = "bower_components/";
/********************************/

/********Exposing the initial config****************/
module.exports = {
  destination : destination,
  html : {
     in: source + '*.html',
     watch: [source + '*.html',source + 'partials/**/*',source + 'includes/**/*'],
     out: destination
  },
  loggedin : {
    in : loggedin + '*.html',
    watch : [ loggedin + '*.html,', loggedin + 'partials/**/*',loggedin + 'includes/**/*'],
    out : loggedinDestination
  },
  sass : {
    in: css + 'main.scss',
    watch : [css + '*.scss', css + '/**/*.scss'],
    out : cssDestination
  },
  js : {
    in : js + "*.js",
    out : jsDestination
  },
  images : {
    in: [images + '*', images + '/**/*'],
    out: imagesDestination
  },
  sassOptions : {
    outputStyle: 'nested',
    imagePath: '../images',
    precision: 3,
    errLogToConsole: true
  },
  bowerOptions : {
    bower,
    bower_directory
  }
};
