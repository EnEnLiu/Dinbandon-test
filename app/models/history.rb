class History < ApplicationRecord
  belongs_to :users
  belongs_to :events
end
