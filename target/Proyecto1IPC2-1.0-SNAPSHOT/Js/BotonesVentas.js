/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

(function(){
    
    var button=document.querySelector("#newVenta");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelVendedor/verificarNitCliente.jsp",true);
        xhr.send();
    }
})();
(function(){
    
    var button=document.querySelector("#facturas");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelVendedor/NumeroNItFactura.jsp",true);
        xhr.send();
    }
})();
(function(){
    
    var button=document.querySelector("#almacenDeMueblesDisponibles");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelVendedor/mueblesDisponibles.jsp",true);
        xhr.send();
    }
})();
(function(){
    
    var button=document.querySelector("#verificarCompras");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelVendedor/ConsultarCompras.jsp",true);
        xhr.send();
    }
})();
(function(){
    
    var button=document.querySelector("#verificarDevoluciones");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelVendedor/ConsultasDevoluciones.jsp",true);
        xhr.send();
    }
})();

