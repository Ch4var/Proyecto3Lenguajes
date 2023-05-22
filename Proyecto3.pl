es_genero_pelicula(accion).
es_genero_pelicula(comedia).
es_genero_pelicula(drama).
es_genero_pelicula(fantasia).
es_genero_pelicula(terror).
es_genero_pelicula(suspenso).
es_genero_pelicula(musical).
es_genero_pelicula(historia).

es_genero_serie(accion).
es_genero_serie(comedia).
es_genero_serie(drama).
es_genero_serie(fantasia).
es_genero_serie(terror).
es_genero_serie(suspenso).
es_genero_serie(musical).
es_genero_serie(historia).
es_genero_serie(reality).

es_genero_cancion(clasica).
es_genero_cancion(jazz).
es_genero_cancion(rhythm_and_blues).
es_genero_cancion(rock_and_roll).
es_genero_cancion(country).
es_genero_cancion(pop).
es_genero_cancion(reggae).
es_genero_cancion(hip_hop).

% Base de conocimientos para almacenar las películas, series, canciones, usuarios y reproducciones
:- dynamic pelicula/4.
:- dynamic serie/4.
:- dynamic cancion/4.
:- dynamic usuario/4.
:- dynamic reproduccion/4.

menu_principal :-
    writeln('--- Menú Principal ---'),
    writeln('1. Entrar al Menú de Opciones Administrativas'),
    writeln('2. Entrar al Menú de Opciones Generales'),
    writeln('3. Salir del Programa'),
    read(Opcion),
    ejecutar_opcion_menu_principal(Opcion).

ejecutar_opcion_menu_principal(1) :-
    repeat,
    menu_administrativo,
    menu_principal.

ejecutar_opcion_menu_principal(2) :-
    repeat,
    menu_general,
    menu_principal.

ejecutar_opcion_menu_principal(3) :-
    guardar_datos,
    writeln('¡Hasta luego!').

ejecutar_opcion_menu_principal(_) :-
    writeln('Opción inválida. Por favor, ingrese una opción válida.'),
    menu_principal.

menu_administrativo :-
    writeln('--- Menú Administrativo ---'),
    writeln('1. Gestión de películas'),
    writeln('2. Gestión de series'),
    writeln('3. Gestión de canciones'),
    writeln('4. Gestión de usuarios'),
    writeln('5. Ver historial de reproducciones'),
    writeln('6. Volver al menú principal'),
    read(Opcion),
    ejecutar_opcion_menu_administrativo(Opcion).

ejecutar_opcion_menu_administrativo(1) :-
    repeat,
    gestion_peliculas,
    menu_administrativo.

ejecutar_opcion_menu_administrativo(2) :-
    repeat,
    gestion_series,
    menu_administrativo.

ejecutar_opcion_menu_administrativo(3) :-
    repeat,
    gestion_canciones,
    menu_administrativo.

ejecutar_opcion_menu_administrativo(4) :-
    repeat,
    gestion_usuarios,
    menu_administrativo.

ejecutar_opcion_menu_administrativo(5) :-
   mostrar_informacion_reproducciones,
   menu_administrativo.

ejecutar_opcion_menu_administrativo(6).

ejecutar_opcion_menu_administrativo(_) :-
    writeln('Opción inválida. Por favor, ingrese una opción válida.'),
    menu_administrativo.

menu_general :-
    writeln('--- Menú General ---'),
    writeln('1. Buscar producción'),
    writeln('2. Recomendar'),
    writeln('3. Registrar actividad'),
    writeln('4. Volver al menú principal'),
    read(Opcion),
    ejecutar_opcion_menu_general(Opcion).

ejecutar_opcion_menu_general(1) :-
    buscar_produccion,
    menu_general.

ejecutar_opcion_menu_general(2) :-
   recomendar,
   menu_general.

ejecutar_opcion_menu_general(3) :-
    registrar_reproduccion,
    menu_general.

ejecutar_opcion_menu_general(4).

ejecutar_opcion_menu_general(_) :-
    writeln('Opción inválida. Por favor, ingrese una opción válida.'),
    menu_general.

mostrar_informacion_peliculas :-
    writeln('--- Información de las Películas ---'),
    findall([Nombre, Genero, ActorPrincipal, Director], pelicula(Nombre, Genero, ActorPrincipal, Director), Peliculas),
    mostrar_peliculas(Peliculas).

