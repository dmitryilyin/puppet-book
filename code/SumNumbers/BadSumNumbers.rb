# BadSumNumbers
#
# Простой класс, демонстрирующий тестирование при помощи Rspec.
# Содержит ошибку в реализации вычитания для демонстрации
# провала теста.
#
class BadSumNumbers
  attr_accessor :sum
  def initialize(start_sum = 0)
    @sum = start_sum
  end
  def add(add_num = 0)
    @sum += add_num
  end
  def sub(sub_num = 0)
    @sum += sub_num
  end
  def positive?
    @sum > 0
  end
end
