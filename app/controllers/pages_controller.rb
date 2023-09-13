class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :support, :contact, :about]

  def home
    @articles_with_photo = []
    @unarchived_articles = Article.order(created_at: :desc).where(archive: false)

    Article.all.each do |article|
      if article.photos.attached?
        @articles_with_photo << article
      end
    end
    @last_articles_with_photos = @articles_with_photo.sort_by{|e| e[:created_at]}.last(3)
   
    @unarchived_team = User.where(archive: false)
    @team = @unarchived_team.where(employee: true)
    @board = @unarchived_team.where(employee: false)

    @presentation1 = Presentation.first
    @presentation2 = Presentation.second

  end

  def about
  end

  def support
  end

  def contact
    @contact = Contact.new
    @presentation_email = Presentation.all[2]
    @presentation_number = Presentation.all[3]

  end
end
