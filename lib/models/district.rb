class District < ActiveRecord::Base

    has_many :bounties
    has_many :users, through: :bounties

end