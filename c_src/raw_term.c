#include <erl_nif.h>
#include <termios.h>
#include <unistd.h>

struct termios orig_termios;

ERL_NIF_TERM
mk_atom(ErlNifEnv* env, const char* atom)
{
  ERL_NIF_TERM ret;

  if(!enif_make_existing_atom(env, atom, &ret, ERL_NIF_LATIN1))
  {
    return enif_make_atom(env, atom);
  }

  return ret;
}

ERL_NIF_TERM
mk_error(ErlNifEnv* env, const char* mesg)
{
  return enif_make_tuple2(env, mk_atom(env, "error"), mk_atom(env, mesg));
}

static ERL_NIF_TERM 
enable(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
  if (tcgetattr(STDIN_FILENO, &orig_termios) == -1)
  {
    return mk_error(env, "tcgetattr");
  }

  struct termios raw = orig_termios;
  
  raw.c_iflag &= ~(BRKINT | ICRNL | INPCK | ISTRIP | IXON);
  raw.c_oflag &= ~(OPOST);
  raw.c_cflag |= (CS8);
  raw.c_lflag &= ~(ECHO | ICANON | IEXTEN | ISIG);
  raw.c_cc[VMIN] = 0;
  raw.c_cc[VTIME] = 0;
  
  if (tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw) == -1)
  {
    return mk_error(env, "tcsetattr");
  }

  return mk_atom(env, "ok");
}

static ERL_NIF_TERM
disable(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
  if (tcsetattr(STDIN_FILENO, TCSAFLUSH, &orig_termios) == -1) {
    return mk_error(env, "tcsetattr");
  }

  return mk_atom(env, "ok");
}

static ErlNifFunc nif_funcs[] = {
  {"enable", 0, enable},
  {"disable", 0, disable}
};

ERL_NIF_INIT(Elixir.RawTerm, nif_funcs, NULL, NULL, NULL, NULL);