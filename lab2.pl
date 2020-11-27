%Laboratorio numero 2 en Prolog Paradigmas de Programacion-
%Autor: Dyllan Salgado 
%Rut: 20227250-9
%Fecha de inicio: 25-11-2020





%TDA STACK
%crearStack([dasd],[dasda],[dsadas],[dasda],S).
%Es una lista de lista.
crearStack(Usuarios, Preguntas,Respuestas,UsuarioLogeado,Salida):-
    is_list(Usuarios),
    is_list(Preguntas),
    is_list(Respuestas),
    is_list(UsuarioLogeado),
    Salida=[Usuarios,Preguntas,Respuestas,UsuarioLogeado].


%Pertenencias

usuario(pedro,1234).

agregarArticulo(L,Articulo,[Articulo,L]).


%selectores.
stackGetUsuarios([Usuarios,Preguntas,Etiquetas],Usuarios).


/*
crearLista(Usuarios, Preguntas,Respuestas,UsuarioLogeado,Salida):-
    is_list(Usuarios),
    is_list(Preguntas),
    is_list(Respuestas),
    is_list(UsuarioLogeado),
    Salida=[Usuarios,Preguntas,Respuestas,UsuarioLogeado].

usuario(["juanito","123"]).
usuario(["ana","234"]).
usuario(["pedro","345"]).

 * agregar elemento al final de una lista

agregarAlFinal([],E,[E]).
agregarAlFinal([Anterior|Cola],E,[Anterior|NuevaCola]):-
    agregarAlFinal(Cola,E,NuevaCola).

/* probando
agregarUsuario(Usuario,ListaEntrada,ListaSalida):-
    nth0(0,ListaEntrada,UsuariosAntiguos),
    Lista

*/
