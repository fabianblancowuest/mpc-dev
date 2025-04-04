// document.addEventListener("DOMContentLoaded", () => {
//   const inputSearch = document.getElementById("input-search");
//   const btnSearch = document.getElementById("btn-search");

//   const tituloRoles = document.querySelector(".titulo-rol");

//   const list = document.querySelectorAll("span");
//   const contenedorTablaRoles = document.querySelector(
//     ".contenedor-tabla-roles"
//   );

//   contenedorTablaRoles.style.minHeight = "60vh";

//   const tabla = document.getElementById("ContentPlaceHolder1_ogvRolesUsuario");

//   // Obtener todas las filas de la tabla (excluyendo el encabezado, si existe)
//   // if(allRows) {
//   const allRows = Array.from(tabla.querySelectorAll("tr"));
//   // }

//   const botonesNuevoRegistro = document.querySelectorAll(".btn-success");
//   console.log("botones", botonesNuevoRegistro);

//   botonesNuevoRegistro.forEach((boton) => {
//     if (boton.value.trim() === "Nuevo Registro") {
//       const nuevoRegistroIco = document.createElement("i");
//       nuevoRegistroIco.className = "bi bi-file-plus-fill";
//       boton.value += "Hola";
//     }
//   });

//   const btnMenuPrincipal = document.createElement("a");
//   btnMenuPrincipal.href = "../administracion/inicioCorrecto.aspx";
//   btnMenuPrincipal.className = "btn btn-primary";
//   btnMenuPrincipal.id = "btnMostrarTodosLosRoles";
//   btnMenuPrincipal.textContent = "MOSTRAR TODOS LOS ROLES";
//   const mensajeBusqueda = document.createElement("div");
//   mensajeBusqueda.classList.add("mensaje-busqueda");

//   const imgNoEncontrado = document.createElement("img");
//   imgNoEncontrado.src = "../img/pagina-no-encontrada.png";
//   imgNoEncontrado.classList.add("img-no-encontrado");

//   const funcionBusqueda = () => {
//     let searched = inputSearch.value.toLowerCase();
//     let hasResults = false;
//     let allTheads = document.querySelectorAll("th");

//     let tablaAux = document.createElement("div");
//     // Filtrar y mostrar solo las tarjetas que coinciden con la búsqueda

//     for (let row of allRows) {
//       let cell = row.querySelector(".acceso-rol");

//       if (cell && inputSearch) {
//         const cardTitle = cell.textContent.toLocaleLowerCase();

//         if (cardTitle.includes(searched)) {
//           //Mostrar la fila
//           row.style.display = "";
//           row.style.backgroundColor = "#E3F2FD";
//           hasResults = true;
//           inputSearch.value = "";
//           mensajeBusqueda.innerHTML = "";
//         } else {
//           row.style.display = "none"; //Ocultar la fila
//         }
//       } else if (!cell) {
//         contenedorTablaRoles.append(btnMenuPrincipal);
//       }
//     }

//     // Mostrar el mensaje si no hay resultados
//     if (!hasResults) {
//       for (let i = 0; i < allTheads.length; i++) {
//         allTheads[i].style.display = "none";
//       }
//       mensajeBusqueda.innerHTML = "";
//       const inputSearchValue = document.createElement("span");
//       inputSearchValue.textContent = `"${inputSearch.value}".`;
//       inputSearchValue.style.fontWeight = "bold";
//       // mensajeBusqueda.textContent += `No se encontraron coincidencias para "${inputSearchValue}".`;
//       mensajeBusqueda.textContent += `No se encontraron coincidencias para `;
//       mensajeBusqueda.append(inputSearchValue);
//       document.querySelector("table").style.display = "none";
//       mensajeBusqueda.style.order = "1";
//       document.getElementById("btnMostrarTodosLosRoles").style.order = "2";
//       tituloRoles.style.display = "none";
//       contenedorTablaRoles.append(mensajeBusqueda);
//       // contenedorTablaRoles.style.minHeight = "60vh";
//       contenedorTablaRoles.append(imgNoEncontrado);
//       inputSearch.value = "";
//     }
//   };

