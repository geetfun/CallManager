module ApplicationHelper

  def twilio_javascript_include_tag
    javascript_include_tag "http://static.twilio.com/libs/twiliojs/1.0/twilio.min.js"
  end

end
