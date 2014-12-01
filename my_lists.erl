-module(my_lists).
-export([
    last_in_list/1,
    last_but_one/1,
    find_k_th/2,
    list_length/1,
    reverse_list_tail/1,
    reverse_list/1,
    palindrome/1
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

%% Problem
%% 1.04 (*) Find the number of elements of a list.

list_length([_|List]) ->
    list_length(List, 1).

list_length([_|[]], Length) ->
    Length+1;

list_length([_|List],Length) ->
    list_length(List, Length+1).

%% Problem
%% 1.05 (*) Reverse a list.

reverse_list_tail(List) ->
    reverse_list(List, []).
reverse_list([], ReverseList) ->
    ReverseList;
reverse_list([H|T], ReverseList) ->
    reverse_list(T, [H|ReverseList]).

%% variant #2

reverse_list([]) ->
    [];
reverse_list([H|T]) ->
    reverse_list(T)++[H].

%% Problem
%% 1.06 (*) Find out whether a list is a palindrome.

palindrome(List) ->
    ReverseList = reverse_list(List),
    compare_lists(List, ReverseList).

compare_lists([], []) ->
    true;

compare_lists([H1|List], [H2|ReverseList]) ->
    case H1 of
        H2 -> compare_lists(List, ReverseList);
        _  -> false
    end.
