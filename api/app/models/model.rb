class Model < ApplicationRecord
  belongs_to :make
  has_many :sub_models
end
