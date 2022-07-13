module ApplicationHelper

  def avatar(user)
    if user.photo.attached?
      cl_image_tag user.photo.key
    else
      image_tag "profil.png"
    end
  end

  def photo(element)
    if element.photos.attached?
      cl_image_tag element.photos.first.key
    else
      image_tag "default.png"
    end
  end

  def short_content(element)
    element.content.present?
    content = element.content.to_plain_text[0, 300]
    return content + "..." + '[Lire plus]'
  end

end
