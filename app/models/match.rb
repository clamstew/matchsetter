class Match < ActiveRecord::Base
  belongs_to :court
  has_many :players
  has_many :users, through: :players
end
