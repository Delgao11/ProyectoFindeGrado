let productos = [];
/* realiza una solicitud a la dirección del archivo JSON que contiene la información de los productos del menú */
fetch("./js/productos.json")
    .then(response => response.json()) /*- convierte la respuesta de la solicitud en formato JSON */
    .then(data => {
        productos = data;
        cargarProductos(productos);
    })


const contenedorProductos = document.querySelector("#contenedor-productos");
const botonesCategorias = document.querySelectorAll(".boton-categoria");
const tituloPrincipal = document.querySelector("#titulo-principal");
let botonesAgregar = document.querySelectorAll(".producto-agregar");
const numerito = document.querySelector("#numerito");


botonesCategorias.forEach(boton => boton.addEventListener("click", () => {
    aside.classList.remove("aside-visible");
}))

/*Carga los productos elegidos en el contenedor de productos en la página. */
function cargarProductos(productosElegidos) {

    contenedorProductos.innerHTML = "";

    productosElegidos.forEach(producto => {

        const div = document.createElement("div");
        div.classList.add("producto");
        div.innerHTML = `
            <img class="producto-imagen" src="${producto.imagen}" alt="${producto.titulo}">
            <div class="producto-detalles">
                <h3 class="producto-titulo">${producto.titulo}</h3>
                <p class="producto-precio"> ${producto.precio}€</p>
                <button class="producto-agregar" id="${producto.id}">Añadir</button>
            </div>
        `;

        contenedorProductos.append(div);
    })

    actualizarBotonesAgregar();
}

const botonBebidas = document.querySelector("#categoria-bebidas"); // Selecciona el botón de Bebidas

botonBebidas.addEventListener("click", () => { // Agrega un evento de clic al botón de Bebidas
    const productosMostrados = [];
    
    for (let i = 01; i <= 07; i++) {
        const producto = productos.find(producto => producto.id === ("0" + i).slice(-2)); // Busca el producto con el ID correspondiente
        
        if (producto) {
            productosMostrados.push(producto); // Agrega el producto al arreglo de productos mostrados
        }
    }
    
    cargarProductos(productosMostrados); // Carga los productos en el contenedor de productos
});
const botonMakis = document.querySelector("#categoria-makis"); // Selecciona el botón de Makis

botonMakis.addEventListener("click", () => { // Agrega un evento de clic al botón de Makis
    const productosMostrados = [];
    
    for (let i = 8; i <= 23; i++) {
        const producto = productos.find(producto => producto.id === ("0" + i).slice(-2)); // Busca el producto con el ID correspondiente
        
        if (producto) {
            productosMostrados.push(producto); // Agrega el producto al arreglo de productos mostrados
        }
    }
    
    cargarProductos(productosMostrados); // Carga los productos en el contenedor de productos
});

const botonNigiri = document.querySelector("#categoria-nigiris"); // Selecciona el botón de nigiris

botonNigiri.addEventListener("click", () => { // Agrega un evento de clic al botón de nigiris
    const productosMostrados = [];
    
    for (let i = 24; i <= 26; i++) {
        const producto = productos.find(producto => producto.id === ("0" + i).slice(-2)); // Busca el producto con el ID correspondiente
        
        if (producto) {
            productosMostrados.push(producto); // Agrega el producto al arreglo de productos mostrados
        }
    }
    
    cargarProductos(productosMostrados); // Carga los productos en el contenedor de productos
});



const botonFritos = document.querySelector("#categoria-fritos"); // Selecciona el botón de fritos
botonFritos.addEventListener("click", () => { // Agrega un evento de clic al botón de fritos
    const productosMostrados = [];
    
    for (let i = 28; i <= 32; i++) {
        const producto = productos.find(producto => producto.id === ("0" + i).slice(-2)); // Busca el producto con el ID correspondiente
        
        if (producto) {
            productosMostrados.push(producto); // Agrega el producto al arreglo de productos mostrados
        }
    }
    
    cargarProductos(productosMostrados); // Carga los productos en el contenedor de productos
});

