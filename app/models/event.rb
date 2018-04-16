class Event < ApplicationRecord
  validates :date, :keywords, presence: true

  def self.search(search)
    date = search[:date].split(' - ')
    puts date
    keywords = search[:keywords]
    if !date.empty? && !keywords.empty?
      where("(keywords LIKE ? OR place LIKE ?) AND date BETWEEN ? AND ?",
            "%" + keywords + "%", "%" + keywords + "%", date[0], date[1]).order(date: :asc)
    elsif !date.empty?
      where("date BETWEEN ? AND ?", date[0], date[1]).order(place: :asc)
    elsif !keywords.empty?
      where("keywords LIKE ? OR place LIKE ?", "%" + keywords + "%",
            "%" + keywords + "%").order(date: :asc)
    end
  end

  def self.local_events(city)
    where('place LIKE ? OR keywords LIKE ?', '%' + city + '%',
          '%' + city + '%').order(date: :asc)
  end

  def self.other_events(city)
    where("place NOT LIKE ? OR keywords NOT LIKE ?", "%" + city + "%",
          '%' + city + '%').order(date: :asc)
  end
end
