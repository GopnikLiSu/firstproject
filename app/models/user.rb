class User < ApplicationRecord
  has_and_belongs_to_many :rates
  accepts_nested_attributes_for :rates
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
