/*  %NOTA: RETIRAR COMENTARIOS PARA EJECUTAR CADA EJERCICIO POR SEPARADO

Parcial 2 de Programación III - Grupo 01 
Autor: Juan Jose Posada Arboleda 
Profesor: Ramiro Andres Barrios Valencia
Fecha: 21/10/2025
Descripción: Este programa contiene la solución a los dos ejercicios propuestos en el parcial 2 de Programación III.

%Ejercicio 1: Ensamblaje de una bicicleta

% Hechos: Definición de piezas y sus componentes

% Pieza principal
componente(bicicleta, [rueda_delantera, rueda_trasera, cuadro, sillin, cadena, pedal, freno_delantero,freno_trasero]).
% Subcomponentes de las ruedas
componente(rueda_delantera, [llanta_delantera, rin_delantero, eje_delantero]).
componente(rueda_trasera, [llanta_trasera, rin_trasero, eje_trasero]).
% Subcomponentes del cuadro
componente(cuadro, [tubo_principal, tubo_superior, soporte_pedal]).
% Subcomponentes del sillín
componente(sillin, [base_sillin, forro_sillin, tubo_sillin]).
% Subcomponentes de la cadena
componente(cadena, [eslabones, pasadores, rodillos]).
% Subcomponentes del pedal
componente(pedal, [plataforma, eje_pedal, rodamientos]).
%Subcomponentes del freno delantero
componente(freno_delantero, [zapatas_delantero, cable_freno_delantero, palanca_freno_delantero]).
%Subcomponentes del freno trasero
componente(freno_trasero, [zapatas_trasero, cable_freno_trasero, palanca_freno_trasero]).
% Las piezas que no aparecen a la izquierda de un hecho "componente"
 %  se consideran piezas básicas o nodos hoja.


%Reglas y predicados necesarios.

% Obtener los componentes directos de una pieza
componentes(Pieza, Lista) :-
    componente(Pieza, Lista).

% Obtener piezas básicas necesarias (nodos hoja)
% Caso base: Pieza básica 
piezas_basicas(Pieza, [Pieza]) :-
    \+ componente(Pieza, _).

% Caso recursivo: descomponer y juntar hojas
piezas_basicas(Pieza, ListaFinal) :-
    componente(Pieza, Subcomponentes),
    piezas_basicas_lista(Subcomponentes, ListaFinal).

piezas_basicas_lista([], []).
piezas_basicas_lista([P|Resto], ListaFinal) :-
    piezas_basicas(P, ListaP),
    piezas_basicas_lista(Resto, ListaR),
    append(ListaP, ListaR, ListaFinal).

% Predicado para mostrar componentes directos de una pieza (Esta es usada como una funcion auxiliar para imprimir)
mostrar_piezas_basicas(Pieza) :-
    piezas_basicas(Pieza, L),
    write('Piezas basicas: '), nl,
    write(L), nl.

*/
/*
%Ejercicio 2: Arboles binarios y generaciones
% Caso base: si la generación pedida es 0.  Los nodos son las raíces de los árboles.
generacion(0, [], []).
generacion(0, [t(_, R, _)|RestoArboles], [R|RestoNodos]) :-
    generacion(0, RestoArboles, RestoNodos).

% Caso recursivo: cuando N > 0, se reduce en 1 y se busca en los subárboles izquierdo y derecho.
generacion(N, [], []) :- N > 0.
generacion(N, [t(Izq, _, Der)|RestoArboles], ListaNodos) :-
    N > 0,
    N1 is N - 1,
    generacion(N1, [Izq, Der], L1),
    generacion(N, RestoArboles, L2),
    append(L1, L2, ListaNodos).

% Manejo de árboles vacíos: se omiten los 'nil'.
generacion(N, [nil|Resto], Lista) :-
    generacion(N, Resto, Lista).
*/