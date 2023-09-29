// Classe Autenticacao
class Autenticacao {
    static usuarios = [
      new Usuario('aquilesbarbeiro', '12345', 1),
      new Usuario('kaikyadm', '54321', 2)
    ];
  
    static autenticarUsuario(nome, senha) {
      for (let i = 0; i < this.usuarios.length; i++) {
        const usuario = this.usuarios[i];
        if (usuario.nome === nome && usuario.senha === senha) {
          return usuario;
        }
      }
      return null;
    }
  }

// Event listener para o botão de login
document.querySelector('#btnLogin').addEventListener('click', () => {
    const nome = document.querySelector('#txtUsuario').value;
    const senha = document.querySelector('#txtSenha').value;
  
    const usuario = Autenticacao.autenticarUsuario(nome, senha);
  
    if (usuario != null) {
      if (usuario.nivelAcesso === 1) {
        // Redirecionar para a tela de ADM
      } else if (usuario.nivelAcesso === 2) {
        // Redirecionar para a tela de MASTER
      }
    } else {
      alert('Usuário ou senha inválidos');
    }
  });

let btn = document.querySelector('.fa-eye');

btn.addEventListener('click', ()=>{
  let inputSenha = document.querySelector('#senha');
  
  if(inputSenha.getAttribute('type') == 'password'){
    inputSenha.setAttribute('type', 'text');
  } else {
    inputSenha.setAttribute('type', 'password');
  }
});

function entrar(){
  let usuario = document.querySelector('#usuario');
  let userLabel = document.querySelector('#userLabel');
  
  let senha = document.querySelector('#senha');
  let senhaLabel = document.querySelector('#senhaLabel');
  
  let msgError = document.querySelector('#msgError');
  // let listaUser = [];
  
  let listaUser = [{
    nomeCad: 'kaikyadm',
    userCad: 'kaikyadm',
    senhaCad: '54321',
    nivelAcessoCad: '2'
  },
  {
    nomeCad: 'aquilesbarbeiro',
    userCad: 'aquilesbarbeiro',
    senhaCad: '12345',
    nivelAcessoCad: '1'
  },
];

  let userValid = {
    nome: '',
    user: '',
    senha: '',
    nivelAcesso: ''
  };
  
  // acessar banco de dados e buscar usuário válido

  // listaUser = JSON.parse(localStorage.getItem('listaUser'));

  console.log(usuario.value);
  console.log(senha.value);
  
  listaUser.forEach((item) => {
    if(usuario.value == item.userCad && senha.value == item.senhaCad){
      userValid = {
         nome: item.nomeCad,
         user: item.userCad,
         senha: item.senhaCad,
         nivelAcesso: item.nivelAcessoCad
      };
    }
  });
   
  if(usuario.value == userValid.user && senha.value == userValid.senha){
    let mathRandom = Math.random().toString(16).substr(2);
    let token = mathRandom + mathRandom;
    
    localStorage.setItem('token', token);
    localStorage.setItem('userLogado', JSON.stringify(userValid));
    
    verificarNivelAcesso(userValid.nivelAcesso);
  } else {
    userLabel.setAttribute('style', 'color: red');
    usuario.setAttribute('style', 'border-color: red');
    senhaLabel.setAttribute('style', 'color: red');
    senha.setAttribute('style', 'border-color: red');
    msgError.setAttribute('style', 'display: block');
    msgError.innerHTML = 'Usuário ou senha incorretos';
    usuario.focus();
  }
}

function verificarNivelAcesso(nivelAcesso) {
  if (localStorage.getItem("token") == null) {
    alert("Você precisa estar logado para acessar essa página");
    window.location.href = "../signin.html";
    return;
  }

  const userLogado = JSON.parse(localStorage.getItem("userLogado"));

  switch(nivelAcesso) {
    case '1':
      if (userLogado.nivelAcesso != "1") {
        window.location.href = "../testandoCrud.html";
        return;
      }
      break;
    case '2':
      if (userLogado.nivelAcesso != "2") {
        window.location.href = "../adm.html";
        return;
      }
      break;
    default:
      alert('Nível de acesso inválido');
      return;
  }

  switch(nivelAcesso) {
    case '1':
      window.location.href = 'testandoCrud.html';
      break;
    case '2':
      window.location.href = 'adm.html';
      break;
    default:
      alert('Nível de acesso inválido');
  }
}