/*
Nombre del programa: Conexiones entre cuidades y costos por el viaje directo y con escalas
Autores: Juan Jose Posada Arboleda, Lauren Yaneth Rivas y Zherick Velez
Profesor: Ramiro Andres Barrios Valencia
Fecha: 02/09/2024
Descripción: Este programa determina las conexiones entre varias ciudades y los costos de viaje entre ellas, tanto directos como con escalas.
*/
%Determinar la conexión entre saskaton  y vancouver. Con que nodos esta conectado Regina y cual es su costo de conexion. Regla para determinar si un nodo tiene aristas.
% Hechos dados y/o inferidos.
costo_conexion(vancouver, edmonton, 16).
costo_conexion(vancouver, calgary, 13).
costo_conexion(edmonton, saskatoon, 12).
costo_conexion(calgary, edmonton, 4).
costo_conexion(calgary, regina, 14).
costo_conexion(saskatoon, calgary, 9).
costo_conexion(saskatoon, winnipeg, 20).
costo_conexion(regina, winnipeg, 4).
costo_conexion(regina, saskatoon, 7).

%Regla para determinar la conexion entre dos nodos
conectado(Cuidadinicial,Cuidaddestino) :- costo_conexion(Cuidadinicial,Cuidaddestino,_).
%Consulta para saber que nodo esta conectado con regina y cual es su costo: costo_conexion(regina,Destino,Costo).
%Regla para determinar si un nodo tiene aristas
tiene_aristas(Cuidad) :- costo_conexion(Cuidad,_,_).
%Regla para determinar cual es el costo para ir de un nodo X a un Z pasando por Y.
costo_total(X,Z,Ct) :- costo_conexion(X,Y,C1), costo_conexion(Y,Z,C2), Ct is C1 + C2.
%Regla para poder determinar si se puede ir de una cuidad X a una Z pasando por Y
viajar_cuidades(X,Z) :- costo_conexion(X,Y,_), costo_conexion(Y,Z,_).

%Reglas para determinar si existe una conexion entre varias ciudades intermediarias
%Paso base
conexion_recursiva(X,W,Ct) :- costo_conexion(X,W,Ct).
%Recursividad
conexion_recursiva(X,W,Ct) :- costo_conexion(X,I,C1), conexion_recursiva(I,W,C2), Ct is C1 + C2.