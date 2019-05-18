require 'pry'

class Startup

  attr_reader :founder, :domain
  attr_accessor :name, :funding_rounds, :total_funds
  @@startups = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@startups << self
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def sign_contract(vc, type, amount)
    FundingRound.new(self, vc, type, amount)
  end

  def find_info
    FundingRound.all.select {|round|round.startup == self}
  end

  def num_funding_rounds
    self.find_info.count
  end

  def total_funds
    total = 0.0
    self.find_info.each {|round|total += round.investment}
    total
  end

  def investors
    all_investors = []
    find_info.each do |round|
      if all_investors.include?(round.vc)
      else
      all_investors << round.vc
      end
    end
    all_investors
  end

  def big_investors
    high_rollers = []
    investors.select do |round|
      if round.class.tres_commas_club.include?(round)
        if high_rollers.include?(round)
        else
          high_rollers << round
        end
      end
    end
  end

  def self.all
    @@startups
  end

  def self.find_by_founder(founder)
    self.all.find {|startup| startup.founder == founder}
  end

  def self.domains
    all_domains = []
    self.all.each {|startup| all_domains << startup.domain}
    all_domains
  end

end
