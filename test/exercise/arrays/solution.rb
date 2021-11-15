module Exercise
  module Arrays
    class << self
      def find_max(array)
        max = array[0]
        array.each { |element| max = element if element > max }
        max
      end

      def replace(array)
        max_value = find_max(array)
        array.map { |el| el.positive? ? max_value : el }
      end

      def search(array, query)
        iter = lambda  do |left, right|
          return -1 if (right - left).negative?

          mid_index = (right + left) / 2
          mid_value = array[mid_index]
          return mid_index if query == mid_value

          if mid_value > query
            iter.call(left, mid_index - 1)
          else
            iter.call(mid_index + 1, right)
          end
        end

        iter.call(0, array.length - 1)
      end
    end
  end
end
