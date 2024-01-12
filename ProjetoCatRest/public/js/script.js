function openTab(evt,tabName){
    let i,tabContent,tablinks;
    tabContent = document.getElementsByClassName('tabContent');
    
    for(i = 0; i<tabContent.length; i++){
        tabContent[i].style.display = 'none';
    }
    tablinks = document.getElementsByClassName('tablinks');
    
    for(i = 0; i<tablinks.length; i++){
        tablinks[i].className = tablinks[i].className.replace(" active","");
    }

    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}

document.getElementsByClassName("tablink")[0].click();

  function abrirGerenciador(evt, action) {
    var i, x, tablink;
    x = document.getElementsByClassName("ocultar");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    tablink = document.getElementsByClassName("tablink");
    for (i = 0; i < x.length; i++) {
        tablink[i].classList.remove("modal-ativo");
    }
    document.getElementById(action).style.display = "block";
    evt.currentTarget.classList.add("modal-ativo");
  }

  function gerenciar() {
    document.getElementById('id01').style.display = 'block';
  }

  function fechar() {
    document.getElementById('id01').style.display = 'none';
  }



