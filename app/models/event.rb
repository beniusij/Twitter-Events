class Event < ApplicationRecord
  validates :date, :keywords, presence: true
  def self.search(search)
    date = search[:date]
    keywords = search[:keywords]
    if !date.empty? && !keywords.empty?
      where("(keywords LIKE ? OR place LIKE ?) " + "AND date = ?",
            "%" + keywords + "%", "%" + keywords + "%",
            date).order(date: :asc)
    elsif !date.empty?
      where("date = ?", date).order(place: :asc)
    elsif !keywords.empty?
      where("keywords LIKE ? OR place LIKE ?", "%" + keywords + "%",
            "%" + keywords + "%").order(date: :asc)
    end
  end
end