//   btnSearch.addEventListener("click", () => {
//     if (!inputSearch.value) {
//       // alert("Debe ingresar un criterio de búsqueda")
//       Swal.fire({
//         icon: "error",
//         title: "Oops...",
//         text: "¡Debe ingresar un criterio de búsqueda!",
//         confirmButtonText: "Entendido",
//       });
//     } else {
//       funcionBusqueda();
//     }
//   });

//   // Búsqueda con tecla enter
//   inputSearch.addEventListener("keydown", (event) => {
//     if (event.key === "Enter") {
//       event.preventDefault();
//       if (!inputSearch.value) {
//         Swal.fire({
//           icon: "error",
//           title: "Oops...",
//           text: "¡Debe ingresar un criterio de búsqueda!",
//         });
//       } else {
//         funcionBusqueda();
//       }
//     }
//   });

//   console.log(btnSearch);
//   console.log(tabla);
// });

// Nuevo

document.addEventListener("DOMContentLoaded", (event) => {
  event.preventDefault();
  const inputSearch = document.getElementById("input-search");
  const btnSearch = document.getElementById("btn-search");
  const tituloRoles = document.querySelector(".titulo-rol");
  const contenedorTablaRoles = document.querySelector(
    ".contenedor-tabla-roles"
  );
  contenedorTablaRoles.style.minHeight = "60vh";

  const tabla = document.getElementById("ContentPlaceHolder1_ogvRolesUsuario");
  const allRows = Array.from(tabla.querySelectorAll("tr"));
  const botonesNuevoRegistro = document.querySelectorAll(".btn-success");

  botonesNuevoRegistro.forEach((boton) => {
    if (boton.value.trim() === "Nuevo Registro") {
      boton.value += "Hola";
    }
  });

  // const btnMenuPrincipal = document.createElement("a");
  // btnMenuPrincipal.href = "../administracion/inicioCorrecto.aspx";
  // btnMenuPrincipal.className = "btn btn-primary";
  // btnMenuPrincipal.id = "btnMostrarTodosLosRoles";
  // btnMenuPrincipal.textContent = "MOSTRAR TODOS LOS ROLES";
  // btnMenuPrincipal.style.display = "none";

  const mensajeBusqueda = document.createElement("div");
  mensajeBusqueda.classList.add("mensaje-busqueda");

  const imgNoEncontrado = document.createElement("img");
  imgNoEncontrado.src = "../img/pagina-no-encontrada.png";
  imgNoEncontrado.classList.add("img-no-encontrado");

  const funcionBusqueda = () => {
    let searched = inputSearch.value.toLowerCase().trim();
    let hasResults = false;
    let allTheads = document.querySelectorAll("th");

    allRows.forEach((row) => {
      let cell = row.querySelector(".acceso-rol");
      if (cell) {
        const cardTitle = cell.textContent.toLowerCase();
        if (cardTitle.includes(searched)) {
          row.style.display = "";
          row.style.backgroundColor = "#E3F2FD";
          hasResults = true;
        } else {
          row.style.display = "none";
        }
      }
    });

    if (!hasResults) {
      allTheads.forEach((th) => (th.style.display = "none"));
      mensajeBusqueda.innerHTML = `No se encontraron coincidencias para <strong>"${searched}"</strong>.`;
      document.querySelector("table").style.display = "none";
      tituloRoles.style.display = "none";
      contenedorTablaRoles.append(mensajeBusqueda, imgNoEncontrado);
      imgNoEncontrado.style.display = "block";
    } else {
      imgNoEncontrado.style.display = "none";
      mensajeBusqueda.innerHTML = "";
      document.querySelector("table").style.display = "";
      tituloRoles.style.display = "";
      const btnMenuPrincipal = document.createElement("a");
      btnMenuPrincipal.href = "../administracion/inicioCorrecto.aspx";
      btnMenuPrincipal.className = "btn btn-primary";
      btnMenuPrincipal.id = "btnMostrarTodosLosRoles";
      btnMenuPrincipal.textContent = "MOSTRAR TODOS LOS ROLES";
    }
  };

  // Escucha el evento de entrada para búsqueda en tiempo real
  inputSearch.addEventListener("input", funcionBusqueda);

  // También se mantiene la opción de hacer clic en el botón de búsqueda
  btnSearch.addEventListener("click", () => {
    if (!inputSearch.value.trim()) {
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

  console.log(btnSearch, tabla);
});
