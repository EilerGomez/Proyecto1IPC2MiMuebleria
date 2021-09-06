/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

(function(){    
    var button=document.querySelector("#users");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelAdministrador/TablaDeUsuarios.jsp",true);
        xhr.send();
    }
})(); 
(function(){    
    var button=document.querySelector("#verificarComprasXTiempo");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelAdministrador/ComprasenXTiempo.jsp",true);
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
        xhr.open("get","DelAdministrador/devolucionEnXTiempo.jsp",true);
        xhr.send();
    }
})();
(function(){    
    var button=document.querySelector("#gananciasXTiempo");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelAdministrador/GananciasEnXtiempo.jsp",true);
        xhr.send();
    }
})();
(function(){    
    var button=document.querySelector("#UsuarioReportesMaxVentaXTiempo");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelAdministrador/UsuarioQReportaMasMueblesXtiempo.jsp",true);
        xhr.send();
    }
})();
(function(){    
    var button=document.querySelector("#muebleMasVendidoXTiempo");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelAdministrador/muebleMasVendido.jsp",true);
        xhr.send();
    }
})();
(function(){    
    var button=document.querySelector("#muebleMenosVendidoXTiempo");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelAdministrador/muebleMenosVenidoXTiempo.jsp",true);
        xhr.send();
    }
})();
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
        xhr.open("get","DelAdministrador/GenerarMuebles.jsp",true);
        xhr.send();
    }
})();
(function(){    
    var button=document.querySelector("#muebles");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelAdministrador/modificarMueblesTabla.jsp",true);
        xhr.send();
    }
})();
(function(){    
    var button=document.querySelector("#agregarCapital");
    var divContenedor = document.getElementById("Contenido");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelAdministrador/IngresarCapitalActual.jsp",true);
        xhr.send();
    }
})();
