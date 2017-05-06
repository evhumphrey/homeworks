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
  const togglePhotoForm = (e) => {
    e.preventDefault();

    const form = document.querySelector(".photo-form-container");
    console.log(form);
    form.classList.toggle("hidden");
  };

  const togglePhotoFormButton = document.querySelector(".photo-show-button");
  togglePhotoFormButton.addEventListener("click", togglePhotoForm);

  const addPhoto = (e) => {
    e.preventDefault();

    const urlInput = document.querySelector(".photo-url-input");
    const newPhotoUrl = urlInput.value;
    urlInput.value = "";

    const photoList = document.querySelector(".dog-photos");
    const newLi = document.createElement("li");
    const newPhoto = document.createElement("img");
    newPhoto.setAttribute('src', newPhotoUrl);



    newLi.appendChild(newPhoto);
    photoList.appendChild(newLi);
  };

  const addPhotoButton = document.querySelector(".photo-url-submit");
  addPhotoButton.addEventListener("click", addPhoto);


});
