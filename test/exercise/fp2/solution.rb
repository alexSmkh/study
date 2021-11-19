module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        iter = lambda do |arr|
          return if arr.empty?

          head, *tail = arr
          func.call(head)
          iter.call(tail)
        end

        iter.call(self)
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) do |acc, element|
          MyArray.new([*acc, yield(element)])
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |acc, element|
          element.nil? ? acc : MyArray.new([*acc, element])
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(init = nil, &func)
        acc = init.nil? ? self[0] : init
        collection = init.nil? ? MyArray.new(self[1..-1]) : self
        collection.my_each { |element| acc = func.call(acc, element) }
        acc
      end
    end
  end
end
