# frozen_string_literal: true

require 'site/project'

module ROM
  module Site
    class Project < ::Site::Project
      def org
        'rom-rb'
      end
    end
  end
end
