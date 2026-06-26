peca_critica(P) :-
    componente(P, Consumo, _),
    Consumo > 5,
    precisa(P1, P),
    precisa(P2, P),
    P1 \= P2.


?- componente(P, sistemas, 6), \+ precisa(_, P).
