class State < ActiveRecord::Base
  attr_accessible :code, :latitude, :longitude, :name, :space, :zoom
  has_many :municipalities
end
