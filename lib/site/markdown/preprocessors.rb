# frozen_string_literal: true

module Site
  module Markdown
    module Preprocessors
      def preprocess(document)
        renderer = self.class.new(@local_options)
        parser = Redcarpet::Markdown.new(renderer, @local_options)

        rendered_doc = table_of_contents(document, parser)
        rendered_doc = information(rendered_doc, parser)
        rendered_doc = warning(rendered_doc, parser)

        rendered_doc
      end

      # Preprocessor to add quick links at the top of a docs page.
      #
      # @example
      #   $TOC
      #     1. [Introduction](#introduction)
      #     2. [Getting Started](#getting-started)
      #   $TOC
      def table_of_contents(document, markdown)
        document.gsub(/^(?:^)\$TOC(.*?)\$TOC *(\r|\n|$)?+/msu) do
          <<~HTML
            <div class="toc">
              <h2 id="toc">Contents</h2>
              #{markdown.render(Regexp.last_match(1))}
            </div>
          HTML
        end
      end

      # Preprocessor to wrap the contents of '^' marks in a nice notice box
      #
      # @example
      #   ^
      #    Multi-line notice message which will display in
      #    in a nice blue notice box.
      #   ^
      def information(document, markdown)
        document.gsub(/^(?:^)\^(.*?)\^ *(\r|\n|$)?+/msu) do
          <<~HTML
            <div role="note" aria-label="Information" class="application-notice info-notice">
              <div class="notice-title">
                <i class="fa fa-info-circle"></i> Note
              </div>
              #{markdown.render(Regexp.last_match(1))}
            </div>
          HTML
        end
      end

      # Preprocessor to wrap the contents of '%' marks in a warning html notice
      #
      # @example
      #   %
      #    Multi-line notice message which will display in
      #    in a red warning box.
      #   %
      def warning(document, markdown)
        document.gsub(/^(?:^)\%(.*?)\% *(\r|\n|$)?+/msu) do
          <<~HTML
            <div role="note" aria-label="Information" class="application-notice warning-notice">
              <div class="notice-title">
                <i class="fa fa-exclamation-circle"></i> Warning
              </div>
              #{markdown.render(Regexp.last_match(1))}
            </div>
          HTML
        end
      end
    end
  end
end
