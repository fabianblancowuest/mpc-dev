document.addEventListener("DOMContentLoaded", () => {
  const btnImprimir = document.getElementById("btn-imprimir");

  window.addEventListener("beforeprint", () => {
    document.getElementById("Label1").textContent = "Barrio: ";
    document.getElementById("Label3").textContent = "Manzana: ";
  });

  window.addEventListener("afterprint", () => {
    document.getElementById("Label1").textContent = "Seleccione Barrio: ";
    // document.getElementById("Label3").textContent = "Seleccione Manzana: ";
  });

  btnImprimir.addEventListener("click", (event) => {
    event.preventDefault();

    console.log("click");
    window.print();
  });
});
