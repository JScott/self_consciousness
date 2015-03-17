require 'self_identity'

def foo(array)
  array.push 1
end

def bar(array)
  array.push 2
end

def baz(array)
  array.push 3
end

if ARGV[0].nil?
  var = foo []
  var = bar var
else
  var = bar []
  var = baz var
end
