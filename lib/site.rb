# frozen_string_literal: true

require 'yaml'

require 'site/project'
require 'site/markdown'

module Site
  def self.projects
    @projects ||= YAML.load_file(data_path.join('projects.yaml')).map(&Project.method(:new))
  end

  def self.data_path
    root.join('data')
  end

  def self.root
    @root ||= Pathname(__dir__).join('..')
  end

  def self.development?
    ENV['BUILD'] != 'true'
  end
end
