class SelectedShow < ApplicationRecord
  belongs_to :user
  belongs_to :show
end
