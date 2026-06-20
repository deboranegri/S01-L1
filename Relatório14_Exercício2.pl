especie_dominante(Animal) :-
    nicho(Animal, X), nicho(Animal, Y), X \= Y,
    local_comum(Animal, margens).
