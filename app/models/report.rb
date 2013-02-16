class Report < ActiveRecord::Base
  attr_accessible :atm_id, :reported_at, :status, :type_id
  belongs_to :atm
end
