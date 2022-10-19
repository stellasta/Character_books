class Character < ApplicationRecord
    validates :name, {presence: true, length: {maximum: 10}}
    validates :others1, {presence: true, length: {maximum: 30}}
    validates :user_id, {presence: true}
end
