function pegar() {
    return document.getElementsByName("pegar");
}

function repetidas() {
    return document.getElementsByName("repetidas");
}

function verificarSeleccion() {
    let p = pegar();
    let r = repetidas();

    let pegadas = 0;
    let repetidasCont = 0;

    for (let i = 0; i < p.length; i++) {

        if (p[i].checked && r[i].checked) {
            console.log("Error: no puede estar en ambos");
            return false;
        }

        if (p[i].checked) {
            pegadas++;
        }

        if (r[i].checked) {
            repetidasCont++;
        }
    }

    console.log("Pegadas: " + pegadas);
    console.log("Repetidas: " + repetidasCont);
    console.log("Pendientes: " + (p.length - pegadas - repetidasCont));

    return true;
}

function contar(nombre, id, texto) {
    let elementos = document.getElementsByName(nombre);
    let contador = 0;

    for (let i = 0; i < elementos.length; i++) {
        if (elementos[i].checked) {
            contador++;
        }
    }

    let salida = document.getElementById(id);

    if (salida != null) {
        salida.innerHTML = texto + ": " + contador;
    }
}

function actualizarContadores() {
    contar("pegar", "pegadas", "Pegadas");
    contar("repetidas", "repetidas", "Repetidas");
}