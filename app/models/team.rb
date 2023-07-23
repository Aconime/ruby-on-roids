class Team < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :team_requests, dependent: :nullify
  belongs_to :owner, class_name: 'User'
end
