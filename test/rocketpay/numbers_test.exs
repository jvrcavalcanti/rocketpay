defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers

  describe "sum_file/1" do
    test "when there is a file with the given name, returns the sum of numbers" do
      assert Numbers.sum_file("numbers.csv") == {:ok, 37}
    end

    test "when there is no file with the given name, returns an error" do
      assert Numbers.sum_file("numbers") == {:error, "Invalid file!"}
    end
  end
end
