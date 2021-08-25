defmodule RawTerm do
  @moduledoc """
  https://en.wikipedia.org/wiki/Terminal_mode
  """

  @on_load :load_nif

  # escript support
  @priv_dir Application.get_env(:raw_term, :priv_dir, :code.priv_dir(:raw_term))

  @doc false
  def load_nif do
    @priv_dir
    |> Path.join("raw_term")
    |> to_charlist()
    |> :erlang.load_nif(0)
  end

  @doc """
  Enable raw mode
  """
  @spec enable() :: :ok | {:error, :tcgetattr | :tcsetattr}
  def enable do
    raise "NIF enable/0 not implemented"
  end

  @doc """
  Disable raw mode
  """
  @spec enable() :: :ok | {:error, :tcsetattr}
  def disable do
    raise "NIF disable/0 not implemented"
  end
end
