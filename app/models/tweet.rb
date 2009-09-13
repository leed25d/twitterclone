class Tweet < ActiveRecord::Base
  belongs_to :user
  validates_length_of :message, :maximum => 140, :message => "message too long. 140 chars maximim"
end
