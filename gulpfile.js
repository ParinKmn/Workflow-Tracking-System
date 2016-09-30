/******importing all required packages***************/

var gulp = require('gulp'),
    sass = require('gulp-sass'),
    wiredep = require('wiredep').stream,
    del  = require('del'),
    preprocess = require('gulp-preprocess'),
    inject = require('gulp-inject'),
    uglify = require('gulp-uglify'),
    imagemin = require('gulp-imagemin'),
    config = require('./gulp.config');

/***********task automation for the index,forgot-password*********************/

gulp.task('html',function(){
  console.log("Injection of bower components in the HTML");
  return gulp.src(config.html.in)
             .pipe(preprocess({context: config.html.context}).on('error',console.error.bind(console)))
             .pipe(wiredep(config.bowerOptions))
             .pipe(gulp.dest(config.html.out));
});

/*********** task automation*********************/

gulp.task('loggedin',function(){
  console.log("Injection of bower components in the HTML in the loggedin");
  return gulp.src(config.loggedin.in)
             .pipe(preprocess({context: config.loggedin.context}).on('error',console.error.bind(console)))
             .pipe(wiredep(config.bowerOptions))
             .pipe(gulp.dest(config.loggedin.out));
});


gulp.task('sass',function(){
  console.log("Conversion of sass into css");
  return gulp.src(config.sass.in)
             .pipe(sass(config.sassOptions).on('error',console.error.bind(console)))
             .pipe(gulp.dest(config.sass.out));
});


gulp.task('js',function(){
  console.log("Addition and minification of custom js files");
  return gulp.src(config.js.in)
             .pipe(uglify().on('error',console.error.bind(console)))
             .pipe(gulp.dest(config.js.out));
});
gulp.task('images',function(){
  console.log("Adding images to the build folder.....");
  return gulp.src(config.images.in)
              //.pipe(size({title: "Image size:"}))
              //.pipe(newer(images.out))
              .pipe(imagemin())
              //.pipe(size({title: "Image size:"}))
              .pipe(gulp.dest(config.images.out));
});
// gulp.task('inject',['html','sass','js'],function(){
//   console.log("Injection of custom css files");
//   return gulp.src(config.html.index)
//              .pipe(inject(gulp.src([config.css,config.buildjs])).on('error',console.error.bind(console)))
//              .pipe(gulp.dest(config.html.dest));
// });

gulp.task('del',function(){
  console.log("Deletion of files in the build folder");
  del([ config.dest + '*']);
});

gulp.task('watch',function(){
  gulp.watch(config.html.watch ,['html']);
  gulp.watch(config.loggedin.watch ,['loggedin']);
  gulp.watch(config.sass.watch ,['sass']);
  gulp.watch(config.js.watch ,['js']);
  gulp.watch(config.images.in,['images']);
});

gulp.task('default',['html','loggedin','images','sass','js','watch']);
