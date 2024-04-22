class DelayController < ApplicationController
  def delay
    ms = params[:ms].to_i
    logger.info("Receive sleep time #{ms} milliseconds")
    sleep(ms/1000)
    render json: {message: "Response with delay of #{ms} milliseconds"}
  end
end