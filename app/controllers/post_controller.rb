class PostController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :post_json

  def post_json
    start_time = Time.now
    payload = JSON.parse(request.body.read)
    end_time = Time.now
    duration = (end_time - start_time).round(2)
    
    if display_payload?
      render json: { payload: payload, duration: "#{duration} seconds" }
    else
      render json: { duration: "#{duration} seconds" }
    end
    rescue JSON::ParserError => e
        render json: { error: "Invalid JSON format in payload" }, status: :unprocessable_entity
  end

  private

  def display_payload?
    params[:display_payload] == "true"
  end
end
