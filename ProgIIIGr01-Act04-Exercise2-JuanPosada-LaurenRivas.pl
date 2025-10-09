/*
Nombre del programa: Grafo de ciudades de canada con sus conexiones directas (unidirecciones) y los costos.
Autores: Juan Jose Posada Arboleda y  Lauren Yaneth Rivas 
Profesor: Ramiro Andres Barrios Valencia
Fecha: 08/10/2024
Descripción: Este es un progrma que define las conexiones directas entre ciudades de Canada y los costos asociados a cada conexión,
usando una serie de hechos y reglas para definir las conexiones, costos y rutas posibles entre las ciudades. 
Cada una de estos hechos usan listas para definir las conexiones y costos, las reglas hacen una manipulacion de las listas para sacar un resultado ideal o esperado.
*/
% Hechos consolidados: cada ciudad tiene lista de destinos con costos
costo_conexion(vancouver, [(edmonton, 16), (calgary, 13)]).
costo_conexion(edmonton, [(saskatoon, 12)]).
costo_conexion(calgary, [(edmonton, 4), (regina, 14)]).
costo_conexion(saskatoon, [(calgary, 9), (winnipeg, 20)]).
costo_conexion(regina, [(winnipeg, 4), (saskatoon, 7)]).

% Regla para determinar la conexión entre dos nodos
conectado(CiudadInicial, CiudadDestino) :- 
    costo_conexion(CiudadInicial, ListaDestinos),
    member((CiudadDestino, _), ListaDestinos).

% Consulta para saber qué nodo está conectado con regina y cuál es su costo
% ?- costo_conexion(regina, ListaDestinos), member((Destino, Costo), ListaDestinos).

% Regla para determinar si un nodo tiene aristas
tiene_aristas(Ciudad) :- 
    costo_conexion(Ciudad, _).

% Regla para determinar cuál es el costo para ir de un nodo X a un Z pasando por Y
costo_total(X, Z, Ct) :- 
    costo_conexion(X, ListaX),
    member((Y, C1), ListaX),
    costo_conexion(Y, ListaY),
    member((Z, C2), ListaY),
    Ct is C1 + C2.

% Regla para poder determinar si se puede ir de una ciudad X a una Z pasando por Y
viajar_ciudades(X, Z) :- 
    costo_conexion(X, ListaX),
    member((Y, _), ListaX),
    costo_conexion(Y, ListaY),
    member((Z, _), ListaY).

% Reglas para determinar si existe una conexión entre varias ciudades intermediarias
% Caso base
conexion_recursiva(X, W, Ct) :- 
    costo_conexion(X, ListaDestinos),
    member((W, Ct), ListaDestinos).

% Caso recursivo
conexion_recursiva(X, W, Ct) :- 
    costo_conexion(X, ListaX),
    member((I, C1), ListaX),
    conexion_recursiva(I, W, C2),
    Ct is C1 + C2.