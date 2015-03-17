require 'kintama'
require 'yaml'
require 'moneta'
require_relative '../lib/self_consciousness'
require_relative 'stdout_helper'

def execute(path)
  thread = Thread.new { system "ruby #{path}" }
  thread.join
end

def run_and_normalize
  execute "#{__dir__}/test.rb"
  SelfConsciousness.normalize
end

def run_and_introspect
  execute "#{__dir__}/test.rb differently"
  SelfConsciousness.introspect
end

describe SelfConsciousness do
  setup do
    @storage = Moneta.new :File, dir: '.self_consciousness'
    run_and_normalize
  end

  should 'decide what\'s "normal"' do
    expected_dependencies = [{:output=>[1], :from=>:foo, :to=>:bar}]
    assert_equal true, @storage.key?('dependencies')
    assert_equal expected_dependencies, @storage.fetch('dependencies', nil)
  end

  should 'compare itself with its idea of "normal"' do
    expected = {
      removals: [{:output=>[1], :from=>:foo, :to=>:bar}],
      additions: [{:output=>[2], :from=>:bar, :to=>:baz}]
    }
    run_and_introspect
    expected.each do |key, value|
      assert_equal expected[key], @storage.fetch(key.to_s, nil)
    end
  end

  should 'report a diff of additions and removals' do
    run_and_introspect
    [/removed/, /added/].each do |expected|
      assert_output expected do
        SelfConsciousness.report
      end
    end
  end
end
