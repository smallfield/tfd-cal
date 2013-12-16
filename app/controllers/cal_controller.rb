class CalController < ApplicationController
	def index
		@msg = "message"
	end

        def cal
                request.format = :cal
                headers['Content-Type'] = "text/calendar; charset=UTF-8"
                @id = params[:id]
                daybefore = 30
                dayahead = 300
                now = Time.now
                @date = Time.gm(now.year, now.month, now.day, 0, 0, 0).to_i - 60*60*24*daybefore
                @end  = Time.gm(now.year, now.month, now.day, 0, 0, 0).to_i + 60*60*24*dayahead
        end
end
