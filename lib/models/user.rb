class User < ActiveRecord::Base
    
    has_many :bounties
    has_many :districts, through: :bounties
    
end