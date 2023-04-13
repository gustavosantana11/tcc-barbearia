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