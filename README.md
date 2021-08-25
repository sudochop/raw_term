# RawTerm

NIF for toggling a terminal's [raw mode](https://en.wikipedia.org/wiki/Terminal_mode)
## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `raw_term` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:raw_term, "~> 0.1.0"}
  ]
end
```

## escript

Escripts don't support a `priv` directory. Instead, consider adding something like the following to your config:

```elixir
config :raw_term, priv_dir: "_build/#{Mix.env()}/lib/raw_term/priv"
```

# Example

```elixir
:ok = RawTerm.enable()
IO.write(IO.ANSI.clear())
IO.write(IO.ANSI.cursor(0, 0))
# ...
:ok = RawTerm.disable()
```