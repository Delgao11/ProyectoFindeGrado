let openShopping = document.querySelector('.shopping');
let closeShopping = document.querySelector('.closeShopping');
let list = document.querySelector('.list');
let listCard = document.querySelector('.listCard');
let body = document.querySelector('body');
let total = document.querySelector('.total');
let quantity = document.querySelector('.quantity');
let checkoutButton = document.querySelector('.checkout');



openShopping.addEventListener('click', ()=>{
    body.classList.add('active');
})
closeShopping.addEventListener('click', ()=>{
    body.classList.remove('active');
})

checkoutButton.addEventListener('click', ()=>{
    listCards = [];
    reloadCard();
})

checkoutButton.addEventListener('click', realizarPedido);



  
let products = [
    {
        id: 1,
        name: 'Botella Agua (1ud)',
        image: 'agua.png',
        price: 2.00
    },
    {
        id: 2,
        name: 'Fanta Naranja (1ud)',
        image: 'fanta-de-naranja.jpg',
        price: 2.00
    },
    {
        id: 3,
        name: 'Fanta Limon (1ud)',
        image: 'fanta-de-limon.jpg',
        price: 2.00
    },
    {
        id: 4,
        name: 'CocaCola Normal (1ud)',
        image: 'coca-cola-lata-normal.jpg',
        price: 2.00
    },
    {
        id: 5,
        name: 'CocaCola Light (1ud)',
        image: 'coca-cola-light.jpg',
        price: 2.00
    },
    {
        id: 6,
        name: 'CocaCola Zero (1ud)',
        image: 'coca-cola-zero.jpg',
        price: 2.00
    },
    {
        id: 7,
        name: 'Aquarius Naranja(1ud)',
        image: 'aquarius-naranja.jpg',
        price: 2.00
    },
    {
        id: 8,
        name: 'Aquarius Limon(1ud)',
        image: 'aquarius-limon.jpg',
        price: 2.00
    },

    {
        id: 9,
        name: 'Nestie(1ud)',
        image: 'nestea.jpg',
        price: 2.00
    },


    {
        id: 10,
        name: 'Nigiri Atún (8ud)',
        image: 'nigiri_atun.jpg',
        price: 6.00
    },
    {
        id: 11,
        name: 'Nigiri Salmón (8ud)',
        image: 'nigirisalmon.jpg',
        price: 6.00
    },
    {
        id: 12,
        name: 'Nigiri Gamba (8ud)',
        image: 'nigiri_gamba.jpg ',
        price: 6.00
    },
    {
        id: 13,
        name: 'Maki Salmón (8ud)',
        image: 'maki_salmon.jpg',
        price: 6.00
    },
    {
        id: 14,
        name: 'Maki Atún (8ud)',
        image: 'maki_atun.jpg',
        price: 6.00
    },
    {
        id: 15,
        name: 'Maki Aguacate (8ud)',
        image: 'maki_aguacate.jpg',
        price: 6.00
    },
  
    {
        id: 16,
        name: 'Maki Tempura Salmón (8ud)',
        image: 'maki-tempura-salmon.jpg',
        price: 6.00
    },
    
    {
        id: 17,
        name: 'Maki Tempura  Gamba (6ud)',
        image: 'Maki-Aguacate-Tempura-Gamba.png',
        price: 6.00
    },

    {
        id: 18,
        name: 'Maki Tempura Atun  Picante (4ud)',
        image: 'MAKI-ATUN-CROCANTE-Y-PICANTE.jpg',
        price: 4.50
    },
    {
        id: 19,
        name: 'Maki Safari (6ud)',
        image: 'maki_safari.jpg',
        price: 5.00
    },
    {
        id: 20,
        name: 'Maki Salmon  Aguacate (6ud)',
        image: 'maki-salmon-aguacate.jpg',
        price: 5.00
    },
    {
        id: 23,
        name: 'Spicy Tuna (6ud)',
        image: 'Spicy-Tuna.png',
        price: 5.00
    },
    {
        id: 21,
        name: 'Sakana San Shu(6ud)',
        image: 'Sakana-San-Shu.png',
        price: 5.00
    },
    {
        id: 22,
        name: 'Spicy Crab (6ud)',
        image: 'Spicy-Crab.png',
        price: 5.00
    },
    
   
    {
        id: 24,
        name: ' Sake Ikura (6ud)',
        image: 'Sake-Ikura.png',
        price: 5.00
    },
    {
        id: 25,
        name: ' Maki Esparrago(6ud)',
        image: 'Makis-Esparragos.jpg',
        price: 5.00
    },
    {
        id: 26,
        name: ' Negi Hama (6ud)',
        image: 'Negi-Hama.png',
        price: 5.00
    },
    {
        id: 27,
        name: ' Shiitake (6ud)',
        image: 'Shiitake.jpg',
        price: 5.00
    },
    
    {
        id: 28,
        name: ' Temaki (1ud)',
        image: 'temaki.jpg',
        price: 2.00
    },
    {
        id: 29,
        name: ' Ramen(1ud)',
        image: 'ramen.jpeg',
        price: 6.00
    },

    {
        id: 30,
        name: ' Sopa Miso(1ud)',
        image: 'sopamiso.jpg',
        price: 4.50
    },

    {
        id: 31,
        name: ' Sopa Miso(1ud)',
        image: 'sopamiso.jpg',
        price: 4.50
    },

    {
        id: 32,
        name: ' Sopa Miso(1ud)',
        image: 'sopamiso.jpg',
        price: 4.50
    },
    {
        id: 33,
        name: ' Sopa Miso(1ud)',
        image: 'sopamiso.jpg',
        price: 4.50
    },




    
   
    
];

let listCards  = [];
function initApp(){
    products.forEach((value, key) =>{
        let newDiv = document.createElement('div');
        newDiv.classList.add('item');
        newDiv.innerHTML = `
            <img src="image/${value.image}">
            <div class="title">${value.name}</div>
            <div class="price">${value.price.toLocaleString()} €</div>
            <button onclick="addToCard(${key})">Añadir al Pedido</button>`;
        list.appendChild(newDiv);
    })
}
initApp();
function addToCard(key){
    if(listCards[key] == null){
        listCards[key] = JSON.parse(JSON.stringify(products[key]));
        listCards[key].quantity = 1;
    }
    reloadCard();
}
function reloadCard(){
    listCard.innerHTML = '';
    let count = 0;
    let totalPrice = 0;
    listCards.forEach((value, key)=>{
        totalPrice = totalPrice + value.price;
        count = count + value.quantity;
        if(value != null){
            let newDiv = document.createElement('li');
            newDiv.innerHTML = `
                <div><img src="image/${value.image}"class="imagen-carro"/></div>
                <div><span class="nombre-pedido">${value.name}<span class="nombre-pedido"></div>
                <div>${value.price.toLocaleString()}€</div>
                <div>
                    <button class="btn-cantidad-resta" onclick="changeQuantity(${key}, ${value.quantity - 1})">-</button>
                    <div class="count">${value.quantity}ud</div>
                    <button class="btn-cantidad-suma"onclick="changeQuantity(${key}, ${value.quantity + 1})">+</button>
                </div>`;
                listCard.appendChild(newDiv);
        }
    })
    total.innerText = "TOTAL DEL PEDIDO = " + totalPrice.toLocaleString()+ " €";
    quantity.innerText = count;
    
    total.classList.add('totalstring');
    quantity.classList.add('countstring');

    

}
function changeQuantity(key, quantity){
    if(quantity == 0){
        delete listCards[key];
    }else{
        listCards[key].quantity = quantity;
        listCards[key].price = quantity * products[key].price;
    }
    reloadCard();
}



  function realizarPedido() {
    // Create an array of objects with the data to send
    let orderData = [];
    for (let card of listCard.children) {
      let product_id = card.dataset.id;
      let product_name = card.querySelector('.cardTitle').textContent;
      let product_price = card.querySelector('.cardPrice').textContent;
      orderData.push({product_id, product_name, product_price});
    }
  
    // Send the data via HTTP POST request
    let xhr = new XMLHttpRequest();
    xhr.open('POST', 'insert_order.php');
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
      if (xhr.status === 200) {
        console.log(xhr.responseText);
      } else {
        console.log('Error:', xhr.statusText);
      }
    };
    xhr.onerror = function() {
      console.log('Error:', xhr.statusText);
    };
    xhr.send(JSON.stringify(orderData));
  }
  
  function addProductToDatabase(product) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
        }
    };
    xhttp.open("POST", "insert_order.php", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("product_id=" + product.id + "&product_name=" + product.name + "&product_price=" + product.price + "&product_image=" + product.image);
}
