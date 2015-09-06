
/**
 * Module dependencies.
 */

var render = require('./lib/render');
var logger = require('koa-logger');
var route = require('koa-route');
var parse = require('co-body');
var koa = require('koa');
var fs = require('fs');
var app = module.exports = koa();
var path = require('path');
var extname = path.extname;

// "database"

var posts = [];

// middleware

app.use(logger());

// route middleware

app.use(route.get('/', list));
app.use(route.get('/post/new', add));
app.use(route.get('/post/:id', show));
app.use(route.post('/post', create));

//new for whs
app.use(route.get('/whs/inbound', getxml945));
app.use(route.post('/whs/goods_receipt', ok));
app.use(route.post('/whs/goods_movement', ok));

app.use(route.post('/whs/xxxxxx/', ok));

app.use(route.get('/whs/outbound', getxml940));
app.use(route.post('/whs/goods_issue', ok));

app.use(route.post('/whs/xxxxxx/', ok));
app.use(route.post('/whs/xxxxxx/', ok));



function* ok(next) {
  //yield next;
  this.type='xml';//
  var post = yield parse(this);
  console.log(post);

  this.type = 'text';
  this.body = 'ok';
}
/**
 * thunkify stat
 */

function stat(file) {
  return function (done) {
    fs.stat(file, done);
  };
}

function* getxml940() {
  var strname = 'outbound_CWRE940Message.xml';
  console.log(this.path);
  console.log(strname);

  var path = __dirname + '/' + strname;

  console.log(path);

  var fstat = yield stat(path);

  if (fstat.isFile()) {
    this.type = extname(path);
    this.body = fs.createReadStream(path);

  }
}

function* getxml945(strname) {
  var strname = 'inbound_CWRE945Message.xml'
  console.log(this.path);
  console.log(strname);

  var path = __dirname + '/' + strname;

  console.log(path);

  var fstat = yield stat(path);

  if (fstat.isFile()) {
    this.type = extname(path);
    this.body = fs.createReadStream(path);

  }
}

// route definitions

/**
 * Post listing.
 */

function* list() {
  this.body = yield render('list', { posts: posts });
}

/**
 * Show creation form.
 */

function* add() {
  this.body = yield render('new');
}

/**
 * Show post :id.
 */

function* show(id) {
  var post = posts[id];
  if (!post) this.throw(404, 'invalid post id');
  this.body = yield render('show', { post: post });
}

/**
 * Create a post.
 */

function* create() {
  var post = yield parse(this);
  var id = posts.push(post) - 1;
  post.created_at = new Date;
  post.id = id;
  this.redirect('/');
}

// listen

app.listen(3000);
console.log('listening on port 3000');