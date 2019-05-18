require 'pry'
class VentureCapitalist

  attr_reader :name
  attr_accessor :total_worth
  @@vcs = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@vcs << self
  end

  def self.all
    @@vcs
  end

  def self.tres_commas_club
    high_rollas = []
    self.all.each do |vc|
      if vc.total_worth>1000000000
        high_rollas << vc
      end
    end
    high_rollas
  end

  def offer_contract(startup, type, amount)
    FundingRound.new(startup, self, type, amount)
  end

  def find_info
    FundingRound.all.select {|round|round.vc == self}
  end

  def funding_rounds
    self.find_info.count
  end

  def portfolio
    startups = []
    self.find_info.each do |round|
      if startups.include?(round.startup)
      else
      startups << round.startup
      end
    startups
    end
  end

  def biggest_investment
    big = 0.0
    self.find_info.each do |round|
      if round.investment > big
        big = round.investment
      end
    end
    big
  end

  def invested(domain)
    total = 0.0
    self.find_info.each do |round|
      if round.startup.domain == domain
        total += round.investment
      end
    end
    total
  end

end
