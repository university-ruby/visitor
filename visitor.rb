class Anime
  attr_accessor :title, :description
  
  def initialize(title, description)
    @title = title
    @description = description
  end
  
  def accept(visitor)
    visitor.visit_anime(self)
  end
end

class AnimeVisitor
  def visit_anime(anime)
    raise NotImplementedError, "#{self.class}#visit_anime not implemented."
  end
  
  def visit_tv_series(tv_series)
    raise NotImplementedError, "#{self.class}#visit_tv_series not implemented."
  end
  
  def visit_movie(movie)
    raise NotImplementedError, "#{self.class}#visit_movie not implemented."
  end
end

class TVSeries < Anime
  attr_accessor :episodes
  
  def initialize(title, description, episodes)
    super(title, description)
    @episodes = episodes
  end
  
  def accept(visitor)
    visitor.visit_tv_series(self)
  end
end

class Movie < Anime
  attr_accessor :duration
  
  def initialize(title, description, duration)
    super(title, description)
    @duration = duration
  end
  
  def accept(visitor)
    visitor.visit_movie(self)
  end
end

class AnimeRecommendationVisitor < AnimeVisitor
  def visit_anime(anime)
    puts "Recommendation for #{anime.title}: watch it!"
  end
  
  def visit_tv_series(tv_series)
    puts "Recommendation for #{tv_series.title}: watch it! It has #{tv_series.episodes} episodes."
  end
  
  def visit_movie(movie)
    puts "Recommendation for #{movie.title}: watch it! It is #{movie.duration} minutes long."
  end
end

one_piece = TVSeries.new("One Piece", "A story about pirates", 1000)
akira = Movie.new("Akira", "A cyberpunk classic", 124)
naruto = TVSeries.new("Naruto", "A story about ninjas", 500)

visitor = AnimeRecommendationVisitor.new

one_piece.accept(visitor)
akira.accept(visitor)
naruto.accept(visitor)
