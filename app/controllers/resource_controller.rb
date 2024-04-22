class ResourceController < ApplicationController
  def resource
    data_file = params[:data]

    begin
      file_content = JSON.parse(File.read("#{Rails.root}/config/resource/#{data_file}"))
      logger.info("Receive data from file #{data_file}")
      render json: file_content
    rescue
      logger.info("File #{data_file} is not found, return empty response")
      render json: "[]"
    end
  end
end