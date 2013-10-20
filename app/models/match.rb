class Match < ActiveRecord::Base
  belongs_to :court
  has_many :players, dependent: :destroy
  has_many :users, through: :players

  accepts_nested_attributes_for :players #, :reject_if => lambda { |a| a[:user_id].blank? }, :allow_destroy => true
end
