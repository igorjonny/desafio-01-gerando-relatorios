defmodule GenReport.Parser do
  # path reports e read line for line
  def parse_file(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(&parse_line/1)
  end

  # Daniele,7,29,4,2018

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(0, &String.downcase/1)
    |> List.update_at(1, &String.to_integer/1)
    |> List.update_at(2, &String.to_integer/1)
    |> List.update_at(3, fn month -> rename_month(month) end)
    |> List.update_at(4, &String.to_integer/1)
  end

  # ["daniele", 7, 29, "abril", "2018"]

  # the month is as a numbers and renamed to letters
  defp rename_month(month_number) do
    case month_number do
      "1" -> "janeiro"
      "2" -> "fevereiro"
      "3" -> "março"
      "4" -> "abril"
      "5" -> "maio"
      "6" -> "junho"
      "7" -> "julho"
      "8" -> "agosto"
      "9" -> "setembro"
      "10" -> "outubro"
      "11" -> "novembro"
      "12" -> "dezembro"
    end
  end
end
