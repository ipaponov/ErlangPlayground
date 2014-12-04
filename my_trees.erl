-module(my_trees).
-compile(export_all).

%% Problem
%% 4.01 (*) Check whether a given term represents a binary tree

is_tree(nil) -> false;
is_tree({node, _, nil, nil}) -> true;

is_tree({node, _, Leaf, nil}) -> is_tree(Leaf);
is_tree({node, _, nil, Leaf}) -> is_tree(Leaf);

is_tree({node, _, LeafA, LeafB}) ->
    is_tree(LeafA),
    is_tree(LeafB).

%% Problem
%% 4.02 (**) Construct completely balanced binary trees

create_balanced_tree(N) ->
    create_balanced_tree_acc(N, nil).

create_balanced_tree_acc(0, Tree) ->
    Tree;

create_balanced_tree_acc(N, nil) ->
    create_balanced_tree_acc(N-1, create_node());

create_balanced_tree_acc(N, {node, V, LeafA, LeafB}) ->
    NewLeafA = create_balanced_tree_acc(N, LeafA),
    NewLeafB = create_balanced_tree_acc(N, LeafB),
    {node, V, NewLeafA, NewLeafB}.

create_node() ->
    { node, 'N', nil, nil }.
