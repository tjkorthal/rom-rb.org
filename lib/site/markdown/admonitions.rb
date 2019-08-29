module Site
  module Markdown
    module Admonitions
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
