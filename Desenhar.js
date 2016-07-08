var botao = document.getElementById("desenhar");
botao.onclick = function() {


    
   var um = document.myform.primeiro.value;
   var dois= document.myform.segundo.value;
   var tres = document.myform.terceiro.value;
   var quatro = document.myform.quarto.value;
   var cinco = document.myform.quinto.value;

   var larg = document.myform.largura.value;

   window.document.myform.pri.width = larg;
   window.document.myform.pri.height = um;

   window.document.myform.seg.width = larg;
   window.document.myform.seg.height = dois;

   window.document.myform.ter.width = larg;
   window.document.myform.ter.height = tres;

   window.document.myform.qua.width = larg;
   window.document.myform.qua.height = quatro;

   window.document.myform.qui.width = larg;
   window.document.myform.qui.height = cinco;   
   
} 
