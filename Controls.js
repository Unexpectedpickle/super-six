/* 
     Created By: Daven Horne
     Created Updated:3/27/2022
     Last Updated: 3/30/2022
     Discription: Load text into and provide functionality to index.html
*/

// const options = {
// 	method: 'GET',
// 	headers: {
// 		'X-RapidAPI-Host': 'jikan1.p.rapidapi.com',
// 		'X-RapidAPI-Key': '27a402064cmsh0b03bb046d77a98p1964e7jsn9d8708392c9c'
// 	}

// };
//Create Event Listeners for buttons
window.onload =()=>{
    document.getElementById("btn1").addEventListener("click", showInfo);
    document.getElementById("btn2").addEventListener("click", hideInfo);
}


//fetch data from API

//Create Fetching API
// let data = {
//     Anime: 'One Piece'
// }

// let fetchData = {
//     method: 'POST',
//     body: JSON.stringify(data),
//     headers: new headers ({
//         'content-Type': 'application/json; charset=UTF-8'
//     })
// }
    

//     fetch('https://jikan1.p.rapidapi.com/search/', fetchData) 
//      .then(function(){
//          .then(response =>{
//             return response.json()
//         })
//         .then(data => console.log(data))
//        })
//        .catch(err => console.error(err));
       
     
         
   
    


