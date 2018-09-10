$(document).on('click', '[data-role=close-dialog]', function() {
  remove_dialog();
  return false;
})

function remove_dialog() {
  $('.dialog').remove();
}
