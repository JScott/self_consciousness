require 'self_identity'
#require_relative '../lib/self_consciousness'

puts 'huh'

def foo(array)
  array.push 1
end
puts 'huh2'

def bar(array)
  array.push 2
end
puts 'huh3'

var = foo []
var = bar var
puts 'huh4'
