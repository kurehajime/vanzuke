class RanksController < ApplicationController
    include Github

    def index
        @contributors = []
        @title = params[:title]
        if params[:repo] 
            user = params[:repo].split("/")[0]
            repo = params[:repo].split("/")[1]
            @contributors =  get_stats_contributors_ago(user,repo,0)
        end
    end
end
