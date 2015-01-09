require "type_constraints"

class Module
  def has(data)
    self.module_eval do
      attr_reader *data.keys
      data.each do |key, val|
        define_method(:"#{key}=") do |v|
          ::TypeConstraints.check!(val, v, 2)
          instance_variable_set(:"@#{key}", v)
        end
      end
    end
  end
end
