competidores_diretos(A, B) :-
    alimenta(sol, A),
    alimenta(terra, A),
    alimenta(sol, B),
    alimenta(terra, B),
    A \= B.
