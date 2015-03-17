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

  should 'compare itself with it\'s idea of "normal"' do
    expected = {
      removed: [{:output=>[1], :from=>:foo, :to=>:bar}],
      added: [{:output=>[2], :from=>:bar, :to=>:baz}]
    }
    SelfConsciousness.normalize
    execute "#{__dir__}/test.rb differently"
    SelfConsciousness.introspect
    assert_equal expected[:added], @storage.fetch('added', nil)
    assert_equal expected[:removed], @storage.fetch('removed', nil)
  end
end
