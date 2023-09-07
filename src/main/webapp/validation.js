let
    firstname = document.getElementById("firstname"),
    lastname = document.getElementById("lastname"),
    phone = document.getElementById("phonenumber"),
    email = document.getElementById("email"),
    gender = document.getElementById("gender"),
    company = document.getElementById("company"),
    passcode = document.getElementById("passcode"),
    cpasscode = document.getElementById("cpasscode");

function validation () {
   
    firstname.value.length < 5 ? firstname.nextElementSibling.innerHTML = "First Name Should be Greater than 4 Character" : firstname.nextElementSibling.innerHTML = "Firstname Accepted!";
    firstname.value.length < 5 ? firstname.nextElementSibling.style.color = "red" : firstname.nextElementSibling.style.color = "rgb(51, 255, 0)";

    lastname.value.length < 5 ? lastname.nextElementSibling.innerHTML = "Last Name Should be Greater than 4 Character" : lastname.nextElementSibling.innerHTML = "Lastname Accepted!";
    lastname.value.length < 5 ? lastname.nextElementSibling.style.color = "red" : lastname.nextElementSibling.style.color = "rgb(51, 255, 0)";

    email.value.length < 11 ? email.nextElementSibling.innerHTML = "Email Name Should be Greater than 10 Character" : email.nextElementSibling.innerHTML = "email Accepted!";
    email.value.length < 11 ? email.nextElementSibling.style.color = "red" : email.nextElementSibling.style.color = "rgb(51, 255, 0)";

    phone.value.length < 10 ? phone.nextElementSibling.innerHTML = "Phone Should be Greater than 9 Character" : phone.nextElementSibling.innerHTML = "phone Accepted!";
    phone.value.length < 10 ? phone.nextElementSibling.style.color = "red" : phone.nextElementSibling.style.color = "rgb(51, 255, 0)";

    passcode.value.length < 7 ? passcode.nextElementSibling.innerHTML = "Password Should be Greater than 6 Character" : passcode.nextElementSibling.innerHTML = "Password Accepted!";
    passcode.value.length < 7 ? passcode.nextElementSibling.style.color = "red" : passcode.nextElementSibling.style.color = "rgb(51, 255, 0)";

    cpasscode.value !== passcode.value ? cpasscode.nextElementSibling.innerHTML = "Password Do not Match!" : cpasscode.nextElementSibling.innerHTML = "Password Confirmed Successful!";
    cpasscode.value !== passcode.value ? cpasscode.nextElementSibling.style.color = "red" : cpasscode.nextElementSibling.style.color = "rgb(51, 255, 0)";
 
    if (firstname.value.length >= 5){
        if(lastname.value.length >= 5 ){
            if(email.value.length >= 11){
                if(phone.value.length >= 10){
                    if( passcode.value.length >= 7){
                        if(cpasscode.value === passcode.value){
                            alert('Passwords  match');
                            window.location="login.html";
                            return true;
                        }
                    }
                }
            }
        }
    }else{return false} ;
}