class StatsController < ApplicationController
before_action :authorize_request

def index
        @stats = Ahoy::Visit.all
        render json: @stats, only: [:user_agent, :ip, :landing_page, :browser, :os, :device_type]
    end
end
