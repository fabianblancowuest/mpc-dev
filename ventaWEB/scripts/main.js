document.addEventListener("DOMContentLoaded", function () {

    const btnPagarConMercadoPagoAlt = document.getElementById("pagar-con-mp");

    const infoHeader = document.querySelector(".info-header");

    // TextArea Inicial
    const textareaInfoHeader = document.getElementById("olblInformacionVenta");
    const spanInfoHeader = document.createElement("span");
    spanInfoHeader.textContent = textareaInfoHeader.value;
    textareaInfoHeader.parentNode.replaceChild(spanInfoHeader, textareaInfoHeader);

    const primerCheckboxNumeros = document.getElementById("ogvSorteoTalonVendedorVenta_ochSorteoTalonTomado_0");
    const btnConfirmarOperacion = document.getElementById("obutConfirmaOperacion");
    const msjCompradorAlVendedor = document.getElementById("olblMensajeCompradorAlVendedor");
    // Botones opciones de Pago
    const btnPagarConMercadoPago = document.getElementById("obutPagarConMercadoPAgo");
    const btnPagarConEfectivo = document.getElementById("obutPagarConEfectivo");
    const btnPagarConTransferencia = document.getElementById("obutPagarConTransferencia");

    const panelNumeros = document.getElementById("panel-numeros");
    const panelPremios = document.getElementById("panel-premios");

    const btnVerificar = document.getElementById("obutValidacionVerifica");

    const msjWhatsapp = document.getElementById("msj-whatsapp");
    const nroCelular = document.getElementById("contenedor-nro-celular");
    const transaccionCliente = document.getElementById("transaccion-cliente");
    const btnWhatsapp = document.getElementById("btn-whatsapp");
    const btnCloseModalEncuesta = document.getElementById("closeModalBtn");
    const panelEncuesta = document.getElementById("contenido-encuesta");
    const celularNoInformado = document.getElementById("celular-no-informado");
    const sessionUsuarioVendedor = document
        .getElementById("olblSession")
        .textContent.trim();
    const nombreVendedor = document.getElementById("olblVendedorReferenciaNombre");
    const celularVendedor = document.getElementById("olblVendedorReferenciaCelular");
    const celularVendedorSpan = document.getElementById("vendedor-celular");
    const nombreVendedorSpan = document.getElementById("vendedor-nombre");

    const textoValidadorCelular = document.getElementById("texto-validador-celular");

    const btnWhatsAppSession = document.getElementById("btn-whatsapp-session");

    const inputNombre = document.getElementById("otxtClienteApyNom");
    const inputTelefono = document.getElementById("otxtCelularNumero");
    const inputCorreo = document.getElementById("otxtCorreoElectronico");

    const panelConfirmacion = document.getElementById("PanelConfirmaOperacion");
    const panelAlta = document.getElementById("PanelAlta");

    const nameRegex = /^[a-zA-ZÀ-ÖØ-öø-ÿ]+( [a-zA-ZÀ-ÖØ-öø-ÿ]+){1,}$/;
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    let hacerScroll = false;


//Actualiza el vendedor din�micamente
    if(nombreVendedorSpan) {
        nombreVendedorSpan.innerText = nombreVendedor.textContent;
    }
    if(celularVendedorSpan) {
        celularVendedorSpan.innerText = celularVendedor.textContent;
    }

    const celNoValidado = document.getElementById("olblCelularNumeroValidadoMensaje");
    const msjInicial = document.getElementById("msj-inicial");
    const msjInicialValidado = document.getElementById("msj-inicial-validado");
    const validarCelular = document.getElementById("olblCelularNumeroMensaje");

    if(infoHeader) {
        
        document.getElementById("enlace-whatsapp-vendedor-inicial").addEventListener("click", () => {

            const encodedMessage = encodeURIComponent("¡Hola! Necesito asistencia para la compra.");
            const url = `https://wa.me/${celularVendedor.textContent.trim()}?text=${encodedMessage}`;
            window.open(url, "_blank");
        })
    }



    let estaValidado = false;

        // Validación correo electrónico
        // btnWhatsAppSession.addEventListener("click", (event) => {
        //      {
        //         event.preventDefault();
        //         return alert("Verifique su correo eletrónico");
        //     }
        // })

    if (!inputTelefono) {
        msjInicial.style.display = "flex";
        msjInicialValidado.style.display = "none";

        textoValidadorCelular.textContent = "Celular No Validado❌";

        btnWhatsAppSession.addEventListener("click", function () {
            
            if(nameRegex.test(inputNombre.value.trim())) {

                const encodedMessage = encodeURIComponent(sessionUsuarioVendedor);
                const url = `https://wa.me/543704779106?text=${encodedMessage}`;
                window.open(url, "_blank");
            } 
            else {
                Swal.fire({
                    icon: "error",
                    // title: "Oops...",
                    html: `<span style="font-weight: bold; font-size: 1.8rem">¡Por favor, verifique su Apellido y Nombre!</span>`,
                    confirmButtonText: '<span style="color: white;">Aceptar</span>',
                    confirmButtonColor: "rgb(0, 123, 255)",
                    customClass: {
                        // confirmButton: 'swal2-confirm-green'
                    }
                  });
            }
        });

        console.log(inputNombre);

        // Convertir la primera letra de los nombres y apellidos a mayúsculas
        if(inputNombre.value) {

            inputNombre.value.split(" ").map(str => str[0].toUpperCase() + str.slice(1).toUpperCase()).join(" ");

        }

        // Convertir todo el correo electrónico a minúsculas
        if(inputCorreo.value) {
            inputCorreo.value.toLowerCase();

            console.log(inputCorreo.value);
        }


        const codigoPersonalWhatsapp = document.getElementById("olblSinNumeroCelularMensajeCodigoPersonal");


        codigoPersonalWhatsapp.addEventListener("click", () => {

             if(nameRegex.test(inputNombre.value.trim())) {


                const encodedMessage = encodeURIComponent(sessionUsuarioVendedor);
                const url = `https://wa.me/543704779106?text=${encodedMessage}`;
                window.open(url, "_blank");
            } 
            else {
                // alert("¡Por favor, verifique su Apellido y Nombre!");
                Swal.fire({
                    icon: "error",
                    // title: "Oops...",
                    html: `<span style="font-weight: bold; font-size: 1.8rem">¡Por favor, verifique su Apellido y Nombre!</span>`,
                    confirmButtonText: '<span style="color: white;">Aceptar</span>',
                    confirmButtonColor: "rgb(0, 123, 255)",
                    customClass: {
                        // confirmButton: 'swal2-confirm-green'
                    }
                  });
            }
        })

    //     btnVerificar.addEventListener("click", () => {

    //         if(nameRegex.test(inputNombre.value.trim())) {

    //            const encodedMessage = encodeURIComponent(sessionUsuarioVendedor);
    //            const url = `https://wa.me/543704779106?text=${encodedMessage}`;
    //            window.open(url, "_blank");
    //        } 
    //        else {
    //            alert("¡Por favor, verifique su Apellido y Nombre!");
    //        }
    //    })
        
    } else {
        msjInicial.style.display = "none";
        msjInicialValidado.style.display = "flex";

        // Swal.fire({
        //     position: "top-end",
        //     icon: "success",
        //     title: "Celular validado con éxito",
        //     showConfirmButton: false,
        //     timer: 1500
        //   });
        estaValidado = true;
        textoValidadorCelular.textContent = "Celular Validado✅️";
        textoValidadorCelular.style.color = "green";
    }

    const contador = sessionStorage.getItem("contador");

    if(inputTelefono && !contador) {
            Swal.fire({
            position: "top-end",
            icon: "success",
            title: "¡Celular validado con éxito!",
            showConfirmButton: false,
            timer: 3000
            });
            sessionStorage.setItem("contador", "true");
    }
    console.log(contador);
    console.log(msjInicial);
    console.log(sessionUsuarioVendedor);


    if(primerCheckboxNumeros) {
        if(!primerCheckboxNumeros.checked) {
            document.getElementById("elegi-tus-premios").style.display = "none";
        } else {
            document.getElementById("elegi-tus-premios").style.display = "block";
        }
    }

    function prevenirRecarga() {
        window.onbeforeunload = function (event) {
            event.preventDefault();
            event.returnValue = ''; // Esto muestra una alerta de confirmación en navegadores compatibles
        };
    }
    
    function evitarIrAtras() {
        history.pushState(null, '', location.href); // Añade el estado actual al historial
        window.onpopstate = function () {
            history.pushState(null, '', location.href); // Si el usuario intenta ir atrás, permanece en la misma página
        };
    }

    let yaEstaPagado = false;
    

    if (panelConfirmacion) {

        console.log(panelConfirmacion);

        const enlaceWhatsappVendedor = document.getElementById(
            "enlace-whatsapp-vendedor",
        );

        let whatsAppVendedor = celularVendedor.textContent.trim();

        // Mensaje comprador al vendedor
        const encodedMessage = encodeURIComponent(msjCompradorAlVendedor.innerText.trim());

        // encodedMessage = encodedMessage.replace(/\./g, '.%0A');

        enlaceWhatsappVendedor.href = `https://wa.me/${whatsAppVendedor}?text=${encodedMessage}`;

        sessionStorage.setItem("modificarBoton", "false");
          
          if(btnConfirmarOperacion) {
                btnConfirmarOperacion.addEventListener("mouseover", (event) => {
                    // panelAlta.style.display = "block";
                    // event.preventDefault();
                    sessionStorage.setItem("modificarBoton", "true");
                    console.log("Estas sobre el botón");
                    console.log(sessionStorage.getItem("modificarBoton"));         
                    
                                      
                })

                console.log(btnConfirmarOperacion.value);

                if(btnConfirmarOperacion.disabled) {
                    btnConfirmarOperacion.value = "Operación realizada correctamente✅";
                    btnConfirmarOperacion.style.backgroundColor = "green";
                    btnConfirmarOperacion.style.color = "white";
                    btnConfirmarOperacion.classList.toggle("btn-animado");
                    btnConfirmarOperacion.style.pointerEvents = "none";                
                    window.open(enlaceWhatsappVendedor, "_blank");

                    msjInicialValidado.style.display = "none";

                    yaEstaPagado = true;
        

                    // Swal.fire({
                    //     title: '<span style="color: green;">¡Muchas gracias por su compra!</span>',
                    //     html: `<button id="okButton" style="padding: 10px 20px; background-color: green; color: white; border: none; cursor: pointer; font-size: 1.2rem">Aceptar</button>`,
                    //     didOpen: () => {
                    //       document.querySelector('.swal2-confirm').style.display = 'none';

                    //       const okButton = document.getElementById("okButton");
                    //       okButton.addEventListener("click", () => {
                    //           scrollToSection("seccion-encuesta");
                              
                    //       })
                    //     },
                    //   })

                    
                    //   Ir a encuesta depues de 7 segundos
                    setTimeout(() => {
                        scrollToSection("Label19");

                    }, 7000)
                      
                }
            }
    }

    if(yaEstaPagado) {
        prevenirRecarga();
        evitarIrAtras();
        btnConfirmarOperacion.disabled = true;
    }

    console.log(yaEstaPagado);

    window.addEventListener("scroll", function () {
        const chevron = document.getElementById("chevron");
        const hasScroll = document.body.scrollHeight > window.innerHeight;

        // Calcular si se debe mostrar el chevron
        const isAtBottom =
            window.innerHeight + window.scrollY >= document.body.scrollHeight;

        // Mostrar u ocultar chevron
        chevron.style.display = hasScroll && !isAtBottom ? "block" : "none";
    });

    // Scroll suave al hacer clic en el chevron
    document.getElementById("chevron").addEventListener("click", function () {
        const scrollAmount = 450;
        const nextScrollY = window.scrollY + scrollAmount;
        const maxScrollY = document.body.scrollHeight - window.innerHeight;

        window.scrollTo({
            top: Math.min(nextScrollY, maxScrollY),
            behavior: "smooth",
        });
    });

    // Seleccionamos los botones por su ID
    const btnNumeros = document.getElementById("obutNumeros");
    const btnPremios = document.getElementById("obutPremios");
    const linkEncuesta = document.getElementById("link-encuesta");

    // La funci�n para hacer scroll a la secci�n espec�fica
    function scrollToSection(sectionId) {
        const section = document.getElementById(sectionId);
        if (section) {
            section.scrollIntoView({ behavior: "smooth" });
        }
    }

    // Asignamos eventos de clic a los botones
    if (btnNumeros) {
        btnNumeros.addEventListener("click", function (event) {
            event.preventDefault();
            scrollToSection("panel-numeros")
        });
    }

    if (btnPremios) {
        btnPremios.addEventListener("click", function (event) {
            event.preventDefault();
            scrollToSection("panel-premios"); 
        });
    }

    // console.log(btnPremios);

    if (linkEncuesta) {
        linkEncuesta.addEventListener("click", function (event) {
            event.preventDefault();
            scrollToSection("contenido-encuesta"); 
        });
    }

    if (btnCloseModalEncuesta) {
        btnCloseModalEncuesta.addEventListener("click", function (event) {
            event.preventDefault();
            scrollToSection("contenido-encuesta"); 
        });
    }

    
    if (linkEncuesta) {
        linkEncuesta.addEventListener("click", function (event) {
            event.preventDefault();
            scrollToSection("contenido-encuesta"); 
        });
    }

    // Botones vuelve a seleccionar Método de Pago
    const btnVuelveSelecMetodoPago = {
        efectivo: document.getElementById("obutVuelveSeleccionFormaPagoDesdeEfectivo"),
        mercadoPago: document.getElementById("obutVuelveSeleccionFormaPagoDesdeMP"),
        tranferencia: document.getElementById("obutVuelveSeleccionFormaPagoDesdeTransferencia"),
    };

    // if(linkEncuesta) {
    //        linkEncuesta.addEventListener("click", (event) => {
    //         event.preventDefault();
    //         panelPremios.scrollIntoView({ behavior: 'smooth' });
    //     })
    // }

    // Funci�n para copiar texto al portapapeles
    function copyToClipboard(event, textboxId, prefix) {
        event.preventDefault();
        const textBox = document.getElementById(textboxId);
        const text = textBox.innerText;
        let textToCopy = text.split(prefix + " : ")[1];

        if (textToCopy) {
            const tempInput = document.createElement("input");
            tempInput.style.position = "absolute";
            tempInput.style.left = "-1000px";
            tempInput.style.top = "-1000px";
            tempInput.value = textToCopy;
            document.body.appendChild(tempInput);
            tempInput.select();
            document.execCommand("copy");
            document.body.removeChild(tempInput);
            alert(prefix + " copiado: " + textToCopy);
        } else {
            alert("No se encontr� el texto para copiar.");
        }
    }

    // Eventos para botones de copiar
        const btnCopiarCvu =  document.getElementById("btn-copiar-cvu")
        if(btnCopiarCvu) {
            btnCopiarCvu.addEventListener("click", function (event) {
            copyToClipboard(event, "otxtDatosBancoParaTransferencia02", "CVU");
            });
        }

        const btnCopiarAlias = document.getElementById("btn-copiar-alias")
        if(btnCopiarAlias) {
            btnCopiarAlias.addEventListener("click", function (event) {
            copyToClipboard(event, "otxtDatosBancoParaTransferencia03", "ALIAS");
            });
        }

        if(!btnPagarConTransferencia) {
            btnPagarConMercadoPagoAlt.style.display = "none";
        } else if(!btnPagarConTransferencia) {
            btnPagarConMercadoPagoAlt.style.display = "block";
        }

        

        
        

        if (btnPagarConMercadoPagoAlt) {
            btnPagarConMercadoPagoAlt.textContent = `PAGAR $${document.getElementById("olblMontoTotal").textContent} CON MERCADO PAGO`;
            btnPagarConMercadoPagoAlt.addEventListener("click", (event) => {
                event.preventDefault(); // Prevenir siempre la acción por defecto para controlar la redirección
          
              const mercadoPago = "https://link.mercadopago.com.ar/pagobilletesorteo";
              let timerInterval;

              Swal.fire({
                html:`Usted será redireccionado a Mercado Pago en <b id="timer">4</b> segundos.
                    <h2>LUEGO DE SU PAGO<span style="color: red;"> VUELVA Y CONTINÚE SU COMPRA</span></h2>
                       <button id="confirmButton" style="padding: 10px 20px; background-color: #E1EFF8; border: none; cursor: pointer; font-size: 1.2rem;">Clic para continuar con la compra</button>`,
                didOpen: () => {
                  Swal.showLoading();

                    // Agregar efecto hover manualmente con JavaScript
                    const button = document.getElementById("confirmButton");
                    button.style.borderRadius = "10px";

                    button.addEventListener('mouseover', () => {
                        button.style.backgroundColor = '#c0e0f8'; // Cambia el color de fondo al pasar el mouse
                    });

                    button.addEventListener('mouseout', () => {
                        button.style.backgroundColor = '#E1EFF8'; // Vuelve al color original
                    });

                    const confirmButton = document.getElementById("confirmButton");
                    confirmButton.disabled = true;

              
                  // Inicia el temporizador de 4 segundos
                  let seconds = 4;
                  timerInterval = setInterval(() => {
                    seconds--;
                    document.getElementById("timer").textContent = seconds; // Actualiza el contador de segundos en el mensaje
                    
                    if (seconds <= 0) {
                      clearInterval(timerInterval);
                      window.open(mercadoPago, "_blank"); 
                      confirmButton.disabled = false;
                    }
                  }, 1000);
              
                  // Agrega un evento de escucha al botón "Confirmar Compra"
                  confirmButton.addEventListener("click", () => {
                    Swal.close(); // Cierra el SweetAlert
                    btnPagarConMercadoPago.click(); // Dispara el evento en el botón de pago
                    clearInterval(timerInterval); // Detiene el temporizador
                  });
                },
                willClose: () => {
                  clearInterval(timerInterval); // Asegura que el temporizador se detiene al cerrar
                }
              });
              
              
            });
          }
          
          

        
        // if(btnPagarConTransferencia) {
        //     btnPagarConTransferencia.addEventListener("click", () => {
        //         let whatsAppVendedor = celularVendedor.textContent.trim();
                
        //         const encodedMessage = encodeURIComponent(msjCompradorAlVendedor.innerText.trim());

        //         const whatsapp = `https://wa.me/${whatsAppVendedor}?text=${encodedMessage}`;
                
        //         window.open(whatsapp, "_blank");

        //     })
        // }

        
        if(btnPagarConEfectivo) {

            console.log(btnPagarConEfectivo);
            btnPagarConEfectivo.addEventListener("click", () => {

                let whatsAppVendedor = celularVendedor.textContent.trim();
                
                
                const encodedMessage = encodeURIComponent(msjCompradorAlVendedor.innerText.trim());
                
                const whatsapp = `https://wa.me/${whatsAppVendedor}?text=${encodedMessage}`;
                
                window.open(whatsapp, "_blank");
            })
        }

        document.addEventListener("click", (event) => {
            const { name } = event.target;

            const btnOpcionesPagoNames = {
                mp: "obutVuelveSeleccionFormaPagoDesdeMP",
                tranferencia: "obutVuelveSeleccionFormaPagoDesdeTransferencia",
                efectivo: "obutVuelveSeleccionFormaPagoDesdeEfectivo",
            }

            const {mp, tranferencia, efectivo} = btnOpcionesPagoNames;

            if(name === mp || name === tranferencia || name === efectivo) {
                // hacerScroll = true;
                sessionStorage.setItem("opcionesDePago", "true");
            }
        })

        if (sessionStorage.getItem("opcionesDePago") === null) {
            sessionStorage.setItem("opcionesDePago", "false");
        }

        const opcionesDePago = sessionStorage.getItem("opcionesDePago") === "true";
        console.log("Valor de opcionesDePago al cargar la página:", opcionesDePago);

        const panelOpcionesPago = document.getElementById("panel-opciones-de-pago");

        if(panelOpcionesPago && opcionesDePago) {
            setTimeout(() => {
                scrollToSection("panel-opciones-de-pago");
            }, 100)
        }
});
