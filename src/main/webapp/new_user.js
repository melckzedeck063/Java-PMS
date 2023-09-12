let
        employee = document.getElementById("firstname"),
        address = document.getElementById("employee_address"),
        id = document.getElementById("lastname"),
        contact = document.getElementById("employee_contact"),
        passcode = document.getElementById("password"),
        cpasscode = document.getElementById("cpassword");

function preview() {
    document.querySelector('.prev:nth-child(1) .previewme').innerHTML = employee.value;
    document.querySelector('.prev:nth-child(3) .previewme').innerHTML = address.value;
    document.querySelector('.prev:nth-child(2) .previewme').innerHTML = id.value;
    document.querySelector('.prev:nth-child(4) .previewme').innerHTML = contact.value;

    employee.value.length > 4 ? document.querySelector('.prev:nth-child(1) span i').style.opacity = "100%" : document.querySelector('.prev:nth-child(1) span i').style.opacity = "0%";
    address.value.length > 13 ? document.querySelector('.prev:nth-child(3) span i').style.opacity = "100%" : document.querySelector('.prev:nth-child(2) span i').style.opacity = "0%";
    id.value.length > 4 ? document.querySelector('.prev:nth-child(2) span i').style.opacity = "100%" : document.querySelector('.prev:nth-child(3) span i').style.opacity = "0%";
    contact.value.length > 9 ? document.querySelector('.prev:nth-child(4) span i').style.opacity = "100%" : document.querySelector('.prev:nth-child(4) span i').style.opacity = "0%";
    passcode.value.length > 6 ? document.querySelector('.prev:nth-child(5) span i').style.opacity = "100%" : document.querySelector('.prev:nth-child(5) span i').style.opacity = "0%";
    cpasscode.value === passcode.value ? document.querySelector('.prev:nth-child(6) span i').style.opacity = "100%" : document.querySelector('.prev:nth-child(6) span i').style.opacity = "0%";


}

function validate() {
    employee.value.length > 4 ? employee.nextElementSibling.innerHTML = "Successiful!" : employee.nextElementSibling.innerHTML = "Enter Valid Employee Name";
    employee.value.length > 4 ? employee.nextElementSibling.style.color = "green" : employee.nextElementSibling.style.color = "red";
    address.value.length > 13 ? address.nextElementSibling.innerHTML = "Successiful!" : address.nextElementSibling.innerHTML = "Enter Valid Employee Email";
    address.value.length > 13 ? address.nextElementSibling.style.color = "green" : address.nextElementSibling.style.color = "red";
    id.value.length > 4 ? id.nextElementSibling.innerHTML = "Successiful!" : id.nextElementSibling.innerHTML = "Enter Valid Last Name";
    id.value.length > 4 ? id.nextElementSibling.style.color = "green" : id.nextElementSibling.style.color = "red";
    contact.value.length > 9 ? contact.nextElementSibling.innerHTML = "Successiful!" : contact.nextElementSibling.innerHTML = "Enter Valid Employee Contact";
    contact.value.length > 9 ? contact.nextElementSibling.style.color = "green" : contact.nextElementSibling.style.color = "red";
    passcode.value.length < 7 ? passcode.nextElementSibling.innerHTML = "Password Should be Greater than 6 Character" : passcode.nextElementSibling.innerHTML = "Password Accepted!";
    passcode.value.length < 7 ? passcode.nextElementSibling.style.color = "red" : passcode.nextElementSibling.style.color = "rgb(51, 255, 0)";

    cpasscode.value !== passcode.value ? cpasscode.nextElementSibling.innerHTML = "Password Do not Match!" : cpasscode.nextElementSibling.innerHTML = "Password Confirmed Successful!";
    cpasscode.value !== passcode.value ? cpasscode.nextElementSibling.style.color = "red" : cpasscode.nextElementSibling.style.color = "rgb(51, 255, 0)";

    if (employee.value.length > 4 && address.value.length > 13 && id.value.length > 4 && contact.value.length > 9 && passcode.value.length > 6) {

        if (cpasscode.value === passcode.value) {
            const loading = document.createElement("div");
            loading.setAttribute("class", "loader");
            document.getElementById("buttonGet").innerHTML = "";
            document.getElementById("buttonGet").append(loading);
            setTimeout(() => {
                window.location = "allEmployee.html";
            }, 4000);

            return true;
        }
    }
    return false;
}