class Urls < ActiveRecord::Base

  before_create :set_short_url
  validates :long_url, :presence => true
  validates :long_url, :uniqueness => true

  def self.custom_url?(urls)
    sum = 0
    if urls =~ /\@*\.*(?<=\@)*\@(.+)\w*\.(.+)\w[2]*/  #La parte del último "*"" es la de dos letras despuès del "."
      sum += 1
    end

    if sum < 1
      1
    else
      2
    end
  end

  def set_short_url
    self.short_url = (0...4).map { (65 + rand(26)).chr }.join.downcase
  end
end