mostrar_peliculas([]).
mostrar_peliculas([[Nombre, Genero, ActorPrincipal, Director]|T]) :-
    writeln('--------------------------'),
    writeln('Nombre: '),
    writeln(Nombre),
    writeln('Género: '),
    writeln(Genero),
    writeln('Actor Principal: '),
    writeln(ActorPrincipal),
    writeln('Director: '),
    writeln(Director),
    mostrar_peliculas(T).

agregar_pelicula :-
    writeln('--- Agregar Película ---'),
    writeln('Ingrese el nombre de la película:'),
    read(Nombre),
    writeln('Ingrese el género de la película:'),
    read(Genero),
    validar_genero_pelicula(Genero),
    writeln('Ingrese el actor principal de la película:'),
    read(ActorPrincipal),
    writeln('Ingrese el director de la película:'),
    read(Director),
    assertz(pelicula(Nombre, Genero, ActorPrincipal, Director)),
    writeln('Película agregada con éxito.').

gestion_peliculas :-
    writeln('--- Gestión de Películas ---'),
    writeln('1. Mostrar información de las películas'),
    writeln('2. Agregar una nueva película'),
    writeln('3. Volver al menú administrativo'),
    read(Opcion),
    ejecutar_opcion_gestion_peliculas(Opcion).

ejecutar_opcion_gestion_peliculas(1) :-
    mostrar_informacion_peliculas,
    gestion_peliculas.

ejecutar_opcion_gestion_peliculas(2) :-
    agregar_pelicula,
    gestion_peliculas.

ejecutar_opcion_gestion_peliculas(3).

ejecutar_opcion_gestion_peliculas(_) :-
    writeln('Opción inválida. Por favor, ingrese una opción válida.'),
    gestion_peliculas.

mostrar_informacion_series :-
    writeln('--- Información de las Series ---'),
    findall([Nombre, Genero, ActorPrincipal, Director], serie(Nombre, Genero, ActorPrincipal, Director), Series),
    mostrar_series(Series).

mostrar_series([]).
mostrar_series([[Nombre, Genero, ActorPrincipal, Director]|T]) :-
    writeln('--------------------------'),
    writeln('Nombre: '),
    writeln(Nombre),
    writeln('Género: '),
    writeln(Genero),
    writeln('Actor Principal: '),
    writeln(ActorPrincipal),
    writeln('Director: '),
    writeln(Director),
    mostrar_series(T).

agregar_serie :-
    writeln('--- Agregar Serie ---'),
    writeln('Ingrese el nombre de la serie:'),
    read(Nombre),
    writeln('Ingrese el género de la serie:'),
    read(Genero),
    validar_genero_serie(Genero),
    writeln('Ingrese el actor principal de la serie:'),
    read(ActorPrincipal),
    writeln('Ingrese el director de la serie:'),
    read(Director),
    assertz(serie(Nombre, Genero, ActorPrincipal, Director)),
    writeln('Serie agregada con éxito.').

gestion_series :-
    writeln('--- Gestión de Series ---'),
    writeln('1. Mostrar información de las series'),
    writeln('2. Agregar una nueva serie'),
    writeln('3. Volver al menú administrativo'),
    read(Opcion),
    ejecutar_opcion_gestion_series(Opcion).

ejecutar_opcion_gestion_series(1) :-
    mostrar_informacion_series,
    gestion_series.

ejecutar_opcion_gestion_series(2) :-
    agregar_serie,
    gestion_series.

ejecutar_opcion_gestion_series(3).

ejecutar_opcion_gestion_series(_) :-
    writeln('Opción inválida. Por favor, ingrese una opción válida.'),
    gestion_series.

mostrar_informacion_canciones :-
    writeln('--- Información de las Canciones ---'),
    findall([Nombre, Genero, Cantante, Productor], cancion(Nombre, Genero, Cantante, Productor), Canciones),
    mostrar_canciones(Canciones).

mostrar_canciones([]).
mostrar_canciones([[Nombre, Genero, Cantante, Productor]|T]) :-
    writeln('--------------------------'),
    writeln('Nombre: '),
    writeln(Nombre),
    writeln('Género: '),
    writeln(Genero),
    writeln('Cantante: '),
    writeln(Cantante),
    writeln('Productor: '),
    writeln(Productor),
    mostrar_canciones(T).

