class Tweet < ApplicationRecord
  belongs_to :author

  #validations

  validates_associated :author
end
