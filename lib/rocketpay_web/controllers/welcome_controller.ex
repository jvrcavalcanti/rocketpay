defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  alias Rocketpay.Numbers

  def index(conn, %{"filename" => filename}) do
    "#{filename}.csv"
    |> Numbers.sum_file
    |> handle_response(conn)
  end

  defp handle_response({:ok, result}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{
      message: "Welcome to Rocketpay API. Here is your number #{result}"
    })
  end

  defp handle_response({:error, result}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(%{
      message: result
    })
  end
end
