class Location < ActiveRecord::Base
  has_many :courts
  has_many :users

  def to_param
    "#{id}-#{name}".parameterize
  end
end
