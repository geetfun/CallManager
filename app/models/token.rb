class Token
    
  include ActiveAttr::Model
  
  attribute :outgoing, default: false
  attribute :incoming, default: false
  attribute :incoming_name
  attribute :expiration, default: 120
  
  attr_accessible :outgoing, :incoming, :incoming_name, :expiration
  
  validates_numericality_of :expiration, only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3600, allow_nil: false
  validates_presence_of :incoming_name, :if => Proc.new { |token| token.incoming == true }
  
  def save
    if valid?
      setup_capability
      set_outgoing if outgoing
      set_incoming(incoming_name) if incoming
      generate_token
    else
      false
    end
  end
  
  private
  
  def setup_capability
    @capability = Twilio::Util::Capability.new(TWILIO_SID, TWILIO_AUTH_TOKEN)
  end
  
  def generate_token
    @token = @capability.generate(expiration)
    @token
  end
  
  def set_outgoing
    @capability.allow_client_outgoing(TWILIO_APPLICATION_SID)
  end
  
  def set_incoming(name)
    @capability.allow_client_incoming(name)
  end
  
end