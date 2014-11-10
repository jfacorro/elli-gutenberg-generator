PROJECT = {{NAME}}

DEPS = elli sync
dep_elli = git git@github.com:knutin/elli.git
dep_sync = git https://github.com/rustyio/sync.git master

include erlang.mk

SHELL_OPTS=-s {{NAME}} -s sync
