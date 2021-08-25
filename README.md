# RawTerm

[![Hex.pm](https://img.shields.io/hexpm/v/raw_term.svg)](https://hex.pm/packages/raw_term)
[![Hexdocs.pm](https://img.shields.io/badge/api-hexdocs-brightgreen.svg)](https://hexdocs.pm/raw_term)

NIF for toggling a terminal's [raw mode](https://en.wikipedia.org/wiki/Terminal_mode)

## Installation

```elixir
def deps do
  [
    {:raw_term, "~> 0.1.0"}
  ]
end
```

## Escript

Escripts don't support a `priv` directory. Instead, consider adding something like the following to your config:

```elixir
config :raw_term, priv_dir: "_build/#{Mix.env()}/lib/raw_term/priv"
```

## Example

```elixir
:ok = RawTerm.enable()
IO.write(IO.ANSI.clear())
IO.write(IO.ANSI.cursor(0, 0))
# ...
:ok = RawTerm.disable()
```