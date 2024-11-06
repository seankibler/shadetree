class Vehicle < ApplicationRecord
  belongs_to :make
  belongs_to :model
  belongs_to :sub_model, optional: true
  belongs_to :customer, optional: true

  validates :vin, uniqueness: {allow_nil: true}
end
