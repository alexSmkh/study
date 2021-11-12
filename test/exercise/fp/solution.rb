module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films = array.filter do |film|
          film['rating_kinopoisk'].to_f.positive? &&
            !film['country'].nil? &&
            film['country'].split(',').length >= 2
        end
        ratings = films.map { |film| film['rating_kinopoisk'].to_f }
        ratings.reduce(&:+) / ratings.count
      end

      def chars_count(films, threshold)
        films\
          .filter { |film| film['rating_kinopoisk'].to_f >= threshold }
          .reduce(0) { |acc, film| acc + film['name'].split('').count('и') }
      end
    end
  end
end
