module Company_Maker

  attr_reader :name_company

  def name_company(name_company)
    @name_company = name_company 
    puts "Компания-производитель #{name_company}"
  end

end

module InstanceCounter 

  def self.included(class)
    class.extend ClassMethods
    class.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader instances

  def instances
    @instances = 0
  end

  module InstanceMethods

    protected

    def register_instance
      self.class.instances += 1
    end
  end
end
