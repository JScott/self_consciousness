require 'kintama'
require 'yaml'
require 'moneta'
require_relative '../lib/self_consciousness'

def execute(path)
  thread = Thread.new { system "ruby #{path}" }
  thread.join
end

describe SelfConsciousness do
  setup do
    @storage = Moneta.new :File, dir: '.self_consciousness'
    execute "#{__dir__}/test.rb"
  end

  should 'decide what\'s "normal"' do
    expected_dependencies = [{:output=>[1], :from=>:foo, :to=>:bar}]
    SelfConsciousness.normalize
    assert_equal true, @storage.key?('dependencies')
    assert_equal expected_dependencies, @storage.fetch('dependencies', nil)
  end

  should 'compare itself with its idea of "normal"' do
    expected = {
      removals: [{:output=>[1], :from=>:foo, :to=>:bar}],
      additions: [{:output=>[2], :from=>:bar, :to=>:baz}]
    }
    SelfConsciousness.normalize
    execute "#{__dir__}/test.rb differently"
    SelfConsciousness.introspect
    expected.each do |key, value|
      assert_equal expected[key], @storage.fetch(key.to_s, nil)
    end
  end
end
