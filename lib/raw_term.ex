defmodule RawTerm do
  @moduledoc """
  https://en.wikipedia.org/wiki/Terminal_mode
  """

  @on_load :load_nif

  def load_nif do
    case :code.priv_dir(:raw_term) do
      {:error, _} = err ->
        err

      path ->
        path
        |> Path.join("raw_term")
        |> to_charlist()
        |> :erlang.load_nif(0)
    end
  end

  def enable do
    raise "NIF enable/0 not implemented"
  end

  def disable do
    raise "NIF disable/0 not implemented"
  end
end
