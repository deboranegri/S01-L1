hangar_combate(H) :-
    possui(H, P1),
    componente(P1, combate, _),
    possui(H, P2),
    componente(P2, combate, _),
    P1 \= P2.
    
falta_energia(H) :-
    possui(H, _),
    \+ (possui(H, P), componente(P, propulsao, _)).
 
?- hangar_combate(H), falta_energia(H).
