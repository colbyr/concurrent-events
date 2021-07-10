-module(event_serv).

-compile(export_all).

-record(state, {events, clients}).
-record(event, {name = "", description = "", pid, timeout = {{1970, 1, 1}, {0, 0, 0}}}).

loop(S = #state{}) ->
  receive
    Unknown ->
      io:format("Unknown message: ~p~n", [Unknown]),
      loop(S)
  end.

init() ->
  loop(#state{events=orddict:new(), clients=orddict:new()}).
