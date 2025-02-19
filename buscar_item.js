document.addEventListener("DOMContentLoaded", () => {
  const inputSearch = document.getElementById("input-search");
  const btnSearch = document.getElementById("btn-search");

  const tituloRoles = document.querySelector(".h2");

  const list = document.querySelectorAll("span");
  const contenedorTablaRoles = document.querySelector(
    ".contenedor-tabla-roles"
  );

  const tabla = document.getElementById("ContentPlaceHolder1_ogvRolesUsuario");

  // Obtener todas las filas de la tabla (excluyendo el encabezado, si existe)
  const allRows = Array.from(tabla.querySelectorAll("tr"));

  const btnMenuPrincipal = document.createElement("a");
  btnMenuPrincipal.href = "../administracion/inicioCorrecto.aspx";
  btnMenuPrincipal.className = "btn btn-primary";
  btnMenuPrincipal.textContent = "MOSTRAR TODOS LOS ROLES";
  const mensajeBusqueda = document.createElement("div");
  mensajeBusqueda.classList.add("mensaje-busqueda");

  const funcionBusqueda = () => {
    let searched = inputSearch.value.toLowerCase();
    let hasResults = false;
    let allTheads = document.querySelectorAll("th");

    let tablaAux = document.createElement("div");

    // Filtrar y mostrar solo las tarjetas que coinciden con la búsqueda
    for (let row of allRows) {
      let cell = row.querySelector(".acceso-rol");

      if (cell && inputSearch) {
        const cardTitle = cell.textContent.toLocaleLowerCase();

        if (cardTitle.includes(searched)) {
          row.style.display = ""; //Mostrar la fila
          row.style.backgroundColor = "#E3F2FD";
          hasResults = true;
          inputSearch.value = "";
          mensajeBusqueda.innerHTML = "";
        } else {
          row.style.display = "none"; //Ocultar la fila
        }
      } else if (!cell) {
        contenedorTablaRoles.append(btnMenuPrincipal);
      }
    }
    // Mostrar el mensaje si no hay resultados
    if (!hasResults) {
      for (let i = 0; i < allTheads.length; i++) {
        allTheads[i].style.display = "none";
      }
      mensajeBusqueda.innerHTML = "";
      mensajeBusqueda.textContent += `No se encontraron coincidencias para "${inputSearch.value}".`;
      tituloRoles.style.display = "none";
      contenedorTablaRoles.append(mensajeBusqueda);
      inputSearch.value = "";
    }
  };

  // Limpiar input de búsqueda
  if (inputSearch !== "") {
    btnSearch.addEventListener("click", funcionBusqueda);
  }

  // Búsqueda con tecla enter
  if (inputSearch !== "") {
    inputSearch.addEventListener("keydown", (event) => {
      if (event.key === "Enter") {
        event.preventDefault();
        funcionBusqueda();
      }
    });
  }



});
