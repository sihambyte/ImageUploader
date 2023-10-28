function setFlashMessageFadeOut(flashMessageElement) {
    setTimeout(() => {
        let currentOpacity = 1.0;
        let timer = setInterval(() => {
            if (currentOpacity < 0.05) {
                clearInterval(timer);
                flashMessageElement.remove();
            }
            currentOpacity = currentOpacity - .05;
            flashMessageElement.style.opacity = currentOpacity;
        }, 50);

    }, 4000);
}

function addFlashFromFrontEnd(message) {
    let flashMessageDiv = document.createElement('div');
    let innerFlashDiv = document.createElement('div');
    let innerTextNode = document.createTextNode(message);
    innerFlashDiv.appendChild(innerTextNode);
    flashMessageDiv.appendChild(innerFlashDiv);
    flashMessageDiv.setAttribute("id", "flash-message");
    innerFlashDiv.setAttribute('class', "alert alert-info");
    document.getElementsByTagName('body')[0].appendChild(flashMessageDiv);
    setFlashMessageFadeOut(flashMessageDiv);
}

function createCard(postData) {
    return `<div id= "post-${postData.id}" class='card'>
    <img class="card-image" src="${postData.thumbnail}" alt="Missing Image">
    <div class ="card-body">
        <p class ="card-title">${postData.title}</p>
        <p class ="card-text">${postData.description}</p>
        <a href="/post/${postData.id}" class="anchor-buttons">Post Details</a>
    </div>
</div>`;
}

function executeSearch(searchTerm) {
    if (!searchTerm) {
        location.replace('/');
        return;
    }

    let mainContent = document.getElementById('main_content');
    let searchURL = `/posts/search?search=${searchTerm}`;

    fetch(searchURL)
        .then((data) => {
            return data.json();
        })
        .then((data_json) => {
            let newMainContentHTML = '';

            console.log('Received data:', data_json);

            // Check if data is valid before processing
            if (data_json && data_json.results && (Array.isArray(data_json.results) || typeof data_json.results === 'object')) {
                if (Array.isArray(data_json.results)) {
                    data_json.results.forEach((row) => {
                        newMainContentHTML += createCard(row);
                    });
                } else {
                    newMainContentHTML += createCard(data_json.results);
                }

                mainContent.innerHTML = newMainContentHTML;

                // Code executed after search is complete
                if (data_json.message) {
                    addFlashFromFrontEnd(data_json.message);
                }
            } else {
                console.error('No valid data received or data structure is incorrect.');
                // Handle the situation where data isn't as expected
                // This might include showing an error message to the user or other appropriate actions
            }
        })
        .catch((err) => {
            // Handle fetch errors here
            console.error('Fetch failed:', err);
            // Additional error handling if necessary
        });
}
let flashElement = document.getElementById('flash-message');
if (flashElement) {
    setFlashMessageFadeOut(flashElement);
}
// let searchButton = document.getElementById("search-button");
// if (searchButton) {
document.getElementById('search-button').onclick = (event) => {
    event.preventDefault();
    let searchTerm = document.getElementById("search-box").value;
    executeSearch(searchTerm);
    // searchButton.addEventListener('click', executeSearch);
    // searchButton.onclick = executeSearch;
};
// }
