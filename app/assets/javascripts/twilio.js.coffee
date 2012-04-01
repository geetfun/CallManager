jQuery ->
    
  Twilio.Device.ready (device) ->
    console.log "Twilio: Ready"
  
  Twilio.Device.error (error) ->
    console.log "Error: #{error}"
    
  Twilio.Device.connect (connection) ->
    console.log "Twilio: Connection established"
  
  $.ajax({
    type: 'POST',
    url: '/api/tokens',
    success: (data, textStatus, jqXHR) =>
      Twilio.Device.setup(data.token.value)
  })
    
  $("#call").click (e) ->
    e.preventDefault()
    Twilio.Device.connect()