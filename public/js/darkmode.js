const moon = document.querySelector("#moon");
moon.addEventListener("click", function() {
    const body = document.querySelector("body");
    const currentColor = getComputedStyle(body).backgroundColor;
    if (currentColor === "rgb(255, 250, 235)") {
        body.style.backgroundColor = "#1B1B1B";
    } else if (currentColor === "rgb(27, 27, 27)") {
        body.style.backgroundColor = "#fffaeb";
    }
});
