$(document).on('turbolinks:load', function () {
  var $users;
  if (($users = $('.users')).length) {
    // procesamiento de la respuesta del request Ajax para seguir/deseguir un usuario
    $users.on('ajax:success', function (e, data) {
      var $button;

      // si la respuesta contiene un usuario al que se sigue
      if (data.following) {
        $button = $('.user-stream-item [data-user-id="' + data.following.id + '"]');
        $button.data('method', 'delete');
        $button.attr('href', '/followers/' + data.follow.id);
        $button.text('Unfollow');
      } else {
        $button = $('.user-stream-item [data-user-id="' + data.unfollowing.id + '"]');
        $button.data('method', 'post');
        $button.attr('href', '/users/' + data.unfollowing.id + '/followers');
        $button.text('Follow');
      }
    }).on('ajax:error', function (e, data) {
      console.log(data);
    });
  }
});
