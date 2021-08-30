//para hacer visible o no algunos archivos
/*function fnLibroEnsamle() {
 var visibility = document.getElementById('libro').style.visibility;
 if (visibility === 'hidden') {
 document.getElementById('libro').style.visibility = 'visible';
 document.getElementById('par2').style.visibility = 'hidden';
 } else {
 document.getElementById('libro').style.visibility = 'hidden';
 document.getElementById('par2').style.visibility = 'visible';
 }
 
 //document.getElementById('id2').style.color = 'green';
 }*/
/*$(document).ready(function(){
 $('#libroEnsamblador').click(function(){
 $("#contenido").load("texto.html");
 });
 });*/
/*function abrirUrl(url,contenedor){
    $.get(url,{},function(data){
        $("#" + contenedor).html()(data);
    });
}*/

/*(function(){
    
    var button=document.querySelector("button");
    var divContenedor = document.getElementById("html");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","prueba.html",true);
        xhr.send();
    }
})();
(function(){
    
    var button=document.querySelector("#ac");
    var divContenedor = document.getElementById("html");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","prueba2.html",true);
        xhr.send();
    }
})();*/
(function(){
    
    var button=document.querySelector("#libro");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelFabricador/libroFabricacion.html",true);
        xhr.send();
    }
})();
(function(){
    
    var button=document.querySelector("#compras");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelFabricador/ComprarPiezas.jsp",true);
        xhr.send();
    }
})();
(function(){
    
    var button=document.querySelector("#historialPiezas");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelFabricador/HistorialPiezas.jsp",true);
        xhr.send();
    }
})();
(function(){
    
    var button=document.querySelector("#almacenDePiezasNoUsadas");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelFabricador/AlmacenDepiezas.jsp",true);
        xhr.send();
    }
})();
(function(){    
    var button=document.querySelector("#generarPiezas");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelFabricador/GenerarPiezas.jsp",true);
        xhr.send();
    }
})();
(function(){    
    var button=document.querySelector("#ensamble");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelFabricador/cantidadPiezasMueble.jsp",true);
        xhr.send();
    }
})();
/*(function(){    
    var button=document.querySelector("#traerTablaPiezas");
    var divContenedor = document.getElementById("contenidoTabla");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelFabricador/AlmacenDepiezas.jsp",true);
        xhr.send();
    }
})();*/
(function(){    
    var button=document.querySelector("#generarMuebles");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelFabricador/GenerarMuebles.jsp",true);
        xhr.send();
    }
})();
(function(){    
    var button=document.querySelector("#almacenDeMueblesEnsamblados");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelFabricador/AlmacenDeMuebles.jsp",true);
        xhr.send();
    }
})();
(function(){    
    var button=document.querySelector("#historialMuebles");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelFabricador/HistorialMuebles.jsp",true);
        xhr.send();
    }
})();
(function(){    
    var button=document.querySelector("#registrarMueble");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelFabricador/PasarMuebleAventa.jsp",true);
        xhr.send();
    }
})();
(function(){    
    var button=document.querySelector("#compraDeAgotadas");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelFabricador/ComprarPiezas.jsp",true);
        xhr.send();
    }
})();

