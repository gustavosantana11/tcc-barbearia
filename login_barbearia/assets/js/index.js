if (localStorage.getItem("token") == null) {
  alert("Você precisa estar logado para acessar essa página");
  window.location.href = "../html/signin.html";
}

const userLogado = JSON.parse(localStorage.getItem("userLogado"));

if (userLogado.nivelAcesso != "1") {
  alert("Você não tem permissão para acessar essa página");
  window.location.href = "../html/index.html";
}

const logado = document.querySelector("#logado");
logado.innerHTML = `Olá ${userLogado.nome}`;

function sair() {
  localStorage.removeItem("token");
  localStorage.removeItem("userLogado");
  window.location.href = "../html/signin.html";
}
