menu_principal:-
    write('1. Entrar al menu de opciones administrativas'), nl,
    write('2. Entrar al menu de opciones generales'), nl,
    write('3. Salir del programa'), nl,
    read(Opcion),
    ejecutar_opcion_menu_principal(Opcion).

ejecutar_opcion_menu_principal(1):-
    menu_administrativo.
ejecutar_opcion_menu_principal(2):-
    menu_general.
ejecutar_opcion_menu_principal(3):-
    write('Saliendo del programa...'), nl.

menu_administrativo:-
    write('1. Gestion de peliculas'), nl,
    write('2. Gestion de series'), nl,
    write('3. Gestion de canciones'), nl,
    write('4. Gestion de usuarios'), nl,
    write('5. Ver historial de reproducciones'), nl,
    write('6. Volver al menu principal'), nl,
    read(Opcion),
    ejecutar_opcion_menu_administrativo(Opcion).

ejecutar_opcion_menu_administrativo(6):-
    menu_principal.

menu_general:-
    write('1. Buscar produccion'), nl,
    write('2. Recomendar'), nl,
    write('3. Registrar actividad'), nl,
    write('4. Volver al menu principal'), nl,
    read(Opcion),
    ejecutar_opcion_menu_general(Opcion).

ejecutar_opcion_menu_general(4):-
    menu_principal.
