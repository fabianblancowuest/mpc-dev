document.addEventListener("DOMContentLoaded", () => {
    const btnImprimirContrato = document.getElementById("btnImpContrato");
    
    btnImprimirContrato.addEventListener("click", (event) => {
        event.preventDefault();
        console.log("Hola");
        window.print();
    });
})