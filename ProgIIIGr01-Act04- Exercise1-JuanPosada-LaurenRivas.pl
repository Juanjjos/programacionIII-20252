/*
Nombre del programa: Arbol genealógico de los Simpson desde abuelos hasta nietos.
Autores: Juan Jose Posada Arboleda y Lauren Yaneth Rivas.
Profesor: Ramiro Andres Barrios Valencia
Fecha: 08/10/2024
Descripción: Este es un progrma que define las relaciones familiares entre los personajes destacados de los Simpsons, 
desde los abuelos hasta los nietos, esto usando una serie de hechos de padres y el genero de cada persona, y reglas para definir las relaciones.
Los hechos usan listas para definir relaciones de padres e hijos, las reglas hacen una manipulacion de las listas para sacar un resultado esperado de la relacion que se este consultando.
*/
%Ejercicio de listas con el arbol genealógico de los Simpson
hombre([bart,homero, abraham, herbert, clancy]).
mujer([marge, lisa, maggie, patty, selma, mona, jacqueline, ling]).
es_padre_de(homero, [bart, lisa, maggie]).
es_padre_de(abraham, [herbert, homero]).
es_padre_de(clancy, [marge, selma, patty]).
es_madre_de(mona, [homero]).
es_madre_de(marge, [lisa, maggie, bart]).
es_madre_de(jacqueline, [marge, patty, selma]).
es_madre_de(selma, [ling]).

%Reglas o condiciones de relacion:
es_hombre(X) :- hombre(Lista), member(X, Lista),!.
es_mujer(X) :- mujer(Lista), member(X, Lista),!.
padre_de(X,Y) :- es_padre_de(X,List), member(Y,List).
madre_de(X,Y) :- es_madre_de(X,List), member(Y,List).
es_progenitor(X,Y):- padre_de(X,Y); madre_de(X,Y).

es_abuelo(X,Z):- padre_de(X,Y), es_progenitor(Y,Z).
es_abuela(X,Z):- madre_de(X,Y), es_progenitor(Y,Z).
es_hijo(X,Z):- es_hombre(X), es_progenitor(Z,X).
es_hija(X,Z):- es_mujer(X), es_progenitor(Z,X).
es_hermano(X,Y):- es_hombre(X), es_progenitor(Z,X), es_progenitor(Z,Y), X\=Y.
es_hermana(X,Y):- es_mujer(X), es_progenitor(Z,X), es_progenitor(Z,Y), X\=Y.
es_nieto(X,Y):- es_hombre(X), (es_abuelo(Y,X); es_abuela(Y,X)).
es_nieta(X,Y):- es_mujer(X), (es_abuelo(Y,X); es_abuela(Y,X)).
es_tio(X,Y):- es_hombre(X), es_hermano(X,Z), es_progenitor(Z,Y).
es_tia(X,Y):- es_mujer(X), es_hermana(X,Z), es_progenitor(Z,Y).
es_sobrino(X,Y):- es_hombre(X), (es_tio(Y,X); es_tia(Y,X)).
es_sobrina(X,Y):- es_mujer(X), (es_tio(Y,X); es_tia(Y,X)).
es_primo(X,Y):- es_hombre(X), (es_abuelo(Z,X); es_abuela(Z,X)), (es_abuelo(Z,Y); es_abuela(Z,Y)), \+ es_hermano(X,Y), \+ es_hermana(X,Y), X\=Y.
es_prima(X,Y):- es_mujer(X), (es_abuelo(Z,X); es_abuela(Z,X)), (es_abuelo(Z,Y); es_abuela(Z,Y)), \+ es_hermano(X,Y), \+ es_hermana(X,Y), X\=Y.