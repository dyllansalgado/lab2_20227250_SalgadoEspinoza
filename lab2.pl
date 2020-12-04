
%TDA Stack
%El stack tendra 4 listas, la primera sera la lista con los usuarios registrados, la 2da sera la lista con las preguntas, la 3ra sera la lista con respuestas y la ultima sera una lista con los datos del usuario activo.
%[ [Usuarios] , [Preguntas] , [Respuestas] , [Activo] .

%Constructor
% Entrada: Ninguna entrada %
% Salida: La representacion del stack. %
% Descripcion: Crea la representacion del stack, usando listas vacias %
crearStack( StackSalida ):-StackSalida = [ [] , [] , [] , [] ].

%Pertenencia
% Entrada: El elemento que se quiere obtener. 
% Salida: Ver si pertenece a ese tipo de dato o estructura.
% Descripcion: Cada pertenencia comprueba que se entregue el dato de su tipo.

%Pertenencia Stack
pertenenciaStack( Stack ):-
	obtenerUsuarioS( Stack , UsuarioS ) , pertenenciaUsuarios( UsuarioS ) ,
	obtenerPreguntaS( Stack , PreguntaS ) , pertenenciaPreguntas( PreguntaS ) ,
	obtenerRespuestaS( Stack , RespuestaS ) , pertenenciaRespuestas( RespuestaS ) ,
	obtenerActivo( Stack , UsuarioActivo ) , pertenenciaUsuarioActivo( UsuarioActivo ).


%Pertenencia Usuario
pertenenciaUsuarios( [] ).
pertenenciaUsuarios( [ Cabeza | Cola] ):-is_list( Cabeza ) ,
	obtenerUsuario( Cabeza , NombreUsuario ) , string( NombreUsuario ) ,
	obtenerPassUsuario( Cabeza , PassUsuario ) , string( PassUsuario ) ,
	obtenerReputacionUsuario( Cabeza , ReputacionUsuario ) , number( ReputacionUsuario ) ,
	pertenenciaUsuarios( Cola ).
%Pertenencia Preguntas
pertenenciaPreguntas( [] ).
pertenenciaPreguntas( [ Cabeza | Cola ] ):-is_list( Cabeza ) ,
	obtenerIDPregunta( Cabeza , IDPreguntas ) , number( IDPreguntas ) ,
	obtenerFechaPregunta( Cabeza , FechaPreguntas ) , string( FechaPreguntas ) ,
	obtenerContenidoPregunta( Cabeza , ContenidoPreguntas ) , string( ContenidoPreguntas ) ,
	obtenerEtiquetasPregunta( Cabeza , Etiquetas ) , is_list( Etiquetas ) ,
	obtenerAutorPregunta( Cabeza , AutorPregunta ) , string( AutorPregunta ) ,
	obtenerRespondidaPregunta( Cabeza , RespondidaPreguntas ) , number( RespondidaPreguntas ) , pertenenciaPreguntas( Cola ).

%Pertenencia Respuestas
pertenenciaRespuestas( [] ).
pertenenciaRespuestas( [ Cabeza | Cola ] ):-is_list( Cabeza ) ,
	obtenerID1Respuesta( Cabeza , ID1Respuestas ) , number( ID1Respuestas ) ,
	obtenerFechaRespuesta( Cabeza , FechaRespuestas ) , string( FechaRespuestas ) ,
	obtenerID2Respuesta( Cabeza , ID2Respuestas ) , number( ID2Respuestas ) ,
	obtenerContenidoRespuesta( Cabeza , ContenidoRepuesta ) , string( ContenidoRepuesta ) ,
	obtenerEtiquetasRespuesta( Cabeza , EtiquetasRepuestas ) , is_list( EtiquetasRepuestas ) ,
	obtenerAutorRespuesta( Cabeza , AutorRespuesta ) , string( AutorRespuesta ) , pertenenciaRespuestas( Cola ).

%Pertenencia Usuario Activo
pertenenciaUsuarioActivo( [] ).
pertenenciaUsuarioActivo( [ Cabeza | Cola]  ):-string( Cabeza ) , pertenenciaUsuarioActivo( Cola ).

%Selectores
% Entrada: El elemento que se quiere obtener. %
% Salida: El elemento. %
% Descripcion: Cada selector, obtiene un elemento de la representacion. %

%Selectores Stack

%obtiene todos los usuarios de la lista stack.
obtenerUsuarioS( [ UsuarioS | _ ] , UsuarioS ).
%obtiene todas las preguntas de la lista stack
obtenerPreguntaS( [ _ , Preguntas , _ , _ ] , Preguntas).
%obtiene todas las respuestas de la lista stack
obtenerRespuestaS( [ _ , _ , Respuestas , _ ] , Respuestas ).
%obtiene el usuario activo de la lista stack
obtenerActivo( [ _ , _ , _ , Activo ] , Activo ).

%Selectores Usuario

%obtiene nombre de usuario.
obtenerUsuario( [ NombreUsuario , _ , _ ] , NombreUsuario ).
%obtiene contraseña de usuario.
obtenerPassUsuario( [ _ , PassUsuario , _ ] , PassUsuario ).
%obtiene reputacion de usuario
obtenerReputacionUsuario( [ _ , _ , ReputacionUsuario ] , ReputacionUsuario ).

%Selectores Preguntas

%obtiene el ID de la pregunta.
obtenerIDPregunta( [ ID , _ , _ , _ , _ , _ ] , ID ).
%obtiene la fecha de la pregunta.
obtenerFechaPregunta( [ _ , Fecha , _ , _ , _ , _ ] , Fecha ).
%obtiene el contenido de la pregunta.
obtenerContenidoPregunta( [ _ , _ , Contenido , _ , _ , _ ] , Contenido ).
%obtiene las etiquetas de la pregunta.
obtenerEtiquetasPregunta( [ _ , _ , _ , Etiqueta , _ , _ ] , Etiqueta ).
%obtiene  al autor de la pregunta.
obtenerAutorPregunta( [ _ , _ , _ , _ , Autor , _ ] , Autor ).
%obtiene si la pregunta esta respondida.
obtenerRespondidaPregunta( [ _ , _ , _ , _ , _ , Respondida ] , Respondida ).

%Selectores Respuestas

%obtiene el ID de la pregunta asociada.
obtenerID1Respuesta( [ IDPreg , _ , _ , _ , _ , _ ] , IDPreg ).
%obtiene la fecha de la respuesta.
obtenerFechaRespuesta( [ _ , FechaResp , _ , _ , _ , _ ] , FechaResp ).
%obtiene el ID de la respuesta.
obtenerID2Respuesta( [ _ , _ , IDResp , _ , _ , _ ] , IDResp ).
%obtiene las contenido de la respuesta.
obtenerContenidoRespuesta( [ _ , _ , _ , ContenidoResp , _ , _ ] , ContenidoResp ).
%obtiene las etiquetas de la respuesta
obtenerEtiquetasRespuesta( [ _ , _ , _ , _ , EtiquetasResp , _ ] , EtiquetasResp ).
%obtiene  al autor de la respueta.
obtenerAutorRespuesta( [ _ , _ , _ , _ , _ , AutorResp ] , AutorResp ).

%Selectores Usuario Activo  

%obtiene nombre de usuario activo.
obtenerNombreActivo( [ Usuario , _ ] , Usuario ).
%obtiene contraseña de usuario.
obtenerPassActivo( [ _ , Password ] , Password ).

%FUNCIONES SOBRE LA REPRESENTACION

%existeUsuario
% Entrada:
% Salida:
% Descripcion:
existeUsuario( [] , _ , Existe ):-Existe = 1.
existeUsuario( [ Cabeza | _ ] , NombreUsuario , Existe ):-obtenerUsuario( Cabeza , NombreUsuarioStack ),NombreUsuarioStack == NombreUsuario,Existe = 0.
existeUsuario( [ Cabeza | Cola ] , NombreUsuario , Existe ):-obtenerUsuario( Cabeza , NombreUsuarioStack ),not( NombreUsuarioStack == NombreUsuario ),
	existeUsuario( Cola , NombreUsuario , Existe ).

%existePreguntaRespuesta
% Entrada:
% Salida:
% Descripcion:
existePreguntaRespuesta( [] , _ , Existe ):-Existe = 1.
existePreguntaRespuesta( [ Cabeza | _ ] , IDPreguntaRespuesta , Existe ):-obtenerIDPregunta( Cabeza , IDPreguntaStack ),IDPreguntaRespuesta == IDPreguntaStack,Existe = 0.
existePreguntaRespuesta( [ Cabeza | Cola ] , IDPreguntaRespuesta , Existe ):-obtenerIDPregunta( Cabeza , IDPreguntaStack ),
    not( IDPreguntaRespuesta == IDPreguntaStack ),
	existePreguntaRespuesta( Cola , IDPreguntaRespuesta , Existe ).

%contarPreguntasRespuestas
% Entrada:
% Salida:
% Descripcion:
contarPreguntasRespuestas( [ _ | Cola ] , Cantidad , Salida ):-CantidadAux is ( Cantidad + 1),contarPreguntasRespuestas( Cola , CantidadAux , Salida ).
contarPreguntasRespuestas( [ ] , Cantidad , Salida ):-Salida = Cantidad.

%sacarUsuario
% Entrada:
% Salida:
% Descripcion:
sacarUsuario( [] , _ , Usuario ):-Usuario = 1.	
sacarUsuario( [ Cabeza | _ ] , NombreUsuario , Usuario ):-obtenerUsuario( Cabeza , NombreUsuarioStack ),NombreUsuarioStack == NombreUsuario,Usuario = Cabeza.
sacarUsuario( [ Cabeza | Cola ] , NombreUsuario , Usuario ):-obtenerUsuario( Cabeza , NombreUsuarioStack ),not( NombreUsuarioStack == NombreUsuario ),
	sacarUsuario( Cola , NombreUsuario , Usuario ).

%sacarPass
% Entrada:
% Salida:
% Descripcion:
sacarPass( [] , _ , Pass ):- Pass = 1.
sacarPass( [ Cabeza | _ ] , NombreUsuario , Pass ):-
	obtenerUsuario( Cabeza , NombreUsuarioStack ),
	NombreUsuarioStack == NombreUsuario,
	obtenerPassUsuario( Cabeza , PassUsuario ),
	Pass = PassUsuario.
sacarPass( [ Cabeza | Cola ] , NombreUsuario , Pass ):-
	obtenerUsuario( Cabeza , NombreUsuarioStack ),
	not( NombreUsuarioStack == NombreUsuario ),
	sacarPass( Cola , NombreUsuario , Pass ).

%sacarPregunta
% Entrada:
% Salida:
% Descripcion:
sacarPregunta( [] , _ , Pregunta ):-Pregunta = 1.
sacarPregunta( [ Cabeza | _ ] , IDPregunta , Pregunta ):-
	obtenerIDPregunta( Cabeza , IDPreguntaStack ),
	IDPregunta == IDPreguntaStack,
	Pregunta = Cabeza.
sacarPregunta( [ Cabeza | Cola ] , IDPregunta , Pregunta ):-
	obtenerIDPregunta( Cabeza , IDPreguntaStack ),
	not( IDPregunta == IDPreguntaStack ),
	sacarPregunta( Cola , IDPregunta , Pregunta ).

%sacarRespuesta
% Entrada:
% Salida:
% Descripcion:
sacarRespuesta( [] , _ , Pregunta ):-Pregunta = 1.
sacarRespuesta( [ Cabeza | _ ] , IDRespuesta , Respuesta ):-
	obtenerID2Respuesta( Cabeza , IDRespuestaStack ),
	IDRespuesta == IDRespuestaStack,
	Respuesta = Cabeza.
sacarRespuesta( [ Cabeza | Cola ] , IDRespuesta , Pregunta ):-
	obtenerID2Respuesta( Cabeza , IDRespuestaStack ),
	not( IDRespuesta == IDRespuestaStack ),
	sacarRespuesta( Cola , IDRespuesta , Pregunta ).

%PreguntasNuevas
% Entrada:
% Salida:
% Descripcion:
preguntaNueva( [] , _ , _ , Lista , Salida ):-Salida = Lista.	
preguntaNueva( [ Cabeza | Cola ] , IdPregunta , Pregunta , Lista , Salida ):-
	obtenerIDPregunta( Cabeza , IdPreguntaAux ),
	IdPreguntaAux == IdPregunta,
	append( [Pregunta] , Lista , ListaConPregunta ),
	preguntaNueva( Cola , IdPregunta , Pregunta , ListaConPregunta , Salida ).
preguntaNueva( [ Cabeza | Cola ] , IdPregunta , Pregunta , Lista , Salida ):-
	obtenerIDPregunta( Cabeza , IdPreguntaAux ),
	not( IdPreguntaAux == IdPregunta ),
	append( [Cabeza] , Lista , ListaConPregunta ),
	preguntaNueva( Cola , IdPregunta , Pregunta , ListaConPregunta , Salida).

%usuariosNuevo
% Entrada:
% Salida:
% Descripcion:
usuariosNuevo( [ ] , _ , _ , Lista , Salida ):-Salida = Lista.
usuariosNuevo( [ Cabeza | Cola ] , NombreUsuario , UsuarioNuevo , Lista , Salida ):-
	obtenerUsuario( Cabeza , NombreUsuarioAux ),
	NombreUsuarioAux == NombreUsuario,
	append( [UsuarioNuevo] , Lista , ListaConUsuario ),
	usuariosNuevo( Cola , NombreUsuario , UsuarioNuevo , ListaConUsuario , Salida ).	
usuariosNuevo( [ Cabeza | Cola ] , NombreUsuario , UsuarioNuevo , Lista , Salida ):-
	obtenerUsuario( Cabeza , NombreUsuarioAux ),
	not( NombreUsuarioAux == NombreUsuario ),
	append( [Cabeza] , Lista , ListaConUsuario ),
	usuariosNuevo( Cola , NombreUsuario , UsuarioNuevo , ListaConUsuario , Salida ).

%agregaUsuarios
	% Entrada:
	% Salida:
	% Descripcion:
agregaUsuarios( Lista , [] , Salida ):-Salida = Lista.
agregaUsuarios( Lista , [ Cabeza | Cola ] , Salida ):-
	append( Lista , ["\nNombre: "] , Salida1 ) , obtenerUsuario( Cabeza , NombreUsuario ), append( Salida1 , [ NombreUsuario ] , Salida2 ),
	append( Salida2 , [".     Pass: "] , Salida3 ) , obtenerPassUsuario( Cabeza , PassUsuario ) , append( Salida3 , [ PassUsuario ] , Salida4 ),
	append( Salida4 , [".     Reputacion: "] , Salida5 ) , obtenerReputacionUsuario( Cabeza , ReputacionUsuario ) , append( Salida5 , [ReputacionUsuario] , Salida6 ),
	agregaUsuarios( Salida6 , Cola , Salida ).

%agregaPreguntas
% Entrada:
% Salida:
% Descripcion:
agregaPreguntas( Lista , [] , Salida ):-Salida = Lista.
agregaPreguntas( Lista , [ Cabeza | Cola ] , Salida ):-
	append( Lista ,   ["ID Pregunta: "] , Salida1 ) , obtenerIDPregunta( Cabeza , IDPregunta ) , append( Salida1 , [IDPregunta] , Salida2 ),
	append( Salida2 , ["     Fecha: "] , Salida3 ) , obtenerFechaPregunta( Cabeza , FechaPregunta ) , append( Salida3 , [FechaPregunta] , Salida4 ),
	append( Salida4 , ["     Contenido: "] , Salida5 ) , obtenerContenidoPregunta( Cabeza , ContenidoPregunta ) , append( Salida5 , [ContenidoPregunta] , Salida6 ),
	append( Salida6 , ["     Etiquetas: "] , Salida7 ) , obtenerEtiquetasPregunta( Cabeza , EtiquetaPregunta ) , append( Salida7 , [EtiquetaPregunta] , Salida8 ),
	append( Salida8 , ["     Autor: "] , Salida9 ) , obtenerAutorPregunta( Cabeza , AutorPregunta ) , append( Salida9 , [AutorPregunta] , Salida10 ),
	append( Salida10 ,["     Respondida?: "] , Salida11 ) ,obtenerRespondidaPregunta( Cabeza , Respondida ) , Respondida == 0 , append( Salida11 , ["Si"] , Salida12 ), append( Salida12 , ['\n'] , Salida13 ),
	agregaPreguntas( Salida13 , Cola , Salida ).
agregaPreguntas( Lista , [ Cabeza | Cola ] , Salida ):-
	append( Lista ,   ["ID Pregunta: "] , Salida1 ) , obtenerIDPregunta( Cabeza , IDPregunta ) , append( Salida1 , [IDPregunta] , Salida2 ),
	append( Salida2 , ["     Fecha: "] , Salida3 ) , obtenerFechaPregunta( Cabeza , FechaPregunta ) , append( Salida3 , [FechaPregunta] , Salida4 ),
	append( Salida4 , ["     Contenido: "] , Salida5 ) , obtenerContenidoPregunta( Cabeza , ContenidoPregunta ) , append( Salida5 , [ContenidoPregunta] , Salida6 ),
	append( Salida6 , ["     Etiquetas: "] , Salida7 ) , obtenerEtiquetasPregunta( Cabeza , EtiquetaPregunta ) , append( Salida7 , [EtiquetaPregunta] , Salida8 ),
	append( Salida8 , ["     Autor: "] , Salida9 ) , obtenerAutorPregunta( Cabeza , AutorPregunta ) , append( Salida9 , [AutorPregunta] , Salida10 ),
	append( Salida10 ,["     Respondida?: "] , Salida11 ) ,obtenerRespondidaPregunta( Cabeza , Respondida ) , Respondida == 1 , append( Salida11 , ["No"] , Salida12 ), append( Salida12 , ['\n'] , Salida13 ),
	agregaPreguntas( Salida13 , Cola , Salida ).
			
%agregaRespuestas
% Entrada:
% Salida:
% Descripcion:
agregaRespuestas( Lista , [] , Salida ):-Salida = Lista.
agregaRespuestas( Lista , [ Cabeza | Cola ] , Salida ):-
	append( Lista , ["ID Pregunta Asociada: "] , Salida1 ) , obtenerID1Respuesta( Cabeza , IDPregunta ) , append( Salida1 , [IDPregunta] , Salida2 ) ,
	append( Salida2 , ["     Fecha: "] , Salida3 ) , obtenerFechaRespuesta( Cabeza , FechaRespuesta) , append( Salida3 , [FechaRespuesta] , Salida4 ) ,
	append( Salida4 , ["     ID Respuesta: "] , Salida5 ) , obtenerID2Respuesta( Cabeza , IDRespuesta ) , append( Salida5 , [IDRespuesta] , Salida6 ), 
	append( Salida6 , ["     Contenido: "] , Salida7 ) , obtenerContenidoRespuesta( Cabeza , ContenidoRespuesta ) , append( Salida7 , [ContenidoRespuesta] , Salida8 ),
	append( Salida8 , ["     Etiqueta: "] , Salida9 ) , obtenerEtiquetasRespuesta( Cabeza , EtiqietaRespuesta ) , append( Salida9 , [EtiqietaRespuesta] , Salida10 ),
	append( Salida10 , ["     Autor: "] , Salida11 ) , obtenerAutorRespuesta( Cabeza , AutorRespuesta ) , append( Salida11 , [AutorRespuesta] , Salida12 ), append( Salida12 , ['\n'] , Salida13 ),
	agregaRespuestas( Salida13 , Cola , Salida ).

%agregaUsuariosActivo
% Entrada:
% Salida:
% Descripcion:
agregaUsuariosActivo( Lista , Usuario , Salida ):-
	append( Lista , ["Nombre: "] , Salida1 ) , obtenerNombreActivo( Usuario , NombreUsuarioActivo ) , append( Salida1 , [NombreUsuarioActivo] , Salida2 ),
	append( Salida2 , ["Pass: "] , Salida3 ) , obtenerPassActivo( Usuario , PassUsuarioActivo ) , append( Salida3 , [PassUsuarioActivo] , Salida4 ),
	Salida = Salida4.

%filtroPreguntas
% Entrada:
% Salida:
% Descripcion:
filtroPreguntas( [] , _ , Lista , Salida ):-Salida = Lista.
filtroPreguntas( [ Cabeza | Cola ] , NombreUsuario , Lista , Salida ):-obtenerAutorPregunta( Cabeza , Nombre ) ,Nombre == NombreUsuario,
	append( [Cabeza] , Lista , ListaConPreguntadasFiltradas ),
	filtroPreguntas( Cola , NombreUsuario , ListaConPreguntadasFiltradas , Salida ).
filtroPreguntas( [ Cabeza | Cola ] , NombreUsuario , Lista , Salida ):-obtenerAutorPregunta( Cabeza , Nombre ) ,not( Nombre == NombreUsuario ),
	filtroPreguntas( Cola , NombreUsuario , Lista , Salida ).

%formatoListas
% Entrada:
% Salida:
% Descripcion:
formatoListas( Lista , [] , Salida ):-Salida = Lista.
formatoListas( Lista , [ Cabeza | Cola ] , Salida ):-is_list( Cabeza ),
	append( Lista , '[' , Salida1 ) , atomics_to_string( Cabeza , ListaStr ) , append( Salida1 , [ListaStr] , Salida2 ) , append( Salida2 , ']' , Salida3 ),
	formatoListas( Salida3 , Cola , Salida ).
formatoListas( Lista , [ Cabeza | Cola ] , Salida ):-not( is_list( Cabeza ) ),append( Lista , Cabeza , Salida1 ) ,
	formatoListas( Salida1 , Cola , Salida ).
		
%FUNCIONES
%stackRegister
% Entrada:
% Salida:
%Descripcion:
stackRegister( Stack , NombreUsuario , PassUsuario , Stack2 ):-
	string( NombreUsuario ) , string( PassUsuario ),
	obtenerUsuarioS( Stack , UsuarioS ),
	existeUsuario( UsuarioS , NombreUsuario , Existe ),
	Existe == 0,
	Stack2 = Stack.
stackRegister( Stack , NombreUsuario , PassUsuario , Stack2 ):-
	string( NombreUsuario ) , string( PassUsuario ),
	obtenerUsuarioS( Stack , UsuarioS ),
	existeUsuario( UsuarioS , NombreUsuario , Existe ),
	Existe == 1,
	obtenerPreguntaS( Stack , Preguntas ) , obtenerRespuestaS( Stack , Respuestas ) , obtenerActivo( Stack , UsuarioActivo ),
	append( UsuarioS , [ [ NombreUsuario , PassUsuario , 0 ] ], Usuarios2 ),
	Stack2 = [ Usuarios2 , Preguntas , Respuestas , UsuarioActivo ].


%Reglas

% Entrada: -
% Salida: -
% Descripcion: -
usuario([ "Dyllan" , "123" , 0 ]).
usuario([ "Ignacio" , "456" , 0 ]).
usuario([ "Salgado" , "789" , 0 ]).
usuario([ "Espinoza" , "abc" , 0 ]).
preguntas([ 1 , "lunes" , "holaquetal?" , [ "c" , "c++"] , "Dyllan" , 0 ]).
preguntas([ 2 , "martes" , "holaestasbien?" , [ "c++" , "c"] , "Dyllan" , 0 ]).
preguntas([ 3 , "miercoles" , "holaestasmal?" , [ "disney+" , "netflix"] , "Ignacio" , 0 ]).
preguntas([ 4 , "jueves" , "holaestastranquilo?" , [ "twitch" , "facebook"] , "Salgado" , 0 ]).
preguntas([ 5 , "viernes" , "holacomotellamas?" , [ "spotify" , "youtube"] , "Espinoza" , 0 ]).

respuestas([ [ 1 , "lunes" , 1 , "respuestaAdyllan1" , [ "tamal" , "malo"] , "Ignacio" ] ]).
respuestas([ [ 2 , "martes" , 1 , "respuestaAdyllan2" , [ "tabien" , "buenardo"] , "Espinoza" ] ]).
respuestas([ [ 3 , "miercoles" , 1 , "respuestaAdyllan3" , [ "hola" , "hola1"] , "Dyllan" ] ]).
respuestas([ [ 1 , "lunes" , 2 , "respuestaAdyllan1.1" , [ "hola2" , "hola3"] , "Salgado" ] ]).
respuestas([ [ 2 , "miercoles" , 2 , "respuestaAdyllan2.1" , [ "hola4" , "hola5"] , "Espinoza" ] ]).
respuestas([ [ 3 , "miercoles" , 2 , "respuestaAdyllan3.1" , [ "hola6" , "hola7"] , "Ignacio" ] ]).
respuestas([ [ 1 , "miercoles" , 3 , "respuestaAIgnacio" , [ "chao1" , "chao2"] , "Dyllan" ] ]).
respuestas([ [ 1 , "miercoles" , 4 , "respuestaASalgado" , [ "chao3" , "chao4"] , "Ignacio" ] ]).
respuestas([ [ 1 , "miercoles" , 5 , "respuestaAEspinoza1" , [ "chao5" , "chao6"] , "Dyllan" ] ]).
respuestas([ [ 2 , "miercoles" , 5 , "respuestaAEspinoza2" , [ "chao7" , "chao8"] , "Salgado" ] ]).


















































%Pertenencias

usuario("pedro","1234").

agregarArticulo(L,Articulo,[Articulo,L]).


%selectores.
/*stackGetUsuarios([Usuarios,Preguntas,Etiquetas],Usuarios).*/


/*agregarUsuario(Usuario,ListaEntrada,ListaSalida):-
    nth0(0,ListaEntrada,UsuariosAntiguos),
    Lista*/

