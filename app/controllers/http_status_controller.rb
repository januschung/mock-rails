class HttpStatusController < ApplicationController
  def show
    code = params[:code].to_i
    logger.info "Receive http code #{code}"
    if valid_http_status_code?(code)
      render json: { status: Rack::Utils::HTTP_STATUS_CODES[code] }, status: code
    else
      logger.error "#{code} is not an valid http code!"
      render json: { error: 'Invalid HTTP status code' }, status: :unprocessable_entity
    end
  end

  private

  def valid_http_status_code?(code)
    code >= 100 && code <= 599
  end
end