%Задание 1
%Реализовать предикат max(+X,+Y,+U,-Z), где U максимальное из чисел X,Y,Z
max(X,Y,Z,X) :- X>Y, X<Z, !.
max(X,Y,Z,Y) :- Y>X, Y>Z, !.
max(_,_,Z,Z).

%Реализовать предикат fact(N,X), где X - факториал первого аргумента с помощью рекурсии ВВЕРХ
fact(0,1).
fact(N,X) :-
    N > 0,
    N_1 is N-1,
    fact(N_1,X_1),
    X is X_1*N.

%Реализовать предикат fact(N,X), где X - факториал первого аргумента с помощью рекурсии ВНИЗ
fact_2(0,X,X).
fact_2(N,A,X) :-
    N > 0,
    N_1 is N-1,
    A_1 is A*N,
    fact_2(N_1, A_1, X_1),
    X is X_1,
return_fact_2(N,X) :- fact_2(N,1,X).

%Найти сумму цифр числа с помощью рекурсии ВВЕРХ
sum_num(0,0) :- !.
sum_num(X,Y) :-
    X_1 is X div 10,
    sum_num(X_1, Y_1),
    Y is Y_1 + X mod 10.

%Найти сумму цифр числа с помощью рекурсии ВНИЗ
sum_num_dw(X,Y) :- sum_num_dw(X,Y,0).
sum_num_dw(0,X,X) :- !.
sum_num_dw(X,Y,Z) :-
    Z_1 is Z + X mod 10,
    X_1 is X div 10,
    sum_num_dw(X_1, Y, Z_1).

%Проверить, является ли число свободным от квадратов
return_sq_free(Numb) :- sq_free(Numb, 2).

sq_free(Numb, Numb) :- !.

sq_free(Numb, Sq) :-
    Sq is Sq*Sq,
    Mod is Numb mod Sq,
    Mod \= 0,
    Sq_temp is Sq+1,
    sq_free(Numb, Sq_temp).

%Реализовать предикат чтения списка с клавиатуры и предикат вывода списка на экран.
%Предикат для чтения вводимого с клавиатуры
read_list(0, []) :- !.
read_list(X, [H|T]) :- 
    read(H), 
    New_X is X - 1,
    read_list(New_X, T).
%Предикат для вывода списка
write_list([]) :- !.
write_list([H|T]) :- 
    write(H), nl, 
    write_list(T).

%Реализовать предикат sum_list_down(+List, ?Summ), который проверяет, является ли
%Summ суммой элементов списка или записывает в эту переменную сумму элементов
sum_list_dw(List, Sum) :- sum_list_dw(List, 0, Sum).
sum_list_dw([], Cur_Sum, Cur_Sum):-!.
sum_list_dw([H|T], Cur_Sum, Sum) :- 
    New_Sum is Cur_Sum + H,
    sum_list_dw(T, New_Sum, Sum).

%Предикат для считывания с клавиатуры, считает сумму элементов и выводит
read_sum_write(Count):- 
    read_list(Count, List),
    sum_list_dw(List, Sum),
    write(Sum).

%Построить предикат sum_list_up(+List, ?Summ), который проверяет, является ли Summ
%суммой элементов списка или записывает в эту переменную сумму элементов.
sum_list_up([], 0):-!.
sum_list_up([H|T], Sum) :- 
    sum_list_up(T, Sum_T), 
    Sum is Sum_T + H.

%Построить предикат, который удаляет все элементы, сумма цифр которых равна данной.
sum_numb_del([], [], Numb). 
sum_numb_del([H|T], X, Numb):- 
    numb_sum_dw(H, Sum),
    Sum == Numb,
    sum_numb_del(T, X, Numb). 
sum_numb_del([H|X], [H|Y], Numb) :- sum_numb_del(X, Y, Numb).


%Задание 2, вариант 4
%Найти произведение цифр числа.
mult_numb(Numb, Res) :- mult_numb(Numb, 10, Res).

mult_numb(0, Res, Res) :- !.

mult_numb(Numb, Mult, Res) :- 
    Dig is Numb mod 10,
    Dig * Mult,
    Numb_temp is Numb div 10,
    mult_numb(Numb_temp, Dig, Res).

mult_numb(Numb, Mult, Res) :-
    Numb_temp is Numb div 10,
    mult_numb(Numb_temp, Mult, Res).


%Найти максимальную цифру числа, не делящуюся на 3
max_numb(0, 0):- !.
max_three(Numb, Max_Dig):-
    Numb > 0,
    Numb_1 is Numb mod 10,
    (
        Numb_1 mod 3 =:= 0 -> Numb_2 is Numb // 10,
        max_numb_up(Numb_2, Max_Dig);
        Numb_2 is Numb // 10, 
        max_numb_up(Numb_2, New_Max_Dig), 
        Max_Dig is max(New_Max_Dig, Numb_1)
    ).

max_numb_down(Numb, Max_Dig):- max_numb_down_help(Numb, 0, Max_Dig).

max_numb_help(0, Dig, Dig):- !.

max_numb_help(Numb, Cur_Dig, Max_Dig):-
    Numb > 0,
    Numb_1 is Numb mod 10,
    (   Numb_1 mod 3 =:= 0 -> Numb_2 is Numb // 10, 
        max_numb_help(Numb_2, Cur_Dig, Max_Dig);
        New_Cur_Dig is max(Cur_Dig, Numb_1), 
        Numb_2 is Numb // 10, 
        max_numb_help(Numb_2, New_Cur_Dig, Max_Dig)
    ).

%Найти количество делителей числа
divis(X, Y) :- 0 is X mod Y.

count_divis(N, Count) :- count_divis(N, 1, 0, Count).

count_divis(N, N, Acc, Count) :- Count is Acc + 1.

count_divis(N, I, Acc, Count) :-
    I < N,
    0 is N mod I,
    New_Acc is Acc + 1,
    Next_I is I + 1,
    count_divis(N, Next_I, New_Acc, Count).

count_divis(N, I, Acc, Count) :-
    I < N,
    Next_I is I + 1,
    count_divis(N, Next_I, Acc, Count).