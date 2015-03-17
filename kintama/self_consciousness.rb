require 'kintama'
require 'yaml'
require 'moneta'
require 'colorize'
require_relative '../lib/self_consciousness'
require_relative 'stdout_helper'

def execute(path)
  thread = Thread.new { system "ruby #{path}" }
  thread.join
end

def run_and(method = :normalize)
  script = method == :normalize ? 'test.rb' : 'test.rb differently'
  execute "#{__dir__}/#{script}"
  SelfConsciousness.send method
end

describe SelfConsciousness do
  setup do
    @storage = Moneta.new :File, dir: '.self_consciousness'
    @expected_introspection_results = {
      removals: [{:output=>[1], :from=>:foo, :to=>:bar}],
      additions: [{:output=>[2], :from=>:bar, :to=>:baz}]
    }
    SelfConsciousness.clear
    run_and :normalize
  end

  should 'decide what\'s "normal"' do
    expected_dependencies = [{:output=>[1], :from=>:foo, :to=>:bar}]
    assert_equal true, @storage.key?('dependencies')
    assert_equal expected_dependencies, @storage.fetch('dependencies', nil)
  end

  should 'compare itself with its idea of "normal"' do
    run_and :introspect
    @expected_introspection_results.each do |key, value|
      assert_equal value, @storage.fetch(key.to_s, nil)
    end
  end

  should 'introspect before reporting' do
    run_and :report
    @expected_introspection_results.each do |key, value|
      assert_equal value, @storage.fetch(key.to_s, nil)
    end
  end

  should 'report a diff of additions and removals' do
    assert_output /-.*+/ do
      run_and :report
    end
  end
end
