module Asseccors

  def attr_accessor_with_history(*methods)
    methods.each do |method|
      raise TypeError.new("method name is not symbol") unless method.is_a?(Symbol)
      define_method("#{method}_history".to_sym) { instance_variable_get("@#{method}_history".to_sym) }
      define_method(method)  { instance_variable_get("@#{method}".to_sym) }
      define_method("#{method}=") do |value|
        var = instance_variable_get("@#{method}_history".to_sym)
        var ||= []
        var << instance_variable_get("@#{method}".to_sym) if var.empty?
        var << value
        instance_variable_set("@#{method}_history".to_sym, var)
        instance_variable_set("@#{method}", value)
      end
    end
  end

  def strong_attr_accessor(attr_name, attr_class)
    define_method(attr_name) { instance_variable_get("@#{attr_name}".to_sym) }
    define_method("#{attr_name}=".to_sym) do |value|
      raise "Wrong type!" if value.class != attr_class
      instance_variable_set("@#{attr_name}".to_sym, value)
    end
  end
end
