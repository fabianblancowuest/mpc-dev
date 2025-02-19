document.addEventListener("DOMContentLoaded", function () {
    const modalPremios = document.getElementById("premiosPrincipales");
    const botonPremios = document.getElementById("obutPremios");
    const closePremios = document.getElementById("closeModalPremios");
    const closeBases = document.getElementById("closeBases");
    const btnBases = document.getElementById("btnBases");
    const videoInicial = document.getElementById("video-inicial");

    // Modal Bases y Condiciones
    const modalBases = document.getElementById("basesYCondiciones");
    if (modalBases) {
        modalBases.style.display = "none"; // Ocultar inicialmente
    }

    // Verifica si el modal de Bases y Condiciones ya fue mostrado en esta sesión
    const modalBasesShown = sessionStorage.getItem('modalBasesShown');

    if (!modalBasesShown) {
        // Mostrar el modal de Bases y Condiciones solo la primera vez en la sesión
        setTimeout(function () {
            modalBases.style.display = "flex";
            document.body.classList.add("no-scroll"); // Bloquea el scroll del fondo
        }, 1000);

        // Marcar que ya fue mostrado para no volver a mostrarlo
        sessionStorage.setItem('modalBasesShown', 'true');
    }

    // Mostrar el modal de Bases y Condiciones al hacer clic en el botón
    if (btnBases) {
        btnBases.addEventListener("click", function () {
            modalBases.style.display = "flex";
            document.body.classList.add("no-scroll"); // Bloquea el scroll del fondo
            videoInicial.style.display = "block";
        });
    }

    // Cerrar el modal de Bases y Condiciones
    if (closeBases) {
        closeBases.addEventListener("click", function () {
            modalBases.style.display = "none";
            console.log("Cerrando");
            document.body.classList.remove("no-scroll"); // Restablece el scroll del fondo
            videoInicial.pause();
            videoInicial.currentTime = 0;
            videoInicial.style.display = "none";
        });
    }

    if (modalPremios) {

        modalPremios.style.display = "none"; // Ocultar el modal de premios inicialmente
    }


    if(botonPremios) {
         botonPremios.addEventListener("click", (event) => {
            event.preventDefault();
            console.log("Click botón premios");
            modalPremios.style.display = "flex";
            document.body.classList.add("no-scroll"); // Bloquea el scroll del fondo
         });
     }

    //  const btnPremios  = document.getElementById("btn-premios-sorteo");
    //  if(btnPremios) {
    //     btnPremios.addEventListener("click", (event) => {
    //        event.preventDefault();
    //        console.log("Click botón premios abajo");
    //        modalPremios.style.display = "flex";
    //        document.body.classList.add("no-scroll"); // Bloquea el scroll del fondo
    //     });
    // }

     console.log("Botón Premios", botonPremios);

     if(closePremios) {
            closePremios.addEventListener("click", function () {
                modalPremios.style.display = "none";
                console.log("Cerrando");
                document.body.classList.remove("no-scroll"); 
            });
     }

    const btnRealizarPago = document.getElementById("obutRealizarPago");
    const modal = document.getElementById("myModal");
    const openModalBtn = document.getElementById("openModalBtn");
    const closeModalBtn = document.getElementById("closeModalBtn");

    if(modal) {
        modal.style.display = "none"; 
    }

    if(openModalBtn) {
        openModalBtn.addEventListener("click", function (event) {
            console.log(event);
            event.preventDefault();
            modal.style.display = "flex";
            document.body.classList.add("no-scroll"); 
        });
    }
// Cerrar el modal principal
    if(closeModalBtn) {
        closeModalBtn.addEventListener("click", function (){
        modal.style.display = "none";
        console.log("Cerrando");
        document.body.classList.remove("no-scroll"); 
        });
    }

    // Cierra los modales cuando se hace clic fuera del contenido del modal
    window.addEventListener("click", function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
            document.body.classList.remove("no-scroll"); 
        }

        if (event.target === modalPremios) {
            modalPremios.style.display = "none";
            console.log("Cerrando modal de premios");
            document.body.classList.remove("no-scroll");
        }

        if (event.target === modalBases) {
            modalBases.style.display = "none";
            console.log("Cerrando modal de bases y condiciones");
            document.body.classList.remove("no-scroll");
        }
    });
    //Simula un clic automático en el botón openModalBtn una vez al cargar la página
    // if (openModalBtn) {
    //     setTimeout(function () {
    //         openModalBtn.click();
    //     }, 500);
    // }
});
