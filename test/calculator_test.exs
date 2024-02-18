defmodule CalculatorTest do
  use ExUnit.Case, async: true
  alias Calculator
  doctest Calculator

  test ~c"calculates numbers" do
    Calculator.start_link()

    assert Calculator.call(:add, 2, 3) == 5
    assert Calculator.call(:add, 2) == 7
    assert Calculator.call(:subtract, 2) == 5
    assert Calculator.call(:subtract, 10, 3) == 7
    assert Calculator.call(:multiply, 10, 3) == 30
    assert Calculator.call(:multiply, 3) == 90
    assert Calculator.call(:divide, 3) == 30
    assert Calculator.call(:divide, 18, 3) == 6
    assert Calculator.call(:divide, 0) == :unproccessable
    assert Calculator.call(:divide, 10, 0) == :unproccessable
    assert Calculator.call(:divide, 2) == 3
    assert Calculator.call(:reset) == 0
    assert Calculator.call(:add, 7) == 7
  end
end
