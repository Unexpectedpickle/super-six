const input = document.querySelector('.inputValue');
const button = document.querySelector('.submit');
const bugValue = document.querySelector('.bug-name');
const month = document.querySelector('.month-available');
const time = document.querySelector('.time-available');
const locationType = document.querySelector('.location');
const rarity = document.querySelector('.rarity');
const price = document.querySelector('.price');
const museumPhrase = document.querySelector('.museum-phrase');
const bugIcon = document.querySelector('.icon');

button.addEventListener('click', function(){
  fetch('https://acnhapi.com/v1/bugs/'+input.value)
    .then(response => response.json())
    .then(data => {
      console.log(data)

      let nameValue = data['name']['name-USen'];
      let monthAvailability = data['availability']['month-northern'];
      let timeAvailability = data['availability']['time'];
      let locationValue = data['availability']['location'];
      let rarityValue = data['availability']['rarity'];
      let priceValue = data['price'];
      let blathersPhrase = data['museum-phrase'];
      let iconValue = data['id'];
      
      bugValue.innerHTML = "Name: " + nameValue;
      month.innerHTML = "Month Available: " + monthAvailability;
      time.innerHTML = "Time Available: " + timeAvailability;
      locationType.innerHTML = "Location: " + locationValue;
      rarity.innerHTML = "Rarity: " + rarityValue;
      price.innerHTML = "Price: " + priceValue + " Bells";
      museumPhrase.innerHTML = "Blathers Fun Fact: " + blathersPhrase;
      bugIcon.setAttribute("src", "https://acnhapi.com/v1/icons/bugs/" + iconValue);
    })

    .catch(err => alert("Sorry! We don't know that bug."))
})

