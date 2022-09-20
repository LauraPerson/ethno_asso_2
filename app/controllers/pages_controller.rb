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
    @unarchived_team = User.all.where(archive: false)
    @team = @unarchived_team.all.where(admin: true)


    @ethnography_projects = @unarchived_articles.where(filter: "Ethnographie urbaine")
    @discrimination_projects = @unarchived_articles.where(filter: "Discriminations")
    @ecology_projects = @unarchived_articles.where(filter: "Écologie")

    
  end

  def about
  end

  def support
  end

  def contact
    @contact = Contact.new

  end
end
