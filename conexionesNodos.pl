
%Determinar la conexion entre saskaton  y vancouver. Con que nodos esta conectado Regina y cual es su costo de conexion. Regla para determinar si un nodo tiene aristas.
% Hechos dados y/o inferidos.
costo_conexion(vancouver, edmonton, 16).
costo_conexion(vancouver, calgary, 13).
costo_conexion(edmonton, saskaton, 12).
costo_conexion(calgary, edmonton, 4).
costo_conexion(calgary, regina, 14).
costo_conexion(saskaton, calgary, 9).
costo_conexion(saskaton, winnipeg, 20).
costo_conexion(regina, winnipeg, 4).
costo_conexion(regina, saskaton, 7).

%Regla para determinar la conexion entre dos nodos
conectado(Cuidadinicial,Cuidaddestino) :- costo_conexion(Cuidadinicial,Cuidaddestino,_).
%Consulta para saber que nodo esta conectado con regina y cual es su costo: costo_conexion(regina,Destino,Costo).
%Regla para determinar si un nodo tiene aristas
tiene_aristas(Cuidad) :- costo_conexion(Cuidad,_,_).
%Regla para determinar cual es el costo para ir de un nodo X a un Z pasando por Y.
costo_Total(X,Z,Ct) :- costo_conexion(X,Y,C1), costo_conexion(Y,Z,C2), Ct is C1 + C2.