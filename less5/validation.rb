module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanseMethods
  end

  module ClassMethods

    def validations
      @validations ||= []
    end

    def validate(name,type_v,*parametrs)
      validations
      @validations << { :name => name , :type_v => type_v, :parametrs => parametrs}
    end

    def validate_by_type(validation, attr_val)
      case validation[:type_v]
      when :presence
        raise "#{validation[:name].capitalize} shouldn't be nil or empty!" if attr_val.nil? || attr_val.to_s.empty?
      when :format
        raise "Wrong format! #{validation[:name]}" if attr_val !~ validation[:parametrs].first
      when :type
        raise "Wrong type!#{validation[:name]}" if attr_val.class != validation[:parametrs].first
      end
    end
  end

  

  module InstanseMethods  

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    private

    def validate!
      self.class.validations.each do |validation|
        attr_val = self.instance_variable_get("@#{validation[:attr_name]}".to_sym)
        self.class.validate_by_type(validation, attr_val)
      end
    end
  end
end
