class Match < ActiveRecord::Base
  belongs_to :court
  has_many :players, dependent: :destroy
  has_many :users, through: :players

  validate :validate_match_players_count

  accepts_nested_attributes_for :players#, :reject_if => lambda { |a| a[:user_id].blank? }, :allow_destroy => true

  private

  def validate_match_players_count
    if self.players.length < 2
      errors.add(:match_players,'match with no opponents')
    end
  end
end
