class TranscodeJob < ApplicationJob
  require 'streamio-ffmpeg'

  def perform(*args)
    file_path = args[0]
    post_id = args[1]
    post = Post.find(post_id)
    files = post.media_files
    movie = FFMPEG::Movie.new(file_path)
    if movie.valid?
      video_resolutions = ["500x500"]
      @file_name = "#{Rails.root}/tmp/#{DateTime.now.to_i}_#{post.id}.mp4"
      video_resolutions.each do |resolution|
        options = {resolution: resolution, video_codec: "libx264"}
        transcoded_movie = movie.transcode(@file_name, options) { |progress| puts progress } 
        files.attach(io: File.open(@file_name), filename: "post_#{post.id}_#{resolution}.mp4")
      end
      File.delete(@file_name) if File.exist?(@file_name)
    else
      p "invalid video"
    end
  end
end