agregar_cancion :-
    writeln('--- Agregar Canción ---'),
    writeln('Ingrese el nombre de la canción:'),
    read(Nombre),
    writeln('Ingrese el género de la canción:'),
    read(Genero),
    validar_genero_cancion(Genero),
    writeln('Ingrese el cantante de la canción:'),
    read(Cantante),
    writeln('Ingrese el productor de la canción:'),
    read(Productor),
    assertz(cancion(Nombre, Genero, Cantante, Productor)),
    writeln('Canción agregada con éxito.').

gestion_canciones :-
    writeln('--- Gestión de Canciones ---'),
    writeln('1. Mostrar información de las canciones'),
    writeln('2. Agregar una nueva canción'),
    writeln('3. Volver al menú administrativo'),
    read(Opcion),
    ejecutar_opcion_gestion_canciones(Opcion).

ejecutar_opcion_gestion_canciones(1) :-
    mostrar_informacion_canciones,
    gestion_canciones.

ejecutar_opcion_gestion_canciones(2) :-
    agregar_cancion,
    gestion_canciones.

ejecutar_opcion_gestion_canciones(3).

ejecutar_opcion_gestion_canciones(_) :-
    writeln('Opción inválida. Por favor, ingrese una opción válida.'),
    gestion_canciones.

mostrar_informacion_usuarios :-
    writeln('--- Información de los Usuarios ---'),
    findall([Nombre, AfinidadPeliculas, AfinidadSeries, AfinidadCanciones], usuario(Nombre, AfinidadPeliculas, AfinidadSeries, AfinidadCanciones), Usuarios),
    mostrar_usuarios(Usuarios).

mostrar_usuarios([]).
mostrar_usuarios([[Nombre, AfinidadPeliculas, AfinidadSeries, AfinidadCanciones]|T]) :-
    writeln('--------------------------'),
    writeln('Nombre: '),
    writeln(Nombre),
    writeln('Afinidad con géneros de películas: '),
    writeln(AfinidadPeliculas),
    writeln('Afinidad con géneros de series: '),
    writeln(AfinidadSeries),
    writeln('Afinidad con géneros de canciones: '),
    writeln(AfinidadCanciones),
    mostrar_usuarios(T).

agregar_usuario :-
    writeln('--- Agregar Usuario ---'),
    writeln('Ingrese el nombre del usuario:'),
    read(Nombre),
    findall(GeneroPelicula, es_genero_pelicula(GeneroPelicula), GenerosPeliculas),
    preguntar_afinidad_generos(GenerosPeliculas, 'películas', AfinidadPeliculas),
    findall(GeneroSerie, es_genero_serie(GeneroSerie), GenerosSeries),
    preguntar_afinidad_generos(GenerosSeries, 'series', AfinidadSeries),
    findall(GeneroCancion, es_genero_cancion(GeneroCancion), GenerosCanciones),
    preguntar_afinidad_generos(GenerosCanciones, 'canciones', AfinidadCanciones),
    assertz(usuario(Nombre, AfinidadPeliculas, AfinidadSeries, AfinidadCanciones)),
    writeln('Usuario agregado con éxito.').

preguntar_afinidad_generos([], _, []).
preguntar_afinidad_generos([Genero|T], TipoProduccion, [Afinidad|AT]) :-
    write('Ingrese su grado de afinidad con el género '),
    write(Genero),
    write(' de '),
    write(TipoProduccion),
    write(': '),
    read(Afinidad),
    validar_afinidad(Afinidad),
    preguntar_afinidad_generos(T, TipoProduccion, AT).

mostrar_informacion_reproducciones :-
    writeln('--- Historial de Reproducciones ---'),
    findall([NombreUsuario, TipoProduccion, NombreTitulo, Calificacion], reproduccion(NombreUsuario, TipoProduccion, NombreTitulo, Calificacion), Reproducciones),
    mostrar_reproducciones(Reproducciones).

mostrar_reproducciones([]).
mostrar_reproducciones([[NombreUsuario, TipoProduccion, NombreTitulo, Calificacion]|T]) :-
    writeln('--------------------------'),
    writeln('Nombre del usuario: '),
    writeln(NombreUsuario),
    writeln('Tipo de producción: '),
    writeln(TipoProduccion),
    writeln('Nombre del título: '),
    writeln(NombreTitulo),
    writeln('Calificación asignada: '),
    writeln(Calificacion),
    mostrar_reproducciones(T).

