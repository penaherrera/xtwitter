class Quote < ApplicationRecord
  belongs_to :tweet
  belongs_to :author
end
