class FundingRound

  attr_reader :startup, :vc
  attr_accessor :type, :investment
  @@funding_rounds = []

  def initialize(startup, vc, type, investment)
    @startup = startup
    @vc = vc
    @type = type
    if investment > 0
      @investment = investment.to_f
    else
      @investment = 0.0
    end
    @@funding_rounds << self
  end

  def self.all
    @@funding_rounds
  end



end
