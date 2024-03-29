man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).
woman(margo).
woman(vladlena).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

parent(ratibor, margo).
parent(zhdana, margo).
parent(ratibor, vladlena).
parent(zhdana, vladlena).

/*Задание 1
1) Построить предикаты men и women, которые выводят на экран всех мужчин и всех женщин соответственно.*/
men():- man(X), print(X), nl, fail.
women():- woman(X), print(X), nl, fail.

/*2) Построить предикат children(X), который выводит всех детей X.*/
children(X):- parent(X,Y), print(Y), nl, fail.

/*3) Построить предикат mother(X, Y), который проверяет, является ли X матерью Y.
    3.1) Построить предикат, mother(X), который выводит маму X.*/
mother(X,Y):- woman(X), parent(X,Y).
mother_1(X):- mother(Y,X), print(Y), nl, fail.

/*4) Построить предикат brother(X, Y), который проверяет, является ли X братом Y (доп проверка на то, что X не должен быть равен Y)
    4.1) Построить предикат brothers(X), который выводит всех братьев X.*/

brother(X, Y) :- parent(Z, X), parent(Z, Y), man(X), man(Z), X \= Y.
brothers(X) :- setof(Y, brother(Y, X), Brothers), print(Brothers).

/*5) Построить предикат b_s(X,Y), который проверяет, являются ли X и Y родными братом и сестрой или братьями или сестрами. 
    5.1) Построить предикат b_s(X), который выводит всех братьев или сестер X.*/

b_s(X,Y) :- parent(Z,X), parent(Z,Y), X \= Y.
b_s_1(X) :- setof(Y, b_s(X,Y), Siblings), print(Siblings), nl, fail.


/*Задание 2, вариант 4
1) Построить предикат father(X, Y), который проверяет, является ли X отцом Y.
    1.1) Построить предикат, father(X), который выводит отца X.*/
father(X,Y) :- man(X), parent(X,Y).
father_1(X) :- father(Y,X), print(Y), nl, fail.

/*2) Построить предикат wife(X, Y), который проверяет, является ли X женой Y.
    2.1) Построить предикат wife(X), который выводит жену X.*/
wife(X,Y) :- woman(X), parent(X,Z), parent(Y,Z), X \= Y.
wife_1(X) :- setof(Y, wife(Y,X), Wife), print(Wife), nl, fail.


sister(X,Y) :- parent(Z,Y), parent(Z,X), woman(X), woman(Z), X\=Y.

/*Задание 3, вариант 4
1) Построить предикат grand_da(X, Y), который проверяет, является ли X внучкой Y (без использования готовых предикатов).
    1.1) Построить предикат grand_dats(X), который выводит всех внучек X (без использования готовых предикатов).*/
grand_da(X,Y) :- parent(Y,Z), parent(Z,X), woman(X).
grand_dats_1(X) :- parent(X,Z), parent(Z,Q), woman(Q), print(Q) , nl, fail.

/*1.2) Построить предикат grand_dats(X), который выводит всех внучек X (с использованием готовых предикатов).*/
grand_dats_2(X) :- setof(Y, grand_da(Y,X), Grandau), print(Grandau), nl, fail.

/*2) Построить предикат grand_pa_and_da(X,Y), который проверяет, являются ли X и Y дедушкой и внучкой или внучкой и дедушкой (без использования готовых предикатов).*/
grand_pa_and_da(X,Y) :- parent(Y,Z), parent(Z,X), woman(X), man(Y); parent(X,Z), parent(Z,Y), woman(Y), man(X).

/*2.1) Построить предикат grand_pa_and_da(X,Y), который проверяет, являются ли X и Y дедушкой и внучкой или внучкой и дедушкой (с использованием готовых предикатов).*/
grand_pa_and_da_1(X,Y) :- grand_da(X,Y), man(Y); grand_da(Y,X), man(X).

/*3) Построить предикат, который проверяет, является ли X тетей Y (без использования готовых предикатов).*/
aunt(X,Y) :- parent(Q,Y), parent(P,Z), parent(P,X), woman(X), woman(Q), woman(P), X\=Q.

/*3.1) Построить предикат, который проверяет, является ли X тетей Y (с использованием готовых предикатов).*/
aunt_1(X,Y) :- parent(Z,Y), sister(X,Z), woman(Z), X\=Z.

/*3.1) Построить предикат, который выводит всех тетей X.*/
aunt_2(X,Y) :- parent(Z,Y), sister(X,Z), woman(Z), X\=Z.

/*3.2) Построить предикат, который выводит всех тетей X.*/
auntes(X) :- setof(Q, aunt(Q,X), Auntes), print(Auntes), nl, fail.