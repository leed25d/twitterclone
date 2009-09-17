class Follow < ActiveRecord::Base
  belongs_to :other, :class_name => "User"
end
