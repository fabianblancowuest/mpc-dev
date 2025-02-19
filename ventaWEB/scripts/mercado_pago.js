document.addEventListener("DOMContentLoaded", () => {

    const btnPagarMP = document.getElementById("btn-pagar-mp");

    btnPagarMP = document.addEventListener("click", () => {


        fetch('https://api.mercadopago.com/v1/payments', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer TU_ACCESS_TOKEN'
            },
            body: JSON.stringify({
                transaction_amount: 500, 
                description: 'Descripción del producto o servicio',
                payment_method_id: 'mercadopago', // 
          
            })
            })
            .then(response => response.json())
            .then(data => {
                console.log(data);
           
            })
            .catch(error => console.error('Error:', error));
        
         })


})