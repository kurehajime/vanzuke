require "time"

class RanksController < ApplicationController
    include Github

    def index
        @contributors = []
        @title = params[:title]
        if params[:repo] 
            user = params[:repo].split("/")[0]
            repo = params[:repo].split("/")[1]
            day = Time.now

            if params[:years] || params[:month] || params[:days] 
                day = day.ago(params[:years].to_i.years)  if params[:years]
                day = day.ago(params[:month].to_i.month)  if params[:month]
                day = day.ago(params[:days].to_i.days)  if params[:days]
                p day
                @contributors =  get_stats_contributors_ago(user,repo,day.to_i)
            else
                @contributors =  get_stats_contributors_ago(user,repo,0)
            end
        end
    end
end
