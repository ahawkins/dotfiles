module Timetrap
  module AutoSheets
    class Environment
      def sheet
        ENV.fetch('TIMETRAP_SHEET', 'default')
      end
    end
  end
end
