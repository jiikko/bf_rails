# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  App.cable.subscriptions.create "MyTradeChannel",
    received: (data) ->
      console.log(data)
      switch data.type
        when "my_trades_table"
          console.log('found my_trade_table')
          $("#my_trade_table").html(data.html)
        when "disparity_status"
          $("#disparity").html(data.html)
        else
          console.log('not found type')

    connected: ->
      console.log('connected')
