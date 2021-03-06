-module({{NAME}}_sup).
-behaviour(supervisor).
-export([start_link/0, init/1]).

-define(CHILD(I, Type, Args), {I, {I, start_link, Args}, permanent, 5000, Type, [I]}).

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
  ElliOpts = [{callback, {{NAME}}_handler}, {port, 8080}],
  {ok, {{one_for_one, 5, 10},
	[
	 ?CHILD(elli, worker, [ElliOpts])
	]
       }
  }.
