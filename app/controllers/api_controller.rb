class ApiController < ApplicationController
  
  GOOGLE_API_KEY = "AIzaSyAW-MFxkJIJonEuF5E9ZP77c2y8hIeDlqg"

  def videos
    query = params.slice(:part, :regionCode, :id, :hl, :pageToken, :chart, :maxResults, :videoCategoryId)
    query[:key] = GOOGLE_API_KEY
    res = HTTParty.get("https://www.googleapis.com/youtube/v3/videos", query: query)

    render json: res.body
  end

  def video_categories
    query = params.slice(:part, :regionCode, :id, :hl, :pageToken)
    query[:key] = GOOGLE_API_KEY
    res = HTTParty.get("https://www.googleapis.com/youtube/v3/videoCategories", query: query)

    render json: res.body
  end
end
