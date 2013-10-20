class Court < ActiveRecord::Base
  belongs_to :location
  has_many :matches
end
