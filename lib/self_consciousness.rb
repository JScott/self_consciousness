require 'moneta'
require 'fileutils'
require 'colorize'

module SelfConsciousness
  def self.normalize
    FileUtils.mkdir_p '.self_consciousness'
    FileUtils.cp '.self_identity/dependencies', '.self_consciousness/dependencies'
  end

  def self.clear
    FileUtils.rm_rf '.self_consciousness'
  end

  def self.introspect
    latest = Moneta.new :File, dir: '.self_identity'
    conscious = Moneta.new :File, dir: '.self_consciousness'
    conscious['removals'] = conscious['dependencies'] - latest['dependencies']
    conscious['additions'] = latest['dependencies'] - conscious['dependencies']
  end

  def self.report
    introspect
    conscious = Moneta.new :File, dir: '.self_consciousness'
    conscious['removals'].each { |item| puts "- #{item.to_s}".colorize(:red) }
    conscious['additions'].each { |item| puts "+ #{item.to_s}".colorize(:green) }
  end
end
