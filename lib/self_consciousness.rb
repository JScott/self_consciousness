require 'moneta'
require 'fileutils'
require 'colorize'

module SelfConsciousness
  def self.normalize
    FileUtils.mkdir_p '.self_consciousness'
    FileUtils.cp '.self_identity/dependencies', '.self_consciousness/dependencies'
  end

  def self.introspect
    latest = Moneta.new :File, dir: '.self_identity'
    conscious = Moneta.new :File, dir: '.self_consciousness'
    conscious['removals'] = conscious['dependencies'] - latest['dependencies']
    conscious['additions'] = latest['dependencies'] - conscious['dependencies']
  end

  def self.report
  end
end
