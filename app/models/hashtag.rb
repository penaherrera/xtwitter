class Hashtag < ApplicationRecord
    #validations
    validates :name, presence: true
end
