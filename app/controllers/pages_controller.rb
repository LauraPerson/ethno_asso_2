class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :support, :contact, :about]

  def home
    @articles_with_photo = []
    Article.all.each do |article|
      if article.photos.attached?
        @articles_with_photo << article
      end
    end
    @last_articles_with_photos = @articles_with_photo.sort_by{|e| e[:created_at]}.last(3)
    
    @team = User.all.where(admin: true)
  end

  def about
  end

  def support
  end

  def contact
  end
end
