defmodule Rocketpay.Numbers do
  def sum_file(filename) do
    filename
    |> File.read
    |> handle_file
  end

  defp handle_file({:ok, file_content}) do
    sum = file_content
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum
    {:ok, sum}
  end

  defp handle_file({:error, _file_content}), do: {:error, "Invalid file!"}
end
