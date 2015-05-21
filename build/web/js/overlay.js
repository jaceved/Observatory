/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// This is the modal effect I used for my project. 





function modalEffect(FrontImage,BackImage,caseID) {
var innerCase;
if(caseID==1){
 var image = FrontImage;
 innerCase =2;
}else if(caseID==2) {
    image = BackImage;
    innerCase=1;
}

    var div = document.getElementById('displaybox');
    if (div.style.display == "none"|| caseID==2 || caseID==1) {
        div.style.display = "";
 
      
div.innerHTML = "<table width='100%' height='100%'><tr><td align='center' valign='middle'\n\
 width='100%' height='100%'> <a href='#' onClick=modalEffect('"+ FrontImage + "','" +BackImage+ "','"+innerCase+"')><img class='over'src='http://localhost/img/goback.jpg' alt='' width='50' height='50'></a>\n\
<img id='under' src='http://localhost/img/whitspace.jpg' alt='' width='600' height='600'></a>\n\
<img id='images' src='" + image + "'alt='' width='400' height='400'>\n\
\n\
<a href='#' onclick='return modalEffect();'><img valign='top'  class='over'  src='http://localhost/img/exit.jpg' alt='' width='50' height='50'></a></td></tr></table>";
div.focus();
    } else {
        div.style.display = "none";
        div.innerHTML = '';
    }
    return false;
}




