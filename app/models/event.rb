class Event < ApplicationRecord
  validates :date, :keywords, presence: true
  def self.search(search)
    if search
      find(:all, :conditions => ['full_text LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
