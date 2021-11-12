module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = array.max
        array.map { |el| el.positive? ? max_value : el }
      end

      def search(_array, _query)
        no_found_value = -1
        left_index = 0
        right_index = _array.length - 1

        while right_index >= left_index
          middle_index = (right_index + left_index) / 2
          middle_value = _array[middle_index]
          return middle_index if middle_value == _query

          if middle_value > _query
            right_index = middle_index - 1
          else
            left_index = middle_index + 1
          end
        end

        no_found_value
      end
    end
  end
end
