pelicula(rapunzel, animacion).
pelicula(frozen, animacion).
pelicula(avatar, ciencia_ficcion).
pelicula(terminator, ciencia_ficcion).
pelicula(titanic, romance).
pelicula(romeo_y_julieta, romance).
pelicula(rocky, deporte).
pelicula(creed, deporte).
pelicula(gladiador, accion).

gusta(marroquin, animacion).
gusta(marroquin, ciencia_ficcion).
gusta(michelle, romance).
gusta(michelle, deporte).

visto(marroquin, rapunzel).
visto(michelle, titanic).

%* Regla
% recomendar_pelicula/2
recomendar_pelicula(Usuario, Pelicula) :-
    gusta(Usuario, Genero),
    pelicula(Pelicula, Genero),
    not(visto(Usuario, Pelicula)).