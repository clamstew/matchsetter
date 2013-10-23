class Match < ActiveRecord::Base
  belongs_to :court
  has_many :players, dependent: :destroy
  has_many :users, through: :players

  validate :validate_match_players_count

  accepts_nested_attributes_for :players

  private

  def validate_match_players_count
    if self.players.length < 2
      errors.add(:match_players,'match created with no opponents')
    elsif self.players.length > 4
      errors.add(:match_players,'match created with too many opponents')
    end
  end
end
