# frozen_string_literal: true

class CargoTrain < Train
  def initialize(numberde)
    super
    @type = :cargo
  end
end
