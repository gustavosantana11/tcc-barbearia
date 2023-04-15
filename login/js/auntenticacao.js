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