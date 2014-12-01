-module(my_lists).
-export([
    last_in_list/1,
    last_but_one/1,
    find_k_th/2
]).

%% Problem
%% 1.01 (*) Find the last element of a list.

last_in_list([Head|[]]) ->
    Head;

last_in_list([_|List]) ->
    last_in_list(List).

%% Problem
%% 1.02 (*) Find the last but one element of a list.

last_but_one([H1|[_|[]]]) ->
    H1;

last_but_one([_|Tail]) ->
    last_but_one(Tail).

%% Problem
%% 1.03 (*) Find the K'th element of a list.

find_k_th([H|T], K) ->
    case K of
        1 -> H;
        _ -> find_k_th(T, K-1)
    end.
