class NextIdFor
  attr_reader :klass

  def self.perform(*args)
    self.new(*args).perform
  end

  def initialize(klass)
    @klass = klass
  end

  def perform
    if constantized_klass.last.nil?
      1
    else
      constantized_klass.last.id + 1
    end
  end

  def constantized_klass
    return klass if klass.is_a?(Class)
    klass.constantize
  end
end