//Adding text to HTML page

  document.getElementById("Number 1").innerHTML = "One Piece";
  document.getElementById("Number 2").innerHTML = "FullMetal Alchemist Brotherhood";
  document.getElementById("Number 3").innerHTML = "Yu Yu Hakusho";
  document.getElementById("Number 4").innerHTML = "Gintama";
  document.getElementById("Number 5").innerHTML = "Boku no Hero Academia";
  document.getElementById("para1").innerHTML = "Synopsis <br><br>Gol D. Roger was known as the \"Pirate King,\" the strongest and most infamous being to have sailed the Grand Line. The capture and execution of Roger by the World Government brought a change throughout the world. His last words before his death revealed the existence of the greatest treasure in the world, One Piece. It was this revelation that brought about the Grand Age of Pirates, men who dreamed of finding One Piece which promises an unlimited amount of riches and fame and quite possibly the pinnacle of glory and the title of the Pirate King. <br><br>Enter Monkey D. Luffy, a 17-year-old boy who defies your standard definition of a pirate. Rather than the popular persona of a wicked, hardened, toothless pirate ransacking villages for fun, Luffy's reason for being a pirate is one of pure wonder: the thought of an exciting adventure that leads him to intriguing people and ultimately, the promised treasure. Following in the footsteps of his childhood hero, Luffy and his crew travel across the Grand Line, experiencing crazy adventures, unveiling dark mysteries and battling strong enemies, all in order to reach the most coveted of all fortunes One Piece.";
  document.getElementById("para2").innerHTML = "Synopsis <br><br> After a horrific alchemy experiment goes wrong in the Elric household, brothers Edward and Alphonse are left in a catastrophic new reality. Ignoring the alchemical principle banning human transmutation, the boys attempted to bring their recently deceased mother back to life. Instead, they suffered brutal personal loss: Alphonse's body disintegrated while Edward lost a leg and then sacrificed an arm to keep Alphonse's soul in the physical realm by binding it to a hulking suit of armor. <br><br> The brothers are rescued by their neighbor Pinako Rockbell and her granddaughter Winry. Known as a bio-mechanical engineering prodigy, Winry creates prosthetic limbs for Edward by utilizing \"automail,\" a tough, versatile metal used in robots and combat armor. After years of training, the Elric brothers set off on a quest to restore their bodies by locating the Philosopher's Stone a powerful gem that allows an alchemist to defy the traditional laws of Equivalent Exchange. <br><br>As Edward becomes an infamous alchemist and gains the nickname \"Fullmetal,\" the boys' journey embroils them in a growing conspiracy that threatens the fate of the world.";
  document.getElementById("para3").innerHTML = "Synopsis <br><br> One fateful day, Yuusuke Urameshi, a 14-year-old delinquent with a dim future, gets a miraculous chance to turn it all around when he throws himself in front of a moving car to save a young boy. His ultimate sacrifice is so out of character that the authorities of the spirit realm are not yet prepared to let him pass on. Koenma, heir to the throne of the spirit realm, offers Yuusuke an opportunity to regain his life through completion of a series of tasks. With the guidance of the death god Botan, he is to thwart evil presences on Earth as a Spirit Detective. <br><br>To help him on his venture, Yuusuke enlists ex-rival Kazuma Kuwabara, and two demons, Hiei and Kurama, who have criminal pasts. Together, they train and battle against enemies who would threaten humanity's very existence.";
  document.getElementById("para4").innerHTML = "Synopsis <br><br> Edo is a city that was home to the vigor and ambition of samurai across the country. However, following feudal Japan's surrender to powerful aliens known as the \"Amanto,\" those aspirations now seem unachievable. With the once-influential shogunate rebuilt as a puppet government, a new law is passed that promptly prohibits all swords in public. <br><br>Enter Gintoki Sakata, an eccentric silver-haired man who always carries around a wooden sword and maintains his stature as a samurai despite the ban. As the founder of Yorozuya, a small business for odd jobs, Gintoki often embarks on endeavors to help other people—though usually in rather strange and unforeseen ways. <br><br>Assisted by Shinpachi Shimura, a boy with glasses supposedly learning the way of the samurai; Kagura, a tomboyish girl with superhuman strength and an endless appetite; and Sadaharu, their giant pet dog who loves biting on people's heads, the Yorozuya encounter anything from alien royalty to scuffles with local gangs in the ever-changing world of Edo.";
  document.getElementById("para5").innerHTML = "Synopsis <br><br> The appearance of \"quirks,\" newly discovered super powers, has been steadily increasing over the years, with 80 percent of humanity possessing various abilities from manipulation of elements to shapeshifting. This leaves the remainder of the world completely powerless, and Izuku Midoriya is one such individual. <br><br>Since he was a child, the ambitious middle schooler has wanted nothing more than to be a hero. Izuku's unfair fate leaves him admiring heroes and taking notes on them whenever he can. But it seems that his persistence has borne some fruit: Izuku meets the number one hero and his personal idol, All Might. All Might's quirk is a unique ability that can be inherited, and he has chosen Izuku to be his successor! <br><br>Enduring many months of grueling training, Izuku enrolls in UA High, a prestigious high school famous for its excellent hero training program, and this year's freshmen look especially promising. With his bizarre but talented classmates and the looming threat of a villainous organization, Izuku will soon learn what it really means to be a hero.";
  document.getElementById("t1d1").innerHTML = "1044 Chapters"
  document.getElementById("t1d2").innerHTML = "1013 Episodes"
  document.getElementById("t1d3").innerHTML = "Eiichiro Oda"
  document.getElementById("t2d1").innerHTML = "108 Chapters"
  document.getElementById("t2d2").innerHTML = "64 Episodes"
  document.getElementById("t2d3").innerHTML = "Arakawa Hiromu"
  document.getElementById("t3d1").innerHTML = "175 Chapters"
  document.getElementById("t3d2").innerHTML = "112 Episodes"
  document.getElementById("t3d3").innerHTML = "Togashi Yoshihiro"
  document.getElementById("t4d1").innerHTML = "704 Chapters"
  document.getElementById("t4d2").innerHTML = "201 Episodes (265 total)"
  document.getElementById("t4d3").innerHTML = "Sorachi Hideaki"
  document.getElementById("t5d1").innerHTML = "349 Chapters"
  document.getElementById("t5d2").innerHTML = "13 Episodes (113 total)"
  document.getElementById("t5d3").innerHTML = "Horikoshi Kouhei"
  

//Create showInfo and hideInfo functions
 exInfo = document.querySelectorAll(".extraInfo");
//Loop through elements

 function showInfo(){
     exInfo.forEach(element => {
         element.style.display = "inline-block";
        
     });


 }
 function hideInfo(){
     exInfo.forEach(element => {
         element.style.display = "none";
     });
 }