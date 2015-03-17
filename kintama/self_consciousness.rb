require 'kintama'
require 'yaml'
require 'moneta'
require_relative '../lib/self_consciousness'

describe 'self_consciousness required in a running script' do
  setup do
    @storage = Moneta.new :File, dir: '.self_consciousness'
    thread = Thread.new { system "ruby #{__dir__}/test.rb" }
    thread.join
  end

  should 'decide what\'s "normal"' do
    expected = [{:output=>[1], :from=>:foo, :to=>:bar}]
    SelfConsciousness.normalize
    assert_equal true, @storage.key?('normal')
    assert_equal expected, @storage.fetch('normal', nil)
  end
end
