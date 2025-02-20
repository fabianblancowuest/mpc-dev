document.addEventListener("DOMContentLoaded", () => {
  const inputSearch = document.getElementById("input-search");
  const btnSearch = document.getElementById("btn-search");

  const tituloRoles = document.querySelector(".titulo-rol");

  const list = document.querySelectorAll("span");
  const contenedorTablaRoles = document.querySelector(
    ".contenedor-tabla-roles"
  );

  contenedorTablaRoles.style.minHeight = "60vh";

  const tabla = document.getElementById("ContentPlaceHolder1_ogvRolesUsuario");

  // Obtener todas las filas de la tabla (excluyendo el encabezado, si existe)
  // if(allRows) {
  const allRows = Array.from(tabla.querySelectorAll("tr"));
  // }

  const botonesNuevoRegistro = document.querySelectorAll(".btn-success");
  console.log("botones", botonesNuevoRegistro);

  botonesNuevoRegistro.forEach((boton) => {
    if (boton.value.trim() === "Nuevo Registro") {
      const nuevoRegistroIco = document.createElement("i");
      nuevoRegistroIco.className = "bi bi-file-plus-fill";
      boton.value += "Hola";
    }
  });

  const btnMenuPrincipal = document.createElement("a");
  btnMenuPrincipal.href = "../administracion/inicioCorrecto.aspx";
  btnMenuPrincipal.className = "btn btn-primary";
  btnMenuPrincipal.id = "btnMostrarTodosLosRoles";
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
      document.querySelector("table").style.display = "none";
      mensajeBusqueda.style.order = "1";
      document.getElementById("btnMostrarTodosLosRoles").style.order = "2";
      tituloRoles.style.display = "none";
      contenedorTablaRoles.append(mensajeBusqueda);
      // contenedorTablaRoles.style.minHeight = "60vh";
      inputSearch.value = "";
    }
  };

  btnSearch.addEventListener("click", () => {
    if (!inputSearch.value) {
      // alert("Debe ingresar un criterio de búsqueda")
      Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "¡Debe ingresar un criterio de búsqueda!",
        confirmButtonText: "Entendido",
      });
    } else {
      funcionBusqueda();
    }
  });

  // Búsqueda con tecla enter
  inputSearch.addEventListener("keydown", (event) => {
    if (event.key === "Enter") {
      event.preventDefault();
      if (!inputSearch.value) {
        Swal.fire({
          icon: "error",
          title: "Oops...",
          text: "¡Debe ingresar un criterio de búsqueda!",
        });
      } else {
        funcionBusqueda();
      }
    }
  });

  console.log(btnSearch);
  console.log(tabla);

  // Ocultar flecha arriba
  const ocultarFlecha = document.querySelector("#ocultarFlecha div span");
  const mostrarFlechaTextIco = ` Mostrar flecha`;
  const ocultarFlechaTextIco = ` Ocultar flecha`;

  ocultarFlecha.addEventListener("click", () => {
    document.getElementById("flechaArriba").classList.toggle("oculto");
    if (ocultarFlecha.textContent === " Ocultar flecha") {
      ocultarFlecha.innerHTML = mostrarFlechaTextIco;
    } else {
      ocultarFlecha.innerHTML = ocultarFlechaTextIco;
      // ocultarFlecha.textContent = "Ocultar flecha";
    }
  });
});
