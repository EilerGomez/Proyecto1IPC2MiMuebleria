/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
(function(){
    
    var button=document.querySelector("#Consultar");
    var divContenedor = document.getElementById("tablaConsultasCompras");
    button.addEventListener("click", obtenerHTML,true);
    function obtenerHTML(e){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange= function(){
            if(xhr.status===200){
                divContenedor.innerHTML = xhr.responseText;
            }
        };
        xhr.open("get","DelVendedor/TablaConsultas.jsp",true);
        xhr.send();
    }
})();

