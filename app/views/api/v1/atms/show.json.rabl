object @atm

attributes :id, :branch, :street, :district, :zipcode, :latitude, :longitude

child :municipality do
    extends "api/v1/municipalities/show"
    child :state do
	extends "api/v1/states/show"
    end
end

child :bank do
    extends "api/v1/banks/show"
end
