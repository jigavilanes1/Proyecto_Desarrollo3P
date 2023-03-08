function CalcularTotal() {
    let sala = document.getElementById("sala").value;
    let cantidad = document.getElementById("cantidad").value;
    let total = document.getElementById("total");
    let precio = 0;
    
    if(sala === "2D DOB") {
        precio = cantidad * 5.20;
    } else if(sala === "2D ESP") {
        precio = cantidad * 6.60;
    } else if(sala === "3D ESP"){
        precio = cantidad * 7;
    }
    
    total.value = precio.toFixed(2);
}

