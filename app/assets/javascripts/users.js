$(document).ready(function(){
  user_validation();
})



function user_validation(){
  $('#new_user').validate({
    onkeyup: false,
    errorClass: 'state-error',
    validClass: 'state-success',
    errorElement: 'em',
    rules: {
      'user[email]': {
        required: true,
        email: true,
        maxlength: 255
      },
      'user[password]': {
        required: true,
        minlength: 8,
        maxlength: 255
      },
      'user[password_confirmation]': {
        required: true,
        equalTo : '[name="user[password]"]'
      }
    },
    messages: {
      'user[password_confirmation]': {
        equalTo : 'password doesn\'t match'
      }
    }
  });

}