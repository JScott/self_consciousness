#!/usr/bin/env ruby
require 'self_identity'

def foo(array)
  array.push 1
end

def bar(array)
  array.push 2
end

def baz(array)
  puts 'Done!'
end

var = bar []
var = baz var
