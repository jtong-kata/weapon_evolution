RSpec.configure do |config|
  config.mock_with :flexmock
end

require 'stringio'

module Kernel

  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end

end