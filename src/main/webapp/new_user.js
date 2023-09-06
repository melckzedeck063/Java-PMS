let
    employee = document.getElementById("employee_name"),
    address = document.getElementById("employee_address"),
    id = document.getElementById("employeeid"),
    contact = document.getElementById("employee_contact");

function preview() {
    document.querySelector('.prev:nth-child(1) .previewme').innerHTML = employee.value;
    document.querySelector('.prev:nth-child(2) .previewme').innerHTML = address.value;
    document.querySelector('.prev:nth-child(3) .previewme').innerHTML = id.value;
    document.querySelector('.prev:nth-child(4) .previewme').innerHTML = contact.value;

    employee.value.length > 6 ? document.querySelector('.prev:nth-child(1) span i').style.opacity = "100%" : document.querySelector('.prev:nth-child(1) span i').style.opacity = "0%";
    address.value.length > 15 ? document.querySelector('.prev:nth-child(2) span i').style.opacity = "100%" : document.querySelector('.prev:nth-child(2) span i').style.opacity = "0%";
    id.value.length > 7 ? document.querySelector('.prev:nth-child(3) span i').style.opacity = "100%" : document.querySelector('.prev:nth-child(3) span i').style.opacity = "0%";
    contact.value.length > 9 ? document.querySelector('.prev:nth-child(4) span i').style.opacity = "100%" : document.querySelector('.prev:nth-child(4) span i').style.opacity = "0%";


}

function validate() {
    employee.value.length > 6 ? employee.nextElementSibling.innerHTML = "Successiful!" : employee.nextElementSibling.innerHTML = "Enter Valid Employee Name";
    employee.value.length > 6 ? employee.nextElementSibling.style.color = "green" : employee.nextElementSibling.style.color = "red";
    address.value.length > 15 ? address.nextElementSibling.innerHTML = "Successiful!" : address.nextElementSibling.innerHTML = "Enter Valid Employee Address";
    address.value.length > 15 ? address.nextElementSibling.style.color = "green" : address.nextElementSibling.style.color = "red";
    id.value.length > 7 ? id.nextElementSibling.innerHTML = "Successiful!" : id.nextElementSibling.innerHTML = "Enter Valid Employee Id";
    id.value.length > 7 ? id.nextElementSibling.style.color = "green" : id.nextElementSibling.style.color = "red";
    contact.value.length > 9 ? contact.nextElementSibling.innerHTML = "Successiful!" : contact.nextElementSibling.innerHTML = "Enter Valid Employee Contact";
    contact.value.length > 9 ? contact.nextElementSibling.style.color = "green" : contact.nextElementSibling.style.color = "red";

    if (employee.value.length > 6 && address.value.length > 15 && id.value.length > 7 && contact.value.length > 9) {
        
        const loading = document.createElement("div");
        loading.setAttribute("class", "loader");
        document.getElementById("buttonGet").innerHTML = "";
        document.getElementById("buttonGet").append(loading);
        setTimeout(() => {
            window.location = "allemployee.html";
        }, 4000);

        return true;
    }
    return false;
}