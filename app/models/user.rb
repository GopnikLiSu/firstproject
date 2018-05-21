class User < ApplicationRecord
  validates :name, :description, presence: true
end
