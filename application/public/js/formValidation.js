const form = document.getElementById('form');
const username = document.getElementById('userName');
const email = document.getElementById('email');
const password = document.getElementById('password');
const password2 = document.getElementById('confirmPassword');


form.addEventListener('submit', e => {
    e.preventDefault();

    checkInputs();
});

function checkInputs() {
    // trim to remove the whitespaces
    const usernameValue = username.value.trim();
    const emailValue = email.value.trim();
    const passwordValue = password.value.trim();
    const password2Value = password2.value.trim();
    var alphanumerics = /^[0-9a-zA-Z]+$/;
    firstLetter = usernameValue.charAt(0);
    var regexCap = /(?=.*[A-Z])/;
    var regexDigit = /(?=.*\d)/;
    var regexSpecial = /(?=.*\W)/;

    if (usernameValue === '' || usernameValue.length < 3) {
        setErrorFor(username, 'Username length should be at least 3 ');
    } else if (usernameValue.match(alphanumerics)) {
        if ((firstLetter >= "a" && firstLetter <= "z") ||
            (firstLetter >= "A" && firstLetter <= "Z")) {
            setSuccessFor(username);
        } else {
            setErrorFor(username, 'Username must begin with a letter');
        }
    } else {
        setErrorFor(username, 'Alphanumeric characters only');
    }

    if (emailValue === '') {
        setErrorFor(email, 'Email cannot be blank');
    } else {
        setSuccessFor(email);
    }

    if (passwordValue === '' || passwordValue.length < 8) {
        setErrorFor(password, 'Password length should be at least 8');
    } else if (passwordValue.match(regexCap)) {
        if (passwordValue.match(regexDigit)) {
            if (passwordValue.match(regexSpecial)) {
                setSuccessFor(password);
            } else {
                setErrorFor(password, "Need at least one special character");
            }
        } else {
            setErrorFor(password, "Need at least one digit");
        }
    } else {
        setErrorFor(password, 'Need at least one capital letter');
    }


    if (password2Value === '') {
        setErrorFor(password2, 'Confirm Password cannot be blank');
    } else if (passwordValue !== password2Value) {
        setErrorFor(password2, 'Passwords does not match');
    } else {
        setSuccessFor(password2);
    }
}

function setErrorFor(input, message) {
    const formControl = input.parentElement;
    const small = formControl.querySelector('small');
    formControl.className = 'form-control error';
    small.innerText = message;
}

function setSuccessFor(input) {
    const formControl = input.parentElement;
    formControl.className = 'form-control success';

}