module ApplicationHelper

  def avatar(user)
    if user.photo.attached?
      cl_image_tag user.photo.key
    else
      image_tag "profil.png"
    end
  end
end
