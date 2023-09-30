var express = require('express');
var router = express.Router();
var isLoggedIn = require('../middleware/routeprotectors').userIsLoggedIn;
const { getRecentPosts, getPostById, getCommentsByPostId } = require('../middleware/postsmiddleware');
var db = require('../config/database');

/* GET home page. */
router.get('/', getRecentPosts, function(req, res, next) {
    res.render('index', { title: 'CSC 317 App', name: "Siham A Argaw" });
});
// Get to Login Page
router.get('/login', function(req, res, next) {
    res.render('login');
});
// Get to Registeration Page
router.get('/register', function(req, res, next) {
    res.render('registration');
});
// Get to Post Image Page
router.use('/postimage', isLoggedIn)
router.get('/postimage', function(req, res, next) {
    res.render('postimage');
});

// Get to View Post Page
router.get('/post/:id(\\d+)', getPostById, getCommentsByPostId, (req, res, next) => {
    res.render('viewpost', { title: `Post ${req.params.id}` });
});
module.exports = router;