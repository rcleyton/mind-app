class Tag < ApplicationRecord
  belongs_to :user
  has_many :tag_contents, depedent: :destroy
  has_many :contents, through: :tag_contents

  validates :name, presence: true, uniqueness: true: { scope: :user_id }
end