buscar_produccion :-
    writeln('--- Buscar Producción ---'),
    writeln('Ingrese el texto a buscar:'),
    read(Texto),
    findall([Nombre, Genero, ActorPrincipal, Director], (pelicula(Nombre, Genero, ActorPrincipal, Director), (sub_atom(Nombre, _, _, _, Texto) ; sub_atom(Genero, _, _, _, Texto) ; sub_atom(ActorPrincipal, _, _, _, Texto))), Peliculas),
    findall([Nombre, Genero, ActorPrincipal, Director], (serie(Nombre, Genero, ActorPrincipal, Director), (sub_atom(Nombre, _, _, _, Texto) ; sub_atom(Genero, _, _, _, Texto))), Series),
    findall([Nombre, Genero, Cantante, Productor], (cancion(Nombre, Genero, Cantante, Productor), (sub_atom(Nombre, _, _, _, Texto) ; sub_atom(Cantante, _, _, _, Texto))), Canciones),
    writeln('--- Resultados de la búsqueda ---'),
    mostrar_peliculas(Peliculas),
    mostrar_series(Series),
    mostrar_canciones(Canciones).

registrar_reproduccion :-
    writeln('--- Registrar Reproducción ---'),
    writeln('Ingrese el nombre del usuario:'),
    read(NombreUsuario),
    validar_usuario(NombreUsuario),
    writeln('Ingrese el tipo de producción (película, serie o canción):'),
    read(TipoProduccion),
    validar_tipo_produccion(TipoProduccion),
    writeln('Ingrese el nombre del título:'),
    read(NombreTitulo),
    validar_titulo(TipoProduccion, NombreTitulo),
    writeln('Ingrese la calificación asignada (de 1 a 5):'),
    read(Calificacion),
    validar_calificacion(Calificacion),
    assertz(reproduccion(NombreUsuario, TipoProduccion, NombreTitulo, Calificacion)),
    writeln('Reproducción registrada con éxito.').

validar_usuario(NombreUsuario) :-
    usuario(NombreUsuario, _, _, _).

validar_usuario(_) :-
    writeln('Usuario inválido. Por favor ingrese un usuario válido.'),
    fail.

validar_tipo_produccion(pelicula).
validar_tipo_produccion(serie).
validar_tipo_produccion(cancion).

validar_tipo_produccion(_) :-
    writeln('Tipo de producción inválido. Por favor ingrese un tipo de producción válido.'),
    fail.

validar_titulo(pelicula, NombreTitulo) :-
    pelicula(NombreTitulo, _, _, _).

validar_titulo(serie, NombreTitulo) :-
    serie(NombreTitulo, _, _, _).

validar_titulo(cancion, NombreTitulo) :-
    cancion(NombreTitulo, _, _, _).

validar_titulo(_, _) :-
    writeln('Título inválido. Por favor ingrese un título válido.'),
    fail.

validar_calificacion(Calificacion) :-
    integer(Calificacion),
    between(1, 5, Calificacion).

validar_calificacion(_) :-
   writeln('Calificación inválida. Por favor ingrese una calificación válida.'),
   fail.

validar_afinidad(Afinidad) :-
    integer(Afinidad),
    between(1, 10, Afinidad).

validar_afinidad(_) :-
    writeln('Afinidad inválida. Por favor ingrese un número del 1 al 10.'),
    fail.

gestion_usuarios :-
    writeln('--- Gestión de Usuarios ---'),
    writeln('1. Mostrar información de los usuarios'),
    writeln('2. Agregar un nuevo usuario'),
    writeln('3. Volver al menú administrativo'),
    read(Opcion),
    ejecutar_opcion_gestion_usuarios(Opcion).

ejecutar_opcion_gestion_usuarios(1) :-
    mostrar_informacion_usuarios,
    gestion_usuarios.

ejecutar_opcion_gestion_usuarios(2) :-
    agregar_usuario,
    gestion_usuarios.

ejecutar_opcion_gestion_usuarios(3).

ejecutar_opcion_gestion_usuarios(_) :-
   writeln('Opción inválida. Por favor ingrese una opción válida.'),
   gestion_usuarios.

validar_genero_pelicula(Genero) :-
    es_genero_pelicula(Genero).

validar_genero_pelicula(_) :-
    writeln('Género inválido. Por favor, ingrese un género válido.'),
    fail.

validar_genero_serie(Genero) :-
    es_genero_serie(Genero).

validar_genero_serie(_) :-
    writeln('Género inválido. Por favor, ingrese un género válido.'),
    fail.

