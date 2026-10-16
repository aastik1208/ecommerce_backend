module ReactionHelper
  def is_reacted_by_current_user(item, user)
    return false if user.nil?
    if item.reactions.collect(&:account_id).include? user.id
      return true
    else
      return false
    end
  end

  def image_type(file_path)
    extension = file_path.split('.').last.downcase
    if VIDEO_EXTENSION.include?(extension)
      "video"
    elsif IMAGE_EXTENSION.include?(extension)
      "image"
    else
      ""
    end
  end
end
