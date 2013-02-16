class Atm < ActiveRecord::Base
  attr_accessible :bank_id, :branch, :district, :latitude, :longitude, :municipality_id, :street, :zipcode, :status
  has_many :reports
  belongs_to :municipality
  belongs_to :bank

  validates_presence_of :municipality, :message => "no es valido"
  validates_presence_of :bank, :message => "no es valido"

  validates :bank_id, :branch, :latitude, :longitude, :municipality_id, :presence => { :message => "no puede estar vacio" }

  validates_uniqueness_of :bank_id, :scope => [:latitude, :longitude], :message => "este registro ya existe"

  validates :branch, :length => { :maximum => 255, :message => "excede numero de caracteres permitidos" }
  validates :district, :length => { :maximum => 255, :message => "excede numero de caracteres permitidos" }, :allow_blank => true
  validates :street, :length => { :maximum => 255, :message => "excede numero de caracteres permitidos" }, :allow_blank => true
  validates :zipcode, :length => { :maximum => 5, :message => "excede numero de caracteres permitidos" }, :allow_blank => true

  validates :latitude, :numericality => { :message => "debe ser numerico" }
  validates :longitude, :numericality => { :message => "debe ser numerico" }
  
  def self.nearby(latitude, longitude, radius, bank)
      lat = Float(latitude) rescue 0
      lon = Float(longitude) rescue 0
      rad = Integer(radius) rescue 0

      if bank.nil? || bank.match(/^([1-5][0-5]*,)*[1-5][0-5]*$/).nil?
	  bank = 0
      end

      find_by_sql("SELECT * FROM nearbyatms(#{lat}, #{lon}, #{rad}, '#{bank}')")
  end

  def self.municipality(municipality, latitude, longitude, bank)
      #where("municipality_id = ?", municipality)
      lat = Float(latitude) rescue 0
      lon = Float(longitude) rescue 0
      mun = Integer(municipality) rescue 0

      if bank.nil? || bank.match(/^([1-5][0-5]*,)*[1-5][0-5]*$/).nil?
	  bank = 0
      end

      find_by_sql("SELECT * FROM municipality(#{mun}, #{lat}, #{lon}, '#{bank}')")
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
