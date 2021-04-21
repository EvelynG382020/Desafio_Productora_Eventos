class Concert < ApplicationRecord
  belongs_to :group, optional: true
end
