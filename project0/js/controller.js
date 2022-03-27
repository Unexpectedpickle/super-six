/* 
    Created By: Dennis Lee
    Created On: 03/27/2022
    Last Updated: 03/27/2022
    Description: Project 0 event handlers and api call
 */

window.onload = function () {
    document.getElementById('search-btn').addEventListener("click", searchBtnClick);
}

function searchBtnClick(e) {
    e.preventDefault();
    let btnSelector = document.querySelector('#search-btn');
    setDisabledSubmitButton(btnSelector, true);
    console.log(document.getElementById('material-to-search').value);
    setTimeout(() => {
        setDisabledSubmitButton(btnSelector, false);
    }, 2000);
}

/*
    Calls async api and renders/hides all relevant DOM elements
*/
function apiCall(materialName) {

}

/*
    Sets submit button to be disabled based on boolean value
*/
function setDisabledSubmitButton(selector, value) {
    selector.disabled = value;
}

function toggleErrorMessage(errorMsgSelector) {
    if (errorMsgSelector.hasAttribute("hidden")) {
        errorMsgSelector.removeAttribute("hidden");
    } else {
        errorMsgSelector.setAttribute("hidden", "");
    }
}

function addRowToTable() {
    let tableSelector = document.getElementById('history-table-id');
    let tableNumColumns = tableSelector.rows[0].cells.length;

    let rowToInsert = tableSelector.getElementsByTagName('tbody')[0].insertRow(-1);

    for (let i = 0; i < tableNumColumns; i++) {
        let cellColumn = rowToInsert.insertCell(i);
        cellColumn.appendChild(document.createTextNode("placeholder"));
    }
}

/*
    Fill in html template with returned data from api and render to user
*/
function displayResults() {
    let nameSelector = document.querySelector('#name-id');
    nameSelector.after(document.createTextNode("Placeholder name"))

    let descriptionSelector = document.querySelector('#description-id');
    descriptionSelector.after(document.createTextNode("Placeholder description"))

    let imageSelector = document.querySelector('#image-id');
    let newImage = document.createElement("img");
    newImage.src = "url";
    newImage.alt = "material picture";
    imageSelector.after(newImage);

    let hpSelector = document.querySelector('#hp-id');
    hpSelector.after(document.createTextNode("Placeholder hp"));

    let cookingSelector = document.querySelector('#cook-id');
    cookingSelector.after(document.createTextNode("Placeholder cooking effect"));

    let locationSelector = document.querySelector('#location-id');
    locationSelector.after(document.createTextNode("Placeholder location"));

    if (document.getElementById('display-result-section').hasAttribute("hidden")) {
        toggleInfoDisplay();
    }
}

/*
    Render/hide display results
*/
function toggleInfoDisplay() {
    let displaySelector = document.getElementById('display-result-section');
    if (displaySelector.hasAttribute("hidden")) {
        displaySelector.removeAttribute("hidden");
        displaySelector.style.display = 'flex';
    } else {
        displaySelector.setAttribute("hidden", "");
        displaySelector.style.display = 'none';
    }
}