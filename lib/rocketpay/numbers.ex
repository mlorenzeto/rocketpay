defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    # ao utilizar o pipe operator (|>) é entendido que o valor/resultado da operação anterior será passado como primeiro argumento da função atual
    # dessa forma, se torna desnecessário ficar reatribuindo os valores toda vez
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, result}) do
    result =
    result
    |> String.split(",")
    |> Stream.map(fn number -> String.to_integer(number) end)
    |> Enum.sum()

    {:ok, %{result: result}}
  end
  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid file!"}}
end
