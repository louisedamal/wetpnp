const rating = () =>{
  const stars = document.querySelectorAll(".star")

  stars.forEach((star) => {
    star.addEventListener("click", (event) =>{
      document.getElementById("review_rating").value = star.dataset.value
    });
  });
};

export {rating}

