

  def attribute(args, &block)
    if args.is_a?(Hash)
      name = args.keys[0]
      value = args.values[0]
    else
      name = args
    end
    define_method(name) do
      value ||= instance_eval &block if defined? yield
      @attr ||= value
    end
    define_method(name+'=') do |value|
      @attr = value
    end
    define_method(name+'?') do
      @attr != nil 
    end
  end

