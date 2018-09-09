// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require_tree .

function hide_workers_table(){
  $('#workers').children().remove();
}

function build_trade_link() {
  console.log('called build_trade_link')
  $('[data-role="buy_1"]').toggle('fast')
  var  min_price = parseInt($('[data-name=min_1_price]').text());
  $('[data-role="buy_1"]').children().remove()
  var a_tag = `<a data-method='post' data-remote=true data-method="post" href='/my_trades?price=${min_price}'>${min_price}</a>`
  $("[data-role='buy_1']").append($(a_tag));
  $('[data-role="buy_1"]').toggle('fast')

  $('[data-role="buy_5"]').toggle('slow')
  var min_price = parseInt($('[data-name=min_5_price]').text());
  $('[data-role="buy_5"]').children().remove()
  var a_tag = `<a data-method='post' data-remote=true data-method="post" href='/my_trades?price=${min_price}'>${min_price}</a>`
  $("[data-role='buy_5']").append($(a_tag));
  $('[data-role="buy_5"]').toggle('fast')
}

$(document).on('click', '[data-option-column=show]', function() {
  $('[data-option-column=profit]').toggle();
  return false;
})

$(document).on('click', '#worker_button', function() {
  if($('#workers table').size() >= 1) {
    hide_workers_table();
  } else {
    $.ajax('/resque/workers.js', { type: 'GET', timeout: 1000 });
  }
  return false;
})
