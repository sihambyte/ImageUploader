const checkUsername = (username) => {
    let usernameChecker = /^\D\w{2,}$/;
    return usernameChecker.test(username);
}
const checkPassword = (password, confirmPassword) => {
    var regexCap = /(?=.*[A-Z])/;
    var regexDigit = /(?=.*\d)/;
    var regexSpecial = /(?=.*\W)/;
    if (password === '' || password.length < 8) {
        return false;
    } else if (password.match(regexCap)) {
        if (password.match(regexDigit)) {
            if (password.match(regexSpecial)) {
                if (confirmPassword === password) {
                    return true;
                } else {
                    return false;
                }
            }
        }
    }

}
const checkEmail = (email) => {
    if (email != '') {
        return true;
    } else {
        return false;
    }
}

const registerValidator = (req, res, next) => {
    let username = req.body.username;
    let email = req.body.email;
    let password = req.body.password;
    let confirmPassword = req.body.confirmPassword;
    if (!checkUsername(username)) {
        req.flash('error', "invalid username!!")
        req.session.save(err => {

            res.redirect('/register');
        });
    } else if (!checkEmail(email)) {
        req.flash('error', "invalid email!!")
        req.session.save(err => {

            res.redirect('/register');
        });
    } else if (!checkPassword(password, confirmPassword)) {
        req.flash('error', "invalid password!!")
        req.session.save(err => {

            res.redirect('/register');
        });
    } else {
        next();
    }
}
const loginValidator = (req, res, next) => {
    let username = req.body.username;
    let password = req.body.password;
    if (username === '' || password === '') {
        req.flash('error', "invalid inputs!!")
        req.session.save(err => {

            res.redirect('/login');
        });
    } else {
        next();
    }
}
module.exports = { registerValidator, loginValidator }