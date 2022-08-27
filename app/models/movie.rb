class Movie < ActiveRecord::Base
  def self.create_with_title(title) #this is a method that rides on the ability of the built in method of Active record.note use of self
    Movie.create(title:title) #calling the Active record methods on movie class so that the mapping is done on the movies table in the sqlite db
  end

  def self.first_movie  #We are addign our custome methods in order to improve on the functionality of the class but basing our method functionality on the inbuilt AR methods
    Movie.first
  end

  def self.last_movie
    Movie.last
  end

  def self.movie_count
    Movie.count
  end

  def self.find_movie_with_id(id)
    Movie.find(id)
  end

  def self.find_movie_with_attributes(attribute)
    Movie.find_by(attribute)  # or Movie.where(attribute).take
  end

  def self.find_movies_after_2002
    Movie.where("release_date > ?",2002)   #tricky googling- you can also use beginless and endless rannges ranges and 
  end


  def update_with_attributes(attributes)
    self.update(attributes)
  end

  def self.update_all_titles(attributes)
    Movie.update(:all,title:attributes) #There are just a million syntactical ways for writing this
  end


  def self.delete_by_id(id)  #ordinarily this could be done using delete by
    movie = Movie.find(id)
    movie.destroy
  end

  def self.delete_all_movies
    Movie.destroy_all
  end

end