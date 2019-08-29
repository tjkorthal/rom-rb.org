# frozen_string_literal: true

module Site
  class Project
    attr_reader :attrs

    def initialize(attrs)
      @attrs = attrs
    end

    def name
      attrs['name']
    end
    alias_method :to_s, :name

    def github_url
      "https://github.com/#{org}/#{name}"
    end

    def rubygems_url
      "https://rubygems.org/gems/#{name}"
    end

    def version_badge
      "https://img.shields.io/gem/v/#{name}.svg?style=flat"
    end

    def ci_badge
      "https://img.shields.io/travis/#{org}/#{name}/master.svg?style=flat"
    end

    def codeclimate_url
      "https://codeclimate.com/github/#{org}/#{name}"
    end

    def codeclimate_badge
      "https://codeclimate.com/github/#{org}/#{name}/badges/gpa.svg"
    end

    def coverage_badge
      "https://codeclimate.com/github/#{org}/#{name}/badges/coverage.svg"
    end

    def inch_url
      "http://inch-ci.org/github/#{org}/#{name}"
    end

    def inch_badge
      "http://inch-ci.org/github/#{org}/#{name}.svg?branch=master&style=flat"
    end

    def api_url
      "#{api_host_url}/#{name}"
    end

    def api_host_url
      Site.development? ? 'http://localhost:4000/docs' : "https://api.#{org}.org"
    end
  end
end
