/* 
    Created By: Dennis Lee
    Created On: 03/27/2022
    Last Updated: 03/27/2022
    Description: Project 0 event handlers and api call
 */

window.onload = function () {
    document.getElementById('search-btn').addEventListener("click", searchBtnClick);
}

const hidden = "hidden";

function searchBtnClick(e) {
    e.preventDefault();
    let btnSelector = document.querySelector('#search-btn');
    setDisabledSubmitButton(btnSelector, true);
    apiCall(document.getElementById('material-to-search').value);
    setTimeout(() => {
        setDisabledSubmitButton(btnSelector, false);
    }, 2000);
}

/*
    Calls async api and renders/hides all relevant DOM elements
*/
function apiCall(materialName) {
    // Validate input
    if (!validInput(materialName)) {
        return;
    }
    let invalidDisplaySelector = document.getElementById('error-input');
    // hide invalid input error message if present
    if (!invalidDisplaySelector.hasAttribute(hidden)) {
        toggleErrorMessage(invalidDisplaySelector);
    }

    let errorDisplay = document.getElementById('error-block');

    // make async call after verifying input is valid
    getMaterial(materialName)
        .then(response => {
            // Fill and render display section
            if (response instanceof Error) {
                // if regular display is still up, hide it in order to show error
                if (!document.getElementById('display-result-section').hasAttribute(hidden)) {
                    toggleInfoDisplay();
                }

                // if previous error message is not up, display it
                if (errorDisplay.hasAttribute(hidden)) {
                    toggleErrorMessage(errorDisplay);
                }
            } else {
                // Fill in correct information and display
                displayResults(response.data);

                // if error message is displayed, hide it
                if (!errorDisplay.hasAttribute(hidden)) {
                    toggleErrorMessage(errorDisplay);
                }
            }
        })
        .catch(error => {
            // if regular display is still up, hide it in order to show error
            if (!document.getElementById('display-result-section').hasAttribute(hidden)) {
                toggleInfoDisplay();
            }

            // if previous error message is not up, display it
            if (errorDisplay.hasAttribute(hidden)) {
                toggleErrorMessage(errorDisplay);
            }
        })
}

function validInput(input) {
    let invalidInputErrorSelector = document.getElementById('error-input');
    if (input === "" && invalidInputErrorSelector.hasAttribute(hidden)) {
        toggleErrorMessage(invalidInputErrorSelector);
        return false;
    }
    return true;
}

/*
    Async method to make api call
*/
async function getMaterial(materialName) {
    const request = new Request('https://botw-compendium.herokuapp.com/api/v2/entry/' + materialName);
    const response = await fetch(request);
    return response.ok
        ? response.json()
        : new Error(response.text());
}

/*
    Fill in html template with returned data from api and render to user
*/
function displayResults(data) {
    let nameSelector = document.querySelector('#name-text');
    nameSelector.innerHTML = data.name;

    let descriptionSelector = document.querySelector('#description-text');
    descriptionSelector.innerHTML = data.description;

    let imageSelector = document.querySelector('#image-id');
    imageSelector.src = data.image;

    let hpSelector = document.querySelector('#hp-id');
    hpSelector.innerHTML = data.hearts_recovered;

    let cookingSelector = document.querySelector('#cook-id');
    let cookingEffect = data.cooking_effect ? data.cooking_effect : "No cooking effect";
    cookingSelector.innerHTML = cookingEffect;

    let locationListSelector = document.querySelector('#location-list');
    // Clear list if existing list is present
    locationListSelector.innerHTML = '';
    if (data.common_locations.length > 0) {
        for (let i =0; i < data.common_locations.length; i++) {
            let listElement = document.createElement("li");
            listElement.innerHTML = data.common_locations[i];
            locationListSelector.appendChild(listElement);
        }
    }
    let listConcat = data.common_locations.length > 0
        ? data.common_locations.join()
        : "No locations found";

    addRowToTable(new Array(data.name, data.description, data.hearts_recovered, cookingEffect, listConcat));

    if (document.getElementById('display-result-section').hasAttribute(hidden)) {
        toggleInfoDisplay();
    }
}

/*
    Sets submit button to be disabled based on boolean value
*/
function setDisabledSubmitButton(selector, value) {
    selector.disabled = value;
}

function toggleErrorMessage(errorMsgSelector) {
    if (errorMsgSelector.hasAttribute(hidden)) {
        errorMsgSelector.removeAttribute(hidden);
    } else {
        errorMsgSelector.setAttribute(hidden, "");
    }
}

function addRowToTable(dataList) {
    let tableSelector = document.getElementById('history-table-id');
    let tableNumColumns = tableSelector.rows[0].cells.length;

    let rowToInsert = tableSelector.getElementsByTagName('tbody')[0].insertRow(-1);

    for (let i = 0; i < tableNumColumns; i++) {
        let cellColumn = rowToInsert.insertCell(i);
        cellColumn.appendChild(document.createTextNode(dataList[i]));
    }
}

/*
    Render/hide display results
*/
function toggleInfoDisplay() {
    let displaySelector = document.getElementById('display-result-section');
    if (displaySelector.hasAttribute(hidden)) {
        displaySelector.removeAttribute(hidden);
        displaySelector.style.display = 'flex';
    } else {
        displaySelector.setAttribute(hidden, "");
        displaySelector.style.display = 'none';
    }
}