class Pocket < ApplicationRecord
    belongs_to :user, dependent: :destroy
    has_and_belongs_to_many :recipes
end
