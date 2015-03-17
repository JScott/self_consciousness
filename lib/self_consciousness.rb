require 'moneta'
require 'fileutils'

module SelfConsciousness
  def self.normalize
    FileUtils.rm_rf '.self_consciousness'
    FileUtils.cp_r '.self_identity', '.self_consciousness'
  end

  def doubt
    identity = Moneta.new :File, dir: '.self_identity'
    consciousness = Moneta.new :File, dir: '.self_consciousness'
  end
end

# realize
