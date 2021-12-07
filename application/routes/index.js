var express = require('express');
var router = express.Router();
var isLoggedIn = require('../middleware/routeprotectors').userIsLoggedIn;
var getRecentPosts = require('../middleware/postsmiddleware').getRecentPosts;
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
router.get('/post/:id(\\d+)', (req, res, next) => {
    let baseSQL = "SELECT u.username, p.title, p.description, p.photopath, p.created\
    FROM csc317db.users u\
    JOIN csc317db.posts p\
    ON u.id = fk_userid\
    WHERE p.id =?;";

    let postId = req.params.id; //post id of the URL given
    db.execute(baseSQL, [postId]).then(([results, fields]) => {
        if (results && results.length) {
            let post = results[0];
            res.render('viewpost', { currentPost: post });
        } else {
            req.flash('error', "This is not the post you are looking for!");
            res.redirect('/');
        }
    })


});
module.exports = router;