item_faltante(Hangar, Peca) :-
    precisa(_, Peca),
    possui(Hangar, _),
    \+ possui(Hangar, Peca).
 
pode_montar(Hangar, Componente) :-
    componente(Componente, _, Cat),
    Cat \= fundamental,
    possui(Hangar, _),
    \+ (precisa(Componente, Req), \+ possui(Hangar, Req)).
 
?- pode_montar(hangar_beta, C).

?- pode_montar(hangar_gamma, scanner_deep_space).
