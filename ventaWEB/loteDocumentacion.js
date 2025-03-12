const menuBotones2 = document.getElementById("botones-menu");

const links2 = document.querySelectorAll("td a");

for (let i = 0; i < links2.length; i++) {
  links2[i].addEventListener("click", (event) => {
    if (links2[i].href.includes("javascript:__doPostBack")) {
      setTimeout(() => {}, 500);
      menuBotones2.style.display = "none";
    }
  });
}
