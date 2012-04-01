jQuery ->
  
  
  
  # Twilio.Device.setup("")
  
  Twilio.Device.ready (device) ->
    console.log "Twilio is ready"
  
  Twilio.Device.error (error) ->
    console.log "Error: #{error}"
    
  Twilio.Device.connect (connection) ->
    console.log "Twilio successfully established call"
    
  $("#call").click (e) ->
    e.preventDefault()
    console.log "Clicked!"
    token_results = jQuery.post('/api/tokens')
    token_object = JSON.parse(token_results.responseText).token
    Twilio.Device.setup("#{token_object.value}")
    Twilio.Device.connect()