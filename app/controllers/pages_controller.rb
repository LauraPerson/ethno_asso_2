class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @articles_with_photo = []
    Article.all.each do |article|
      if article.photo.attached?
        @articles_with_photo << article
      end
    end
    @last_articles_with_photos = @articles_with_photo.last(3)
    
    @team = User.all.where(admin: true)
  end
end
