

$(document).on('keyup', '#organization_org_name', function(){
  var str = $(this).val()
  org_identifier = str.replace(/[^a-z0-9_]/gi, ' ').replace(/\s{1,}/g, '_');
  $("#organization_org_identifier").val(org_identifier)
})



$(document).ready(function(){
  org_validation();
  additional_validations();
})

function org_validation(){
  $('#new_organization').validate({
    onkeyup: false,
    errorClass: 'state-error',
    validClass: 'state-success',
    errorElement: 'em',
    rules: {
      'organization[org_name]': {
        required: true,
        maxlength: 50
      },
      'organization[first_name]': {
        required: true,
        minlength: 2,
        maxlength: 50
      },
      'organization[last_name]': {
        required: true,
        minlength: 2,
        maxlength: 50
      },
      'organization[addr_line1]': {
        required: true,
        minlength: 2,
        maxlength: 100
      },
      'organization[addr_line2]': {
        maxlength: 100
      },
      'organization[city]': {
        required: true,
        minlength: 2,
        maxlength: 35
      },
      'organization[state]': {
        maxlength: 50
      },
      'organization[country]': {
        required: true,
        maxlength: 90
      },
      'organization[zipcode]': {
        required: true,
        digits: true,
        minlength: 6,
        maxlength: 6
      }
    },
    messages: {

    }
  });

}



function additional_validations(){
  var inputElement = $(':input[name="organization[org_name]"]');
  var data = { }
  data[inputElement.attr('id')] = inputElement.val()
  inputElement.rules("add",
  {
    remote:
    {
        url: inputElement.parents('form').data('unique-org-url'),
        type: "post"
    },
    messages: {
      remote: 'This name is already registered.'
    }
  });
}


