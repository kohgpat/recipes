$(document).on 'ready page:load', ->
  $('#navigation a[href="/' + location.pathname.split("/")[1] + '"]').addClass('active')
