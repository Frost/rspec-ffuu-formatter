require 'rspec'

class FfuuFormatter
  ::RSpec::Core::Formatters.register self, :example_failed, :example_passed, :example_pending, :start_dump

  def initialize(output)
    @output = output
    @any_failing_spec = false
  end

  def example_failed(_notification)
    @any_failing_spec = true
    @output.print "F"
  end

  def example_passed(_notification)
    @output.print ( @any_failing_spec ? "U" : "." )
  end

  def example_pending(_notification)
    @output.print "*"
  end

  def start_dump(_notification)
    @output.puts
  end
end
