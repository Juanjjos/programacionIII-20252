% Juan Jose Posada Arboleda, Lauren Yaneth Rivas y Zherick Velez
% 2. Probar que Coronel West es un criminal por los predicados dados

% Hechos dados y/o inferidos.
es_estadounidense(west).
enemigo_de(coreaSur, estadosUnidos).
vendio_armas(west,coreaSur).

%Reglas.
es_criminal(X) :-
    es_estadounidense(X),
    vendio_armas(X, Pais),
    enemigo_de(Pais, estadosUnidos).