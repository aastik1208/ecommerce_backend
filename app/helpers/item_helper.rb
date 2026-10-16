module ItemHelper
  include Rails.application.routes.url_helpers

  def files
    media_files = []
    new_obj = object.content
    post_type = object.content.post_type
    if object.content.parent_id.present?
      new_obj = Post.find(object.content.parent_id)
    end
    new_obj.media_files.each do |file|
      if post_type == 'image'
        media_files << {file_path: thumbnail_size_(file), file_type: image_type(file.blob.filename.to_s), type: 'thumbnail_size'}
        media_files << {file_path: small_size_(file), file_type: image_type(file.blob.filename.to_s), type: 'small_size'}
        media_files << {file_path: file.service_url, file_type: image_type(file.blob.filename.to_s), type: 'base_size'}
      else
        video_path = Rails.application.routes.url_helpers.rails_blob_url(file, only_path: true)
        media_files << { file_path: file.service_url, file_type: 'video'}
      end
    end
    media_files
  end

  def thumbnail_size_(file)
    file_type = image_type(file.blob.filename.to_s)
    file_path = ''
    if (file_type == "image")
      file_path =  file.variant(resize: '250x250').processed.service_url rescue nil
     else
      file_path =  file.service_url
    end
    return file_path
  end

  def small_size_(file)
    file_type = image_type(file.blob.filename.to_s)
    file_path = ''
    if (file_type == "image")
     file_path =  file.variant(resize: '500x500').processed.service_url rescue nil
     else
      file_path =  file.service_url
    end
    return file_path
  end

  def files_(gallery)
    media_files = []
    gallery.each do |item|
      if item.value.present?
        if item['attribute_id'] == ATTRIBUTE_IDS['thumbnail_image']
          media_files << {file_path: IMAGE_BASE_URL+item.value, file_type: image_type(item.value), type: 'thumbnail_size'}
        elsif item['attribute_id'] == ATTRIBUTE_IDS['base_image']
          media_files << {file_path: IMAGE_BASE_URL+item.value, file_type: image_type(item.value), type: 'base_size'}
        elsif item['attribute_id'] == ATTRIBUTE_IDS['small_image']
          media_files << {file_path: IMAGE_BASE_URL+item.value, file_type: image_type(item.value), type: 'small_size'}
        end
      end
    end
    media_files
  end

  def img_url(acc_)
      acc_.profile_img.attached? ? acc_.profile_img.service_url : nil
  end
end
