%ЛР_2, Задание 3, Вариант 4 (4, 21, 32)
%В задаче необходимо выделить
%отдельно предикат чтения, предикат логики работы и предикат вывода.

%Для ввода массива
read_list(0, []):-!. % Если N = 0, то список считается пустым
read_list(N, [H|T]) :- read(H), New_N is N - 1,
    read_list(New_N, T).

% Вывод массива на экран
write_list([]) :- !.
write_list([H|T]) :- write(H), nl, write_list(T).


%1.4. Дан целочисленный массив. Вывести индексы массива в том порядке, в
%котором соответствующие им элементы образуют убывающую последовательность.

list2pairs(List, Pairs):-
    list2pairs(List, 0, Pairs).

list2pairs([], _, []). % Если список пуст.
list2pairs([H|T], Index, [(Index, H)|Tail]):-
    Next_Index is Index + 1,
    list2pairs(T, Next_Index, Tail).

%Сортировка
sort_pairs_declining(Pairs, Sorted_Pairs):-
    predsort(compare_pairs, Pairs, Sorted_Pairs).

% Сравнение пар элементов для образование убывающей последовательности. 
compare_pairs(Sign, (_, Val_1), (_, Val_2)):-
    compare(Sign, Val_2, Val_1), write(compare(Sign, Val_2, Val_1)).

% Извлекаем индексы из списка пар.
extract_index([], []).
extract_index([(Index, _)|T], [Index|Tail]):-
    extract_index(T, Tail).

% Предикат main для вызова чтения, вывода и сортировки.
main(N, Indices):-
    read_list(N, List), nl,
    write_list(List),
    list2pairs(List, Pairs),
    sort_pairs_declining(Pairs, Sorted_Pairs),
    extract_index(Sorted_Pairs, Indices), nl.


%1.21 Дан целочисленный массив. Необходимо найти элементы, расположенные
%после первого максимального.

main_find_after(N, Res):-
    read_list(N, List), nl,
    write_list(List),
    max_element(List, Max),
    elem_after_max(List, Max, Res).

% Предикат нахождения максимального элемента в списке
max_element(List, Max):-
    max_element(List, -1, Max).

max_element([], Max, Max).
max_element([H|T], Cur_Max, Max):-
    (H > Cur_Max -> New_Max = H, max_element(T, New_Max, Max);
    New_Max = Cur_Max, max_element(T, New_Max, Max)).

% Предикат нахождения элементов, стоящих после максимального
elem_after_max([], _, []).
elem_after_max([H|T], Max, Res):-
    (   H < Max -> elem_after_max(T, Max, Res) ; Res = T).


%1.32 Дан целочисленный массив. Найти количество его локальных максимумов.

main_loc_max(N, Max):-
    read_list(N, List), nl,
    write_list(List),
    loc_max(List, Max).

% Предикат для нахождения локального максимума
loc_max(List, Count):-
    append_zeros(List, [H|T]),
    lmh([H|T], H - 1, 0, Count).

append_zeros(List, New_List):- append(List, [0, 0], New_List).

lmh([0], _, Cou, Cou):- !.
lmh([H|T], Pred, Cur_Cou, Ans):-
    T \= [] -> T = [Next|_],
    ( T == [0, 0], abs(H, New_H),New_Next is Next - New_H - 1, H > Pred, H > New_Next, New_Cur_Cou is Cur_Cou + 1, lmh(T, Pred, New_Cur_Cou, Ans), !
    ; H > Next, H > Pred -> New_Pred = H, New_Cur_Cou is Cur_Cou + 1, lmh(T, New_Pred, New_Cur_Cou, Ans)
    ; New_Pred = H, lmh(T, New_Pred, Cur_Cou, Ans)).