module ::Kernel
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    out.rewind
    return out
  ensure
    $stdout = STDOUT
  end

  def silence_stdout
    $stdout = StringIO.new
    return yield
  ensure
    $stdout = STDOUT
  end
end

def assert_output(expected, &block)
  output = capture_stdout(&block).read
  if expected.is_a?(Regexp)
    assert_match expected, output
  else
    assert_equal expected, output
  end
end