const botonPlatosElab = document.querySelector("#categoria-platos-elaborados"); // Selecciona el botón de platos elaboradoss
botonPlatosElab.addEventListener("click", () => { // Agrega un evento de clic al botón de platos elaborados
    const productosMostrados = [];
    
    for (let i = 33; i <= 38; i++) {
        const producto = productos.find(producto => producto.id === ("0" + i).slice(-2)); // Busca el producto con el ID correspondiente
        
        if (producto) {
            productosMostrados.push(producto); // Agrega el producto al arreglo de productos mostrados
        }
    }
    
    cargarProductos(productosMostrados); // Carga los productos en el contenedor de productos
});


const botontodos = document.querySelector("#categoria-todos"); // Selecciona el botón de todos los productos
botontodos.addEventListener("click", () => { // Agrega un evento de clic al botón de todos los productos
    const productosMostrados = [];
    
    for (let i = 01; i <= 38; i++) {
        const producto = productos.find(producto => producto.id === ("0" + i).slice(-2)); // Busca el producto con el ID correspondiente
        
        if (producto) {
            productosMostrados.push(producto); // Agrega el producto al arreglo de productos mostrados
        }
    }
    
    cargarProductos(productosMostrados); // Carga los productos en el contenedor de productos
});
/*Actualiza los botones de "añadir al carrito" en la página cada vez que se agregue un producto al carrito. */
function actualizarBotonesAgregar() {
    botonesAgregar = document.querySelectorAll(".producto-agregar");

    botonesAgregar.forEach(boton => {
        boton.addEventListener("click", agregarAlCarrito);
    });
}


function agregarProducto() {
    const botonAgregar = document.querySelectorAll(".producto-agregar");
  
    botonAgregar.forEach(boton => {
      boton.addEventListener("click", () => {
        const id = boton.id;
        const producto = productos.find(producto => producto.id === id);
        const titulo = producto.titulo;
        const precio = producto.precio;
  
        fetch('insertar_producto.php', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            titulo: titulo,
            precio: precio
          })
        })
        .then(response => response.text())
        .then(data => console.log(data))
        .catch(error => console.error(error));
      });
    });
  }
  
  

let productosEnCarrito;

let productosEnCarritoLS = localStorage.getItem("productos-en-carrito");

if (productosEnCarritoLS) {
    productosEnCarrito = JSON.parse(productosEnCarritoLS);
    actualizarNumerito();
} else {
    productosEnCarrito = [];
}

/* Agrega un producto al carrito, muestra una notificación y actualiza el número de productos en el carrito. 
También guarda la información de los productos en el carrito en el almacenamiento local. */
function agregarAlCarrito(e) {

   
    Toastify({
        text: "Producto añadido",
        duration: 3000,
        close: true,
        gravity: "top", // `top` or `bottom`
        position: "right", // `left`, `center` or `right`
        stopOnFocus: true, // Prevents dismissing of toast on hover
        style: {
          background: "linear-gradient(to right, #4b33a8, #785ce9)",
          borderRadius: "2rem",
          textTransform: "uppercase",
          fontSize: ".75rem"
        },
        offset: {
            x: '1.5rem', // horizontal axis - can be a number or a string indicating unity. eg: '2em'
            y: '1.5rem' // vertical axis - can be a number or a string indicating unity. eg: '2em'
          },
        onClick: function(){} // Callback after click
      }).showToast();
       /*El método showToast() es utilizado para mostrar la notificación en la pantalla. */
    const idBoton = e.currentTarget.id;
    const productoAgregado = productos.find(producto => producto.id === idBoton);

    if(productosEnCarrito.some(producto => producto.id === idBoton)) {
        const index = productosEnCarrito.findIndex(producto => producto.id === idBoton);
        productosEnCarrito[index].cantidad++;
    } else {
        productoAgregado.cantidad = 1;
        productosEnCarrito.push(productoAgregado);
    }
  
    actualizarNumerito();

    localStorage.setItem("productos-en-carrito", JSON.stringify(productosEnCarrito));
}
  /*Actualiza el número de productos en el carrito que se muestra en el icono del carrito. */
function actualizarNumerito() {
    let nuevoNumerito = productosEnCarrito.reduce((acc, producto) => acc + producto.cantidad, 0);
    numerito.innerText = nuevoNumerito;
}



const form = document.querySelector("form");
form.addEventListener("submit", (event) => {
    event.preventDefault();
    const mesa = document.querySelector("input[type='text']").value;
    const password = document.querySelector("input[type='password']").value;
    // Aquí puedes hacer lo que necesites con el valor de mesa y password
});
