class Atm < ActiveRecord::Base
  attr_accessible :bank_id, :branch, :district, :latitude, :longitude, :municipality_id, :street, :zipcode
  belongs_to :municipality
  belongs_to :bank

  validates :bank_id, :branch, :latitude, :longitude, :municipality_id, :presence => true

  validates_uniqueness_of :bank_id, :scope => [:latitude, :longitude]

  validates :branch, :length => { :maximum => 255 }
  validates :district, :length => { :maximum => 255 }, :allow_blank => true
  validates :street, :length => { :maximum => 255 }, :allow_blank => true
  validates :zipcode, :length => { :maximum => 5 }, :allow_blank => true

  validates :latitude, :numericality => true
  validates :longitude, :numericality => true
  
  def self.nearby(latitude, longitude, radius, bank)
      lat = Float(latitude) rescue 0
      lon = Float(longitude) rescue 0
      rad = Integer(radius) rescue 0

      if bank.nil? || bank.match(/^([1-5][0-5]*,)*[1-5][0-5]*$/).nil?
	  bank = 0
      end

      find_by_sql("SELECT * FROM nearbyatms(#{lat}, #{lon}, #{rad}, '#{bank}')")
  end

  def self.municipality(municipality)
      where("municipality_id = ?", municipality)
  end

  def self.zipcode(zipcode, radius, bank)
      zip = zipcode.nil? ? '' : zipcode
      rad = Integer(radius) rescue 0  

      if bank.nil? || bank.match(/^([1-5][0-5]*,)*[1-5][0-5]*$/).nil?
	  bank = 0
      end

      find_by_sql("SELECT * FROM nearbyzipcode('#{zip}', #{rad}, '#{bank}')")
  end
  
end
