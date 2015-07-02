class Team < ActiveRecord::Base
  has_many :memberships, :dependent => :destroy
  has_many :users, through: :memberships

  has_and_belongs_to_many :tournaments
end
