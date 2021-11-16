module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        head, *tail = self
        yield(head)
        arr = tail.empty? ? [head] : [head, *MyArray.new(tail).my_each(&func)]
        MyArray.new(arr)
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
        head, *tail = self
        return yield(init, head) if tail.empty?

        my_arr = MyArray.new(tail)

        init.nil? ? my_arr.my_reduce(head, &func) : my_arr.my_reduce(yield(init, head), &func)
      end
    end
  end
end
