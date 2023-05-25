let productosEnCarrito = localStorage.getItem("productos-en-carrito");
productosEnCarrito = JSON.parse(productosEnCarrito);

const contenedorCarritoVacio = document.querySelector("#carrito-vacio");
const contenedorCarritoProductos = document.querySelector("#carrito-productos");
const contenedorCarritoAcciones = document.querySelector("#carrito-acciones");
const contenedorCarritoComprado = document.querySelector("#carrito-comprado");
let botonesEliminar = document.querySelectorAll(".carrito-producto-eliminar");
const botonVaciar = document.querySelector("#carrito-acciones-vaciar");
const contenedorTotal = document.querySelector("#total");
const botonComprar = document.querySelector("#carrito-acciones-comprar");
const contenedorPedidoAnterior = document.querySelector("#producto-anteriores");
let pedidoanterior = [];

/*  Es la encargada de cargar los productos en la lista del carrito si hay productos almacenados en el almacenamiento local. 
    Si no hay productos, se muestran los elementos del carrito vacío.*/
    function cargarProductosCarrito() {
        if (productosEnCarrito && productosEnCarrito.length > 0) {
          contenedorCarritoVacio.classList.add("disabled");
          contenedorCarritoProductos.classList.remove("disabled");
          contenedorCarritoAcciones.classList.remove("disabled");
          contenedorCarritoComprado.classList.add("disabled");
      
          contenedorCarritoProductos.innerHTML = "";
      
          productosEnCarrito.forEach((producto, index) => {
            const div = document.createElement("div");
            div.classList.add("carrito-producto");
            div.innerHTML = `
              <img class="carrito-producto-imagen" src="${producto.imagen}" alt="${producto.titulo}">
              <div class="carrito-producto-titulo">
                <small>Título</small>
                <h3>${producto.titulo}</h3>
              </div>
              <div class="carrito-producto-cantidad">
                <small>Cantidad</small>
                <p>${producto.cantidad}</p>
              </div>
              <div class="carrito-producto-precio">
                <small>Precio</small>
                <p>${producto.precio}€</p>
              </div>
              <div class="carrito-producto-eliminar">
                <button class="boton boton-rojo">
                  <i class="fas fa-trash-alt"></i>
                  Eliminar
                </button>
              </div>
            `;
            contenedorCarritoProductos.appendChild(div);
          });
      
          botonesEliminar = document.querySelectorAll(".carrito-producto-eliminar button");
      
          botonesEliminar.forEach((boton, index) => {
            boton.addEventListener("click", () => {
              Swal.fire({
                title: '¿Estás seguro?',
                text: "Este producto se eliminará del carrito",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
              }).then((result) => {
                if (result.isConfirmed) {
                  eliminarProducto(index);
                  Swal.fire(
                    'Eliminado',
                    'El producto ha sido eliminado del carrito',
                    'success'
                  );
                }
              });
            });
          });
      
          calcularTotal();
        } else {
            contenedorCarritoVacio.classList.remove("disabled");
            contenedorCarritoProductos.classList.add("disabled");
            contenedorCarritoAcciones.classList.add("disabled");
            contenedorCarritoComprado.classList.add("disabled");
          
            // Ocultar el contenedor del carrito
            contenedorCarrito.classList.add("disabled");
          
            // Mostrar el enlace/botón para volver
            const volverBtn = document.getElementById("volverBtn");
            volverBtn.classList.remove("disabled");
          }
          
      }
      
      

function eliminarProducto(index) {
    productosEnCarrito.splice(index, 1);
    localStorage.setItem("productos-en-carrito", JSON.stringify(productosEnCarrito));
    cargarProductosCarrito();
}

function vaciarCarrito() {
    
    Swal.fire({
        title: '¿Estás seguro?',
        text: "Se vaciará todo el carrito",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, vaciar',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            productosEnCarrito = [];
            localStorage.setItem("productos-en-carrito", JSON.stringify(productosEnCarrito));
            cargarProductosCarrito();
            Swal.fire(
                'Vacío',
                'El carrito ha sido vaciado',
                'success'
            );
        }
    });
}

botonVaciar.addEventListener("click", vaciarCarrito);

function calcularTotal() {
    let total = 0;

    productosEnCarrito.forEach(producto => {
        const precio = parseFloat(producto.precio);
        const cantidad = producto.cantidad;
        total += precio * cantidad;
    });

    contenedorTotal.innerHTML = `Total: ${total.toFixed(2)}€`;
}

botonComprar.addEventListener("click", () => {
  Swal.fire({
      title: 'Ingrese el número de la mesa',
      input: 'number',
      inputAttributes: {
          min: 1,
          max: 15
      },
      showCancelButton: true,
      confirmButtonText: 'PEDIR',
      cancelButtonText: 'Cancelar',
      showLoaderOnConfirm: true,
      preConfirm: (mesa) => {
          if (mesa) {
              const formData = new FormData();
              formData.append("productos", JSON.stringify(productosEnCarrito));
              formData.append("mesa", mesa);

              return fetch("carrito.php", {
                  method: "POST",
                  body: formData
              })
              .then(response => {
                  if (!response.ok) {
                      throw new Error(response.statusText);
                  }
                  return response.text();
              })
              .catch(error => {
                  Swal.showValidationMessage(
                      `Request failed: ${error}`
                  );
              });
          }
      },
      allowOutsideClick: () => !Swal.isLoading()
  }).then((result) => {
      if (result.value.trim() === "success") {
          Swal.fire(
              'Compra realizada',
              'Su pedido se ha enviado correctamente',
              'success'
          ).then(() => {
              localStorage.removeItem('productos-en-carrito'); // Eliminar los productos del carrito del localStorage
              cargarProductosCarrito(); // Actualizar la visualización del carrito (opcional)
              window.location.href = 'pedidos.php'; // Redireccionar a la página deseada después de aceptar
          });
      } else {
          Swal.fire({
              title: 'Pedido Realizado',
              text: `Espera sentado a tu pedido:`,
              icon: 'success',
              backdrop: true,
              showConfirmButton: true,
              confirmButtonText: 'Aceptar'
          }).then(() => {
              localStorage.removeItem('productos-en-carrito'); // Eliminar los productos del carrito del localStorage
              cargarProductosCarrito(); // Actualizar la visualización del carrito (opcional)
              window.location.href = 'index.php'; // Redireccionar a la página deseada después de aceptar
          });
      }
  });
});




cargarProductosCarrito();

