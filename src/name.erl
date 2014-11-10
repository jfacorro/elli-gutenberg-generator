-module({{NAME}}).

-export([
	 start/0,
	 start/2,
	 stop/1
	]).

start() ->
  application:ensure_all_started({{NAME}}).

%% @private
start(_StartType, _StartArgs) ->
  {{NAME}}_sup:start_link().

%% @private
stop(_State) ->
  ok.
