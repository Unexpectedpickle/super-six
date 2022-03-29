/* 
  Created By: Anna K. Phung
  Last Updated: March 29, 2022
  Description: Fetch API call & DOM manipulation
*/

async function getVillager(villagerName) {
  villagerName = apiName(villagerName);

  const req = new Request('https://acnhapi.com/v1/villagers/' + villagerName);

  const response = await fetch(req);
  if (!response.ok) {
    throw new Error(res);
  }

  return response.json();
};

window.onload = () => {
  document.querySelector("#srch-btn").addEventListener("click", updateVillager);
  document.querySelector(".input-box").addEventListener("keydown", updateVillager);

  let input = document.querySelector(".input-box");
  input.focus();
}

let villagerData;


