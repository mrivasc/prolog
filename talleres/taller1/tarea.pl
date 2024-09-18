% Sistema de gestión de actividades para un evento

%* Hechos
actividad(baile).
actividad(canto).
actividad(fotografia).
actividad(pinta_caritas).
actividad(medir_panza).
actividad(juegos).

pertenece(baile, boda).
pertenece(canto, boda).
pertenece(fotografia, cumpleanos).
pertenece(juegos, cumpleanos).
pertenece(pinta_caritas, baby_shower).
pertenece(medir_panza, baby_shower).

prefiere(pepito, cumpleanos).
prefiere(juan, boda).
prefiere(maria, baby_shower).

asistido(pepito, fotografia).
asistido(juan, canto).

%* Regla
% recomendar_actividad/2
recomendar_actividad(Persona, Actividad) :- 
    prefiere(Persona, Evento),
    pertenece(Actividad, Evento),
    not(asistido(Persona, Actividad)).