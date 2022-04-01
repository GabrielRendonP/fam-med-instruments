class Test < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
