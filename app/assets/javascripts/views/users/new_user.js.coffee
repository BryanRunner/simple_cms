class SimpleCms.Views.NewUser extends SimpleCms.Views.HelperMethods

  template: JST['users/new_user']

  className: 'view'

  events: ->
    'submit #new-user' : 'createUser'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template())
    @

  createUser: (event) ->
    event.preventDefault()
    data = {
      email: $("#user-email").val(),
      password: $("#user-password").val(),
      password_conformation: $("#user-confirm-password").val()
    }
    myPostRequest = $.post('/users', data)
    myPostRequest.done ( data, textStatus, jqXHR ) ->
      alert(textStatus)


#
# data = //get your form data here, grab it from the form, or build out an object.
# //i.e:
# data = {username: $('form #username')...}
# myPostRequest = $.post('/users', data)
# ​
# ​
# myPostRequest.fail(function(jqXHR, textStatus, errorThrown){
#   // handle failures here - server failures - to hit this callback your server would have to return an error code
# })
# ​
# myPostRequest.always(function( data|jqXHR, textStatus, jqXHR|errorThrown ) {
#   //always run this callback, note the possible params depending on if it was an error or a success
# });


# <script type='text/javascript'>
#     /* attach a submit handler to the form */
#     $("#formoid").submit(function(event) {
#
#       /* stop form from submitting normally */
#       event.preventDefault();
#
#       /* get some values from elements on the page: */
#       var $form = $( this ),
#           url = $form.attr( 'action' );
#
#       /* Send the data using post */
#       var posting = $.post( url, { name: $('#name').val(), name2: $('#name2').val() } );
#
#       /* Alerts the results */
#       posting.done(function( data ) {
#         alert('success');
#       });
#     });
# </script>