validar_genero_cancion(Genero) :-
    es_genero_cancion(Genero).

validar_genero_cancion(_) :-
    writeln('Género inválido. Por favor, ingrese un género válido.'),
    fail.

guardar_datos :-
    open('E:\\Sergio\\Proyecto3Lenguajes\\datos.txt', write, Stream),
    findall(pelicula(Nombre, Genero, ActorPrincipal, Director), pelicula(Nombre, Genero, ActorPrincipal, Director), Peliculas),
    write(Stream, Peliculas),
    write(Stream, '.\n'),
    findall(serie(Nombre, Genero, ActorPrincipal, Director), serie(Nombre, Genero, ActorPrincipal, Director), Series),
    write(Stream, Series),
    write(Stream, '.\n'),
    findall(cancion(Nombre, Genero, Cantante, Productor), cancion(Nombre, Genero, Cantante, Productor), Canciones),
    write(Stream, Canciones),
    write(Stream, '.\n'),
    findall(usuario(NombreUsuario,AfinidadPeliculas,AfinidadSeries,AfinidadCanciones), usuario(NombreUsuario,AfinidadPeliculas,AfinidadSeries,AfinidadCanciones), Usuarios),
    write(Stream, Usuarios),
    write(Stream, '.\n'),
    findall(reproduccion(NombreUsuario,TipoProduccion ,NombreTitulo ,Calificacion), reproduccion(NombreUsuario,TipoProduccion ,NombreTitulo ,Calificacion), Reproducciones),
    write(Stream, Reproducciones),
    write(Stream,'.\n'),
    close(Stream).

cargar_datos :-
    open('E:\\Sergio\\Proyecto3Lenguajes\\datos.txt', read, Stream),
    read(Stream, Peliculas),
    agregar_peliculas(Peliculas),
    read(Stream, Series),
    agregar_series(Series),
    read(Stream, Canciones),
    agregar_canciones(Canciones),
    read(Stream, Usuarios),
    agregar_usuarios(Usuarios),
    read(Stream, Reproducciones),
    agregar_reproducciones(Reproducciones),
    close(Stream),
    borrar_datos.

borrar_datos :-
    open('E:\\Sergio\\Proyecto3Lenguajes\\datos.txt', write, Stream),
    write(Stream, '[].\n'),
    write(Stream, '[].\n'),
    write(Stream, '[].\n'),
    write(Stream, '[].\n'),
    write(Stream, '[].\n'),
    close(Stream).

agregar_peliculas([]).
agregar_peliculas([pelicula(Nombre, Genero, ActorPrincipal, Director)|T]) :-
    (pelicula(Nombre, Genero, ActorPrincipal, Director) ->
        true
    ;
        assertz(pelicula(Nombre, Genero, ActorPrincipal, Director))
    ),
    agregar_peliculas(T).

agregar_series([]).
agregar_series([serie(Nombre, Genero, ActorPrincipal, Director)|T]) :-
    (serie(Nombre, Genero, ActorPrincipal, Director) ->
        true
    ;
        assertz(serie(Nombre, Genero, ActorPrincipal, Director))
    ),
    agregar_series(T).

agregar_canciones([]).
agregar_canciones([cancion(Nombre, Genero,Cantante ,Productor)|T]) :-
    (cancion(Nombre, Genero,Cantante ,Productor) ->
        true
    ;
        assertz(cancion(Nombre, Genero,Cantante ,Productor))
    ),
    agregar_canciones(T).

agregar_usuarios([]).
agregar_usuarios([usuario(NombreUsuario,AfinidadPeliculas,AfinidadSeries,AfinidadCanciones)|T]) :-
    (usuario(NombreUsuario,AfinidadPeliculas,AfinidadSeries,AfinidadCanciones) ->
        true
    ;
        assertz(usuario(NombreUsuario,AfinidadPeliculas,AfinidadSeries,AfinidadCanciones))
    ),
    agregar_usuarios(T).

agregar_reproducciones([]).
agregar_reproducciones([reproduccion(NombreUsuario,TipoProduccion ,NombreTitulo ,Calificacion)|T]) :-
    (reproduccion(NombreUsuario,TipoProduccion ,NombreTitulo ,Calificacion) ->
        true
    ;
        assertz(reproduccion(NombreUsuario,TipoProduccion ,NombreTitulo ,Calificacion))
    ),
    agregar_reproducciones(T).


iniciar_programa :-
    cargar_datos,
    menu_principal.
