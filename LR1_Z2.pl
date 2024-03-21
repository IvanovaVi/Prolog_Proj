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

/*Задание 2, вариант 4
1) Построить предикат father(X, Y), который проверяет, является ли X отцом Y.
    1.1) Построить предикат, father(X), который выводит отца X.*/
father(X,Y) :- man(X), parent(X,Y).
father(X) :- father(Y,X), print(Y), nl, fail.

/*2) Построить предикат wife(X, Y), который проверяет, является ли X женой Y.
    2.1) Построить предикат wife(X), который выводит жену X.*/
wife(X,Y) :- woman(X), parent(X,Z), parent(Y,Z), X \= Y.
wife(X) :- setof(Y, wife(Y,X), Wife), print(Wife), nl, fail.