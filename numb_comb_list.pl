/*Задание 1
Реализовать предикат max(+X,+Y,+U,-Z), где U максимальное из чисел X, Y и Z.*/
max(X,Y,Z,X) :- X>Y, X>Z, !.
max(X,Y,Z,Y) :- Y>X, Y>Z, !.
max(_,_,Z,Z).

/*Реализовать предикат fact(N,X), где X – это факториал первого аргумента с помощью рекурсии вверх.*/
fact(0,1).
fact(N,X):- N>0,
    N1 is N-1,
    fact(N1,X1),
    X is X1*N.

/*Реализовать предикат fact(N,X), где X – это факториал первого аргумента с помощью рекурсии вниз.*/
fact_dn(0,X,X).
fact_dn(N,A,X) :- 
    N>0,
    N1 is N-1,
    A1 is A*N,
    fact_dn(N1,A1,X1),
    X is X1*N.
cl_fact_dn(N,X) :- fact_dn(N,1,X).

/*Найти сумму цифр числа с помощью рекурсии вверх.*/
sum_num(0,0) :- !.
sum_num(X,Y) :-
    X1 is X div 10,
    sum_num(X1,Y1),
    Y is Y1 + X mod 10.

/*Найти сумму цифр числа с помощью рекурсии вниз.*/
sum_num_up()