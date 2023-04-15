function toggleMenu() {
    const menuMobile = document.getElementById("menu-mobile")
    if (menuMobile.className === "menu-mobile-active") {
        menuMobile.className = "menu-mobile"
    } else {
        menuMobile.className = "menu-mobile-active"
    }
}

/*   MODAL  */
function mostrar_modalAgendamento() {
    const elemento = document.getElementById('modal_novoAgendamento')
    const myModal = new bootstrap.Modal(elemento);
    myModal.show();
}

function mostrar_modalEditar() {
    const elemento = document.getElementById('modal_editarAgendamento')
    const myModal = new bootstrap.Modal(elemento);
    myModal.show();
}

function mostrar_modalExcluir() {
    const elemento = document.getElementById('modal_excluirAgendamento')
    const myModal = new bootstrap.Modal(elemento);
    myModal.show();
}

function mostrar_modalDisponibilidade() {
    const elemento = document.getElementById('modal_addDisponibilidade')
    const myModal = new bootstrap.Modal(elemento);
    myModal.show();
}

/* MODAL DA TELA ADM*/
function mostrar_modalAdmNovo() {
    const elemento = document.getElementById('modal_admNovo')
    const myModal = new bootstrap.Modal(elemento);
    myModal.show();
}

function mostrar_modalAdmEditar() {
    const elemento = document.getElementById('modal_admEditar')
    const myModal = new bootstrap.Modal(elemento);
    myModal.show();
}

function mostrar_modalAdmEditarFuncionario() {
    const elemento = document.getElementById('modal_admEditarFuncionario')
    const myModal = new bootstrap.Modal(elemento);
    myModal.show();
}

function mostrar_modalAdmExcluirFuncionario() {
    const elemento = document.getElementById('modal_admExcluirFuncionario')
    const myModal = new bootstrap.Modal(elemento);
    myModal.show();
}

function mostrar_modalAdmEditarCliente() {
    const elemento = document.getElementById('modal_admEditarCliente')
    const myModal = new bootstrap.Modal(elemento);
    myModal.show();
}

function mostrar_modalAdmExcluirCliente() {
    const elemento = document.getElementById('modal_admExcluirCliente')
    const myModal = new bootstrap.Modal(elemento);
    myModal.show();
}
