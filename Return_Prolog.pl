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

