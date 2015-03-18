#!/usr/bin/env ruby
require 'self_identity'

def foo(array)
  array.push 1
end

def bar(array)
  puts 'done'
end

var = foo []
var = bar var
