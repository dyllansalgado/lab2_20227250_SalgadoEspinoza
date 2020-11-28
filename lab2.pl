%Laboratorio numero 2 en Prolog Paradigmas de Programacion-
%Autor: Dyllan Salgado 
%Rut: 20227250-9
%Fecha de inicio: 25-11-2020

%el stack seria = [[[user1,pass01,100],[user2,pass02,100]],[[pregunta1],[pregunta2]],[[respuesta1],[respuesta2]],[usuaerioactivo]]
%[[usuarios],[preguntas],[respuestas],[activos]]

%TDA STACK
%crearStack([dasd],[dasda],[dsadas],[dasda],S).
%Es una lista de lista.
crearStack(Usuarios, Preguntas,Respuestas,UsuarioLogeado,Salida):-
    is_list(Usuarios),
    is_list(Preguntas),
    is_list(Respuestas),
    is_list(UsuarioLogeado),
    Salida=[Usuarios,Preguntas,Respuestas,UsuarioLogeado].


%el stack seria = [[[user1,pass01,100],[user2,pass02,100]],[[pregunta1],[pregunta2]],[[respuesta1],[respuesta2]],[usuaerioactivo]]
%[[usuarios],[preguntas],[respuestas],[activos]]

%TDA Stack 

% El stack tendra 4 listas, la primera sera la lista con los usuarios registrados, la 2da sera la lista con las preguntas, la 3ra sera la lista con respuestas y la ultima sera una lista con los datos del usuario activo.
% [ [Usuarios] , [Preguntas] , [Respuestas] , [Activo] .

% Constructor, se crea el stack en base a un parametro.
pertenenciaStack( Stack ):-
    obtenerUsuarioS( Stack , UsuarioS ) , pertenenciaUsuarios( UsuarioS ) ,
    obtenerPreguntaS( Stack , PreguntaS ) , pertenenciaPreguntas( PreguntaS ) ,
	obtenerRespuestas( Stack , RespuestaS ) , pertenenciaRespuestas( RespuestaS ) ,
	obtenerUsuarioSActivo( Stack , UsuarioSActivos ) , pertenenciaUsuarioActivo( UsuarioSActivos ).


crearStack( StackSalida ):-
	StackSalida = [ [] , [] , [] , [] ].


%Selectores

% Entrada: El elemento que se quiere obtener. 
% Salida: El elemento. 
% Descripcion: Cada selector, obtiene un elemento de la representacion. 

%Selectores Usuario


%obtiene todos los usuarios de la lista.
obtenerUsuarioS( [ UsuarioS | _ ] , UsuarioS ).

%obtiene nombre de usuario.
obtenerUsuario( [ [ Usuario , _ , _ ] , _ , _ , _ ] , Usuario ).

%obtiene contraseña de usuario.
obtenerPassUsuario( [ [ _ , Password , _ ] , _ , _ , _ ] , Password ).

%obtiene reputacion de usuario
obtenerReputacionUsuario([ [ _ , _ , Reputacion ], _ , _ , _ ] , Reputacion ).



%Selectores Preguntas

%[id , "fecha","pregunta1","[etiquetas]","autor", respondida? 1 para si 0 para no]

%obtiene todas las preguntas de la lista stack
obtenerPreguntaS( [ _ , Preguntas , _ , _ ] , Preguntas).

%obtiene el ID de la pregunta.
obtenerIDPreguntaS( [ _ , [ ID , _ , _ , _ , _ , _ ] , _ , _ ] , ID ).

%obtiene la fecha de la pregunta.
obtenerFechaPreguntaS( [ _ , [ _ , Fecha , _ , _ , _ , _ ] , _ , _ ] , Fecha ).

%obtiene el contenido de la pregunta.
obtenerContenidoPreguntaS( [ _ , [ _ , _ , Contenido , _ , _ , _ ] , _ , _ ] , Contenido ).

%obtiene las etiquetas de la pregunta.
obtenerEtiquetasPreguntaS( [ _ , [ _ , _ , _ , [ Etiqueta ] , _ , _ ] , _ , _ ] , Etiqueta ).

%obtiene  al autor de la pregunta.
obtenerAutorPreguntaS( [ _ , [ _ , _ , _ , _ , Autor , _ ] , _ , _ ] , Autor ).

%obtiene si la pregunta esta respondida.
obtenerRespondidaPreguntaS( [ _ , [ _ , _ , _ , _ , _ , Respondida ] , _ , _ ] , Respondida ).


%Selectores Respuestas

%[idpregunta, "fecha respuestas", idrespuesta ,"respuesta" ,"[etiquetas]","autor"]

%obtiene el ID de la pregunta asociada.
obtenerID1RespuestaS( [ _ , _ , [ IDPreg , _ , _ , _ , _ , _ ] , _ ] , IDPreg ).

%obtiene la fecha de la respuesta.
obtenerFechaRespuestaS( [ _ , _ , [ _ , FechaResp , _ , _ , _ , _ ] , _ ] , FechaResp ).

%obtiene el ID de la respuesta.
obtenerID2RespuestaS( [ _ , _ , [ _ , _ , IDResp , _ , _ , _ ] , _ ] , IDResp ).

%obtiene las contenido de la respuesta.
obtenerContenidoRespuestaS( [ _ , _ , _ , _ , [ _ , _ , _ , ContenidoResp , _ , _ ] , _ ] , ContenidoResp ).

%obtiene las etiquetas de la respuesta
obtenerEtiquetasRespuestaS( [ _ , _ , _ , _ , [ _ , _ , _ , _ , EtiquetasResp , _ ] , _ ] , EtiquetasResp ).

%obtiene  al autor de la respueta.
obtenerAutorRespuestaS( [ _ , _ , [ _ , _ , _ , _ , _ , AutorResp ] , _ ] , AutorResp ).


%Selectores Usuario Activo
%obtiene nombre de usuario activo.
obtenerUsuarioActivo( [ _ , _ , _ , [ Usuario , _ ] ] , Usuario ).

%obtiene contraseña de usuario.
obtenerPassActivo( [ _ , _ , _ , [ _ , Password ] ] , Password ).


%Pertenencia Stack 

pertenenciaStack( Stack ):-
	obtener.

%Pertenencia Usuarios


pertenenciaUsuarios( [] ).
pertenenciaUsuarios( [ Cabeza | Cola]  ):-
	isList( Cabeza ) , 
  	obtenerUsuario( Cabeza , nombreUsuario ) , string( nombreUsuario ) ,
	  obtenerPassUsuario( Cabeza , passUsuario ) , string( passUsuario ) ,
	  obtenerReputacionUsuario( Cabeza , reputacionUsuario ) , string( reputacionUsuario ) , pertenenciaUsuarios( Cola ).
    
	  

%Pertenencia Preguntas 


pertenenciaPreguntas( [] ).
pertenenciaPreguntas( [ Cabeza | Cola ] ):-
	isList( Cabeza ) ,
	obtenerIDPreguntaS( Cabeza , IDPreguntas ) , number( IDPreguntas ) ,
	obtenerFechaPreguntaS( Cabeza , FechaPreguntas ) , string( FechaPreguntas ) ,
	obtenerContenidosPreguntaS( Cabeza , ContenidoPreguntas ) , string( ContenidoPreguntas ) ,
	obtenerEtiquetasPreguntaS( Cabeza , Etiquetas ) , isList( Etiquetas ) ,
	obtenerAutorPreguntaS( Cabeza , AutorPregunta ) , string( AutorPregunta ) ,
	obtenerRespondidaPreguntaS( Cabeza , RespondidaPreguntas ) , number( RespondidaPreguntas ) , pertenenciaPreguntas( Cola ).


%Pertenencia Respuestas         


pertenenciaRespuestas( [] ).
pertenenciaRespuestas( [ Cabeza | Cola ] ):-
	isList( Cabeza ) ,
	obtenerID1RespuestaS( Cabeza , ID1Respuestas ) , number( ID1Respuestas ) ,
	obtenerFechaRespuestaS( Cabeza , FechaRespuestas ) , string( FechaRespuestas ) ,
	obtenerID2RespuestaS( Cabeza , ID2Respuestas ) , number( ID2Respuestas ) ,
	obtenerContenidoRespuestaS( Cabeza , ContenidoRepuesta ) , string( ContenidoRepuesta ) ,
	obtenerEtiquetasRespuestaS( Cabeza , EtiquetasRepuestas ) , isList( EtiquetasRepuestas ) ,
	obtenerAutorRespuestaS( Cabeza , AutorRespuesta ) , string( AutorRespuesta ) , pertenenciaRespuestas( Cola ).



%Pertenencia Usuario Activo          


pertenenciaUsuarioActivo( [] ).
pertenenciaUsuarioActivo( [ Cabeza | Cola]  ):-
  	string( Cabeza ) , pertenenciaUsuarioActivo( Cola ).


%FUNCIONES              

%StackRegister
stackRegister( Stack , NombreUsuario , PassUsuario , Stack2 ):-
	



















































%Pertenencias

usuario("pedro","1234").

agregarArticulo(L,Articulo,[Articulo,L]).


%selectores.
stackGetUsuarios([Usuarios,Preguntas,Etiquetas],Usuarios).


agregarUsuario(Usuario,ListaEntrada,ListaSalida):-
    nth0(0,ListaEntrada,UsuariosAntiguos),
    Lista

