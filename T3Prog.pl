/*
Nombre del programa: Relaciones familiares con consultas, hechos y reglas
Autores: Juan Jose Posada Arboleda, Lauren Yaneth Rivas y Zherick Velez
Profesor: Ramiro Andres Barrios Valencia
Fecha: 16/09/2024
*/
%Ejercicio 1.1
progenitor(clara,jose).
progenitor(tomas, jose).
progenitor(tomas, isabel).
progenitor(jose, ana).
progenitor(jose, patricia).
progenitor(patricia, jaime).

%Consultas  ejercicio 1.1
%progenitor(jaime,X).   R = False  ¿Quien es el hijo o hija de jaime?
%progenitor(X,jaime).    R = X = patricia ¿Quien es el progenitor de jaime?
%progenitor(clara,X),progenitor(X,patricia).   R = X = jose  ¿Quien es el hijo o hija de clara, y a su vez el progenitor de patricia? = ¿Quien es el progenitor de patricia?
%progenitor(tomas,X), progenitor(X,Y), progenitor(Y,Z).   R = X=jose, Y= patricia, Z=jaime
% ¿Quien es el abuelo de Z? = ¿ Quien es el hijo de tomas y a su vez tiene un hijo o hija Y, que a su vez Y tiene un hijo Z?

% Ejercicio 1.2
%progenitor(X, patricia).   "¿Quién es el progenitor de Patricia?"
%progenitor(isabel,X).     "¿Tiene isabel un hijo o hija?"
%progenitor(X,Y), progenitor(Y,isabel).     "¿Quién es el abuelo de Isabel?"
%progenitor(P,jose), progenitor(P,X), write(X), nl, fail,!.    "¿Cuáles son los tios de Patricia? (Sin excluir al padre)"

% Ejercicio 1.3
mujer(clara).
mujer(isabel).
mujer(ana).
mujer(patricia).
hombre(jose).
hombre(tomas).
hombre(jaime).
dif(X,Y) :- X\=Y.
es_madre(X) :- mujer(X), progenitor(X,_),!.
es_padre(X) :- hombre(X), progenitor(X,_), !.
es_hijo(X) :- hombre(X), progenitor(_,X), !.
hermana_de(X,Y) :- mujer(X), progenitor(Z,X), progenitor(Z,Y), dif(X,Y), !.
abuelo_de(X,Y) :- hombre(X), progenitor(X,Z), progenitor(Z,Y), !.
abuela_de(X,Y) :- mujer(X), progenitor(X,Z), progenitor(Z,Y), !.
hermanos(X,Y) :- progenitor(Z,X), progenitor(Z,Y), dif(X,Y).
tia(X,Y) :- mujer(X), progenitor(P,X), progenitor(P,Z), progenitor(Z,Y), !.
