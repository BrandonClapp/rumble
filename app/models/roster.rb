class Roster < ActiveRecord::Base
  belongs_to :team
  belongs_to :tournament

  has_many :memberships, :dependent => :destroy
  has_many :users, through: :memberships
end
