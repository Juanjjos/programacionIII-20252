/*
Nombre del programa:Arbol genealógico de los Simpson desde abuelos hasta nietos.
Autores: Juan Jose Posada Arboleda, Lauren Yaneth Rivas y Zherick Velez
Profesor: Ramiro Andres Barrios Valencia
Fecha: 02/09/2024
Descripción: Este es un progrma que define las relaciones familiares entre los personajes destacados de los Simpsons, 
desde los abuelos hasta los nietos, esto usando una serie de hechos de padres y el genero de cada persona, y reglas para definir las relaciones.
*/

% Hechos dados y/o inferidos.
padre_de(abraham, herbert).
padre_de(abraham, homero).
padre_de(homero, bart).
padre_de(homero, lisa).
padre_de(homero, maggie).
padre_de(clancy, marge).
padre_de(clancy, patty).
padre_de(clancy, selma).
madre_de(mona,homero).
madre_de(marge, bart).
madre_de(marge, lisa).
madre_de(marge, maggie).
madre_de(jacqueline, selma).
madre_de(jacqueline, marge).
madre_de(jacqueline, patty).
madre_de(selma, ling).
es_hombre(abraham).
es_hombre(herbert).
es_hombre(homero).
es_hombre(bart).
es_hombre(clancy).
es_mujer(mona).
es_mujer(marge).
es_mujer(lisa).
es_mujer(maggie).
es_mujer(patty).
es_mujer(selma).
es_mujer(jacqueline).
es_mujer(ling).

%Reglas o condiciones de relacion.
abuelo(A,N) :- ((padre_de(A,P), padre_de(P,N)); (padre_de(A,M), madre_de(M,N))) , es_hombre(A). 
abuela(A,N) :- ((madre_de(A,P), padre_de(P,N)) ; (madre_de(A,M), madre_de(M,N))) , es_mujer(A).
hijo(H,P) :- es_hombre(H), padre_de(P,H);  es_hombre(H), madre_de(P,H).
hija(H,P) :- es_mujer(H), padre_de(P,H); es_mujer(H), madre_de(P,H).
hermano(X,Y) :- X \= Y , ((madre_de(Z,X) , madre_de(Z,Y)) ; (padre_de(W,X) , padre_de(W,Y))) , es_hombre(X).
hermana(H,O) :- H \= O, ((madre_de(M,H), madre_de(M,O)); padre_de(P,H), padre_de(P,O)) , es_mujer(H). 
tio(X,Z) :- hermano(X,Y), (padre_de(Y,Z) ; madre_de(Y,Z)) , es_hombre(X).
tia(X,Z) :- hermana(X,Y), (padre_de(Y,Z) ; madre_de(Y,Z)) , es_mujer(X).
sobrino(X,Y) :- (tio(Y,X) ; tia(Y,X)) , es_hombre(X).
sobrina(X,Y) :- (tio(Y,X) ; tia(Y,X)) , es_mujer(X).
prima(X,Y) :- (tio(Z,Y), padre_de(Z,X) ; tia(Z,Y), madre_de(Z,X)) , es_mujer(X).
primo(X,Y) :- (tio(Z,Y), padre_de(Z,X) ; tia(Z,Y), madre_de(Z,X)) , es_hombre(X).
nieto(N,A) :- (abuelo(A,N) ; abuela(A,N)), es_hombre(N).
nieta(N,A) :- (abuelo(A,N) ; abuela(A,N)), es_mujer(N).