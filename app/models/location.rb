class Location < ActiveRecord::Base
  has_many :courts
  has_many :users
end
