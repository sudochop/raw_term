ERLANG_INCLUDE_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)

CFLAGS += -I$(ERLANG_INCLUDE_PATH) -fPIC
LDFLAGS += -shared

ifeq ($(shell uname),Darwin)
	LDFLAGS += -dynamiclib -undefined dynamic_lookup
endif

all: priv/raw_term.so
	@:

priv/raw_term.so: c_src/raw_term.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ c_src/raw_term.c

clean:
	rm -rf priv/raw_term.so

.PHONY: all clean