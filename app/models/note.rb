class Note < ApplicationRecord
  validates_presence_of :title, :text

  belongs_to :user
end
