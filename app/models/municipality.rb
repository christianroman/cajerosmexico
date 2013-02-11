class Municipality < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name, :state_id
  belongs_to :state
  has_many :atms
end
