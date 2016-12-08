var person = document.getElementById('type_person');
var company = document.getElementById('type_company');

if(person.checked){
  var firstName = document.getElementById('first_name');
  var lastName = document.getElementById('last_name');
  var email = document.getElementById('email');
  var emailString = email.getAttribute('value');

  if(firstName.getAttribute('value') === '' || lastName.getAttribute('value') === '' || emailString === ''){
    console.log(false);
    
  }

  var validation = /^(\w{1,64})[^@]+@[^@]+(\w{1,64})$/

  if (!validation.test(emailString)){
    console.log(false);
  } 

} else {
  var companyName = document.getElementById('company_name');
  var phoneNumber = document.getElementById('phone');
  var phoneValidation = /^[\d\-\s]+$/;
  var num = phoneNumber.getAttribute('value');

  if(companyName.getAttribute('value') === '' || phoneNumber.getAttribute('value') === '' || (!phoneValidation.test(num) || num.length < 6)){
    console.log(false);
  }

}









