namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    def randomDate(params={})
        years_back = params[:year_range] || 5
        latest_year  = params [:year_latest] || 0
        year = (rand * (years_back)).ceil + (Time.now.year - latest_year - years_back)
        month = (rand * 12).ceil
        day = (rand * 31).ceil
        series = [date = Time.local(year, month, day)]
        if params[:series]
          params[:series].each do |some_time_after|
            series << series.last + (rand * some_time_after).ceil
          end
          return series
        end
        date
      end

    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 birthday: randomDate(:year_range => 60, :year_latest => 22),
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin:true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   birthday: randomDate(:year_range => 60, :year_latest => 22),
                   password: password,
                   password_confirmation: password)
    end


  end
end

