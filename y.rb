require 'directors_database'
require 'yaml'

def movies_by_studio
end

def movies_with_director_key(name, movies_collection)
  result = []
  i = 0

  while i < movies_collection.length do
    movie_data = movies_collection[i]
    new_movie = { 
       :title => movie_data[:title],
       :worldwide_gross => movie_data[:worldwide_gross],
       :release_year => movie_data[:release_year],
       :studio => movie_data[:studio],
       :director => name
     }
    result << new_movie
    i += 1
  end

  result
end

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def group_by_studio_key(collection)
  result = {}
  i = 0

  while i < collection.length do
    movie = collection[i]

    if !result[movie[:studio]]
      result[movie[:studio]] = [ movie ]
    else
      result[movie[:studio]] << movie
    end
    i += 1
  end

  result
end

def movies
  i = 0
  a_o_a_movies_by_dir = []

  while i < directors_database.length do
    dir_row = directors_database[i]
    a_o_a_movies_by_dir << movies_with_director_key(dir_row[:name], dir_row[:movies])
    i += 1
  end
  flatten_a_o_a(a_o_a_movies_by_dir)
end

def gross_per_studio(collection)
  result = {}
  i = 0

  while i < collection.length do
    movie = collection[i]

    if !result[movie[:studio]]
      result[movie[:studio]] = movie[:worldwide_gross]
    else
      result[movie[:studio]] += movie[:worldwide_gross]
    end
    i += 1
  end

  result
end

def movies_grouped_by_studio
  group_by_studio_key(movies)
end

pp movies_grouped_by_studio
pp gross_per_studio(movies)
