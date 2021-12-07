var db = require('../config/database');
const postMiddleware = {}

postMiddleware.getRecentPosts = function(re, res, next) {
    let baseSQL = 'SELECT id, title, description, thumbnail, created FROM posts ORDER BY created DESC LIMIT 8';
    db.execute(baseSQL, []).then(([results, fields]) => {
            res.locals.results = results;
            if (results && results.length == 0) {
                require.flash('error', "There are no posts created yet");
            }
            next();
        })
        .catch((err) => next(err));
}

module.exports = postMiddleware;