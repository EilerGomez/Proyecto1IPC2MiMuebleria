/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

(function(){
    
    var button=document.querySelector("#almacenMueblesALaVenta");
    var divContenedor = document.getElementById("contenidoMuebles");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","MueblesVenta.jsp",true);
        xhr.send();
    }
})();
