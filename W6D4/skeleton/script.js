document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const addToList = (e) => {
    e.preventDefault();
    const placesList = document.querySelector("#sf-places");
    const input = document.querySelector(".favorite-input");
    const newPlace = input.value;

    const li = document.createElement("li");
    li.textContent = newPlace;
    placesList.appendChild(li);
  };

  const addButton = document.querySelector(".favorite-submit");
  addButton.addEventListener("click", addToList);

  // adding new photos

  



});
