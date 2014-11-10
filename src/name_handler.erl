-module({{NAME}}_handler).

-export([
	 handle/2,
	 handle_event/3]
       ).

-include_lib("elli/include/elli.hrl").
-behaviour(elli_handler).

handle(Req, _Args) ->
  %% Delegate to our handler function
  handle(Req#req.method, elli_request:raw_path(Req), Req).

handle('GET', <<"/">>, _Req) ->
  {200, [{<<"content-type">>, <<"text/html">>}], <<"Hi there!">>};

handle('GET', _Uri, _Req) ->
  {404, [], <<"Not Found">>};

handle(_, _, _Req) ->
  {405, [], <<"Method Not Allowed">>}.

handle_event(_Event, _Data, _Args) ->
  ok.
