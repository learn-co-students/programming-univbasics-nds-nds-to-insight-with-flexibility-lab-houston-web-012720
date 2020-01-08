directorlist = [
 {:name=>"Stephen Spielberg",
  :movies=>
   [{:title=>"Jaws",
     :studio=>"Universal",
     :worldwide_gross=>260000000,
     :release_year=>1975},
    {:title=>"Close Encounters of the Third Kind",
     :studio=>"Columbia",
     :worldwide_gross=>135189114,
     :release_year=>1977}]},
 {:name=>"Russo Brothers",
  :movies=>
   [{:title=>"Avengers Endgame",
     :studio=>"Buena Vista",
     :worldwide_gross=>858371337,
     :release_year=>2019},
    {:title=>"Avengers Infinity War",
     :studio=>"Buena Vista",
     :worldwide_gross=>678815482,
     :release_year=>2018}]},
 {:name=>"James Cameron",
  :movies=>
   [{:title=>"Avatar",
     :studio=>"Fox",
     :worldwide_gross=>760507625,
     :release_year=>2009},
    {:title=>"Titanic",
     :studio=>"Paramount",
     :worldwide_gross=>659363944,
     :release_year=>1997}]},
  {:name=>"Greff Jegg",
   :movies=>
   [{:title=>"Elem Grad",
     :studio=>"LES",
     :worldwide_gross=>100,
     :release_year=>2000},
    {:title=>"HS Grad",
     :studio=>"LHS",
     :worldwide_gross=>20000,
     :release_year=>2006},
    {:title=>"Uni Grad",
     :studio =>"Baylor",
     :worldwide_gross=>120000,
     :release_year=>2010}]}]

def flatten_a_o_a(aoa)
  result = []
  i = 0
  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k +=1
    end
    i += 1
  end
  result
end

def movie_with_director_name(director_name, movie_data)
  {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end

# no workie
# def movies_with_director_key(name, movies_collection)
#   mwd_aoh = []
#   index = 0
#   while index < movies_collection.length do
#     mindex = 0
#     while mindex < movies_collection[index][:movies].length do
#       mwd_aoh << movie_with_director_name(movies_collection[index][:name], movies_collection[index][:movies][mindex])
#       mindex += 1
#     end
#     index += 1
#   end
#   mwd_aoh
# end

def movies_with_director_key(name, movies_collection)
  mwd_aoh = []
  index = 0
  while index < movies_collection.length do
    mindex = 0
    while mindex < movies_collection[index][:movies].length do
      movie_name = movies_collection[index][:movies][mindex]
      mwd_aoh << movie_with_director_name(name, movie_name)
      mindex += 1
    end
    index += 1
  end
  mwd_aoh
end
# movies_with_director_key("Stephen Spielberg", directorlist)

def gross_per_studio(collection)
  gross_by_studio = {}
  n = 0
  while n < collection.length do
    studio_name = collection[n][:studio]
    movie_gross = collection[n][:worldwide_gross]
    if !gross_by_studio[studio_name]
      gross_by_studio[studio_name] = movie_gross
    else
      gross_by_studio[studio_name] += movie_gross
    end
    n += 1
  end
  gross_by_studio
end

def movies_with_directors_set(source)
  aoaoh = []
  index = 0
  while index < source.length do
    name_of_director = source[index][:name]
    aoaoh << movies_with_director_key(name_of_director, source)
    index += 1
  end
  aoaoh
end

# movies_with_directors_set(directorlist)

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  pp gross_per_studio(movies_with_director_names)
end

studios_totals(directorlist)
