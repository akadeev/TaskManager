Configus.build Rails.env do

  env :production do
    pagination do
      tasks_per_page 2
    end
  end

  env :development, parent: :production

  env :test, parent: :production

end