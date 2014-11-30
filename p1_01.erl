-module(p1_01).
-export([last_in_list/1]).

%% Problem
%% 1.01 (*) Find the last element of a list.

last_in_list([Head|[]]) ->
    Head;

last_in_list([_|List]) ->
    last_in_list(List).
