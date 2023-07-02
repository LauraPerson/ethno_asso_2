User.destroy_all
Article.destroy_all
Ressource.destroy_all

3.times do |n|
  user = User.create!(
    first_name: "firstname#{n}",
    last_name: "lastname#{n}",
    description: 'Lorem ipsum dolor sit amet',
    email: "test#{n}@ethnoasso.com",
    password: 'ethnoasso',
    admin: true
  )

  p "Create #{user.id} users"
end

10.times do |n|
  user= User.first
  article = Article.create!(
    title: "Article#{n}",
    content: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident repellat, ratione in sint exercitationem velit dignissimos quas architecto repellendus ab, minus nihil voluptatum excepturi rerum voluptates fuga neque eligendi sed? ",
    user_id: user.id, 
    filter: "Ethnographie urbaine", 
    position: n + 1
  )

  p "Create #{article.id} articles"
end

2.times do |n|
  presentation = Presentation.create!(
    name: "Presentation#{n}",
    content: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident repellat, ratione in sint exercitationem velit dignissimos quas architecto repellendus ab, minus nihil voluptatum excepturi rerum voluptates fuga neque eligendi sed? ",
  )

  p "Create #{presentation.id} présentations"
end

10.times do |n|
  user= User.first
  ressource = Ressource.create!(
    title: "Ressource#{n}",
    content: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Provident repellat, ratione in sint exercitationem velit dignissimos quas architecto repellendus ab, minus nihil voluptatum excepturi rerum voluptates fuga neque eligendi sed? ",
    user_id: user.id

  )

  p "Create #{ressource.id} ressources"
end