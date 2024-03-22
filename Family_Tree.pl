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

/*Задание 1
1) Построить предикаты men и women, которые выводят на экран всех мужчин и всех женщин соответственно.*/
men():- man(X), print(X), nl, fail.
women():- woman(X), print(X), nl, fail.

/*2) Построить предикат children(X), который выводит всех детей X.*/
children(X):- parent(X,Y), print(Y), nl, fail.

/*3) Построить предикат mother(X, Y), который проверяет, является ли X матерью Y.
    3.1) Построить предикат, mother(X), который выводит маму X.*/
mother(X,Y):- woman(X), parent(X,Y).
mother(X):- mother(Y,X), print(Y), nl, fail.

/*4) Построить предикат brother(X, Y), который проверяет, является ли X братом Y (доп проверка на то, что X не должен быть равен Y)
    4.1) Построить предикат brothers(X), который выводит всех братьев X.*/

brother(X, Y) :- parent(Z, X), parent(Z, Y), man(X), man(Z), X \= Y.
brothers(X) :- setof(Y, brother(Y, X), Brothers), print(Brothers).

/*5) Построить предикат b_s(X,Y), который проверяет, являются ли X и Y родными братом и сестрой или братьями или сестрами. 
    5.1) Построить предикат b_s(X), который выводит всех братьев или сестер X.*/

b_s(X,Y) :- parent(Z,X), parent(Z,Y), X \= Y.
b_s(X) :- setof(Y, b_s(X,Y), Siblings), print(Siblings), nl, fail.