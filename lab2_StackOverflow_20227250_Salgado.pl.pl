%Nombre : Dyllan Salgado -Fecha: 06-12-2020 -Nombre profesor :Victor Flores.

%Dominios
/*StackSalida=Representa nuestro stack.
 Cabeza=Representa a la cabeza de una lista.
 Cola=Representa la cola de una lista.
 NombreUsuario= Dato tipo string que representa el nombre de un usuario.
 PassUsuario= Dato tipo string que representa la pass de un usuario.
 ReputacionUsuario= Dato tipo number que representa el puntaje de reputacion de un usuario.
 IDPreguntas= Dato tipo number que se vincula con las preguntas realizadas.
 FechaPreguntas= Dato tipo string que representa la fecha que se realizo una pregunta.
 ContenidoPreguntas= Dato tipo string que representa lo que se ha preguntado.
 Etiquetas= Lista de string que representa a palabras claves de nuestra pregunta.
 AutorPregunta= Dato de tipo string que representa al autor de una pregunta.
 RespondidaPreguntas= Dato tipo number que representa si una pregutna a sido respondida.
 ID1Respuestas= Dato tipo number que representa al ID de una respuesta.
 FechaRespuestas= Dato tipo string que representa la fecha en que se creo una respuesta.
 ID2Respuestas= Dato tipo number que representa al ID de una respuesta
 ContenidoRepuesta= Dato tipo string que representa lo que se ha respondido.
 EtiquetasRepuestas= Lista de string que representa a palabras claves de nuestra respuesta.
 AutorRespuesta= dato tipo string es quien creo la respuesta.
 UsuarioS= lista de string con todos los usuarios registrados.
 PreguntaS= lista de string con todas las preguntas.
 Stack= Dato tipo lista que representa a nuestro stack.
 Preguntas= dato tipo lista que es una pregunta.
 Respuestas= dato tipo lista que es una respuesta.
 Activo= dato tipo lista que representa a un usuario activo.
 ID= dato tipo number que sirve para identificar respuestas o preguntas.
 Fecha= dato tipo string que representa la fecha.
 Contenido= dato tipo string que representa contenido de pregunta o respuesta.
 Autor= tipo string quien genera o responde una pregunta.
 Existe = dato de tipo booleano, es utilizado para ver si existe algo o no.
 IDPreguntaStack = tipo number, y es utilizado para buscar el id dentro del stack.
 IDRespuestaStack = tipo number y es utilizado para buscar el id dentro del stack.
 Cantidad= tipo number, se utiliza para guardar la cantidad de preguntas o respuestas.
*/
%Predicados:
/*
 %Metas Primarias.
 crearStack( StackSalida ). Aridad = 1.
 pertenenciaUsuarios( [] ). Aridad=1.
 pertenenciaPreguntas( [] ). Aridad=1.
 pertenenciaRespuestas( [] ). Aridad=1.
 pertenenciaUsuarioActivo( [] ). Aridad=1.
 perteneceAStack( Stack ). Aridad=1.
 obtenerUsuarioS( [ UsuarioS | _ ] , UsuarioS ). Aridad=2.
 obtenerPreguntaS( [ _ , Preguntas , _ , _ ] , Preguntas). Aridad=2.
 obtenerRespuestaS( [ _ , _ , Respuestas , _ ] , Respuestas ). Aridad=2.
 obtenerActivo( [ _ , _ , _ , Activo ] , Activo ). Aridad=2.
 obtenerIDPregunta( [ ID , _ , _ , _ , _ , _ ] , ID ). Aridad=2.
 obtenerFechaPregunta( [ _ , Fecha , _ , _ , _ , _ ] , Fecha ). Aridad=2.
 obtenerContenidoPregunta( [ _ , _ , Contenido , _ , _ , _ ] , Contenido ). Aridad=2.
 obtenerEtiquetasPregunta( [ _ , _ , _ , Etiqueta , _ , _ ] , Etiqueta ). Aridad=2.
 obtenerAutorPregunta( [ _ , _ , _ , _ , Autor , _ ] , Autor ). Aridad=2.
 obtenerRespondidaPregunta( [ _ , _ , _ , _ , _ , Respondida ] , Respondida ). Aridad=2.
 obtenerID1Respuesta( [ IDPreg , _ , _ , _ , _ , _ ] , IDPreg ).Aridad=2.
 obtenerFechaRespuesta( [ _ , FechaResp , _ , _ , _ , _ ] , FechaResp ).Aridad=2.
 obtenerID2Respuesta( [ _ , _ , IDResp , _ , _ , _ ] , IDResp ).Aridad=2.
 obtenerContenidoRespuesta( [ _ , _ , _ , ContenidoResp , _ , _ ] , ContenidoResp ).Aridad=2.
 obtenerEtiquetasRespuesta( [ _ , _ , _ , _ , EtiquetasResp , _ ] , EtiquetasResp ).Aridad=2.
 obtenerAutorRespuesta( [ _ , _ , _ , _ , _ , AutorResp ] , AutorResp ).Aridad=2.
 obtenerNombreActivo( [ Usuario , _ ] , Usuario ).Aridad=2.
 obtenerPassActivo( [ _ , Password ] , Password ).Aridad=2.
 existeUsuario( [] , _ , Existe). Aridad=3.
 existePregunta( [] , _ , Existe). Aridad=3.
 existeRespuesta( [] , _ , Existe ). Aridad=3.
 contarPreguntasRespuestas( [ _ | Cola ] , Cantidad , Salida ). Aridad=3.
 sacarUsuario( [] , NombreUsuario , Usuario ).Aridad=3.
 sacarPass( [] , NombreUsuario , Pass ).Aridad=3.
 sacarPregunta( [] , IDPregunta , Pregunta ).Aridad=3.
 sacarRespuesta( [] , IDRespuesta , Respuesta ).Aridad=3.
 preguntaNueva( [] , IdPregunta , Pregunta , Lista , Salida).Aridad=5.
 usuariosNuevo([] , NombreUsuario , UsuarioNuevo , Lista , Salida).Aridad=5.
 agregaUsuarios(Lista , [] , Salida).Aridad=3.
 agregaPreguntas(Lista , [] , Salida).Aridad=3.
 agregaRespuestas(Lista , [] , Salida).Aridad=3.
 agregaUsuariosActivo(Lista , Usuario , Salida).Aridad=3.
 filtroPreguntas([] , NombreUsuario , Lista , Salida).Aridad=4.
 formatoListas(Lista , [] , Salida). Aridad=3.
 listaString(String , [] , Salida). Aridad=3.

 %Metas secundarias.
 stackRegister(Stack , NombreUsuario , PassUsuario , Stack2). Aridad=4.
 stackLogin(Stack , NombreUsuario , PassUsuario , Stack2). Aridad=4.
 ask(Stack , Fecha , TextoPregunta , ListaEtiquetas , Stack2). Aridad=5.
 answer(Stack , Fecha , IdPregunta , TextoRespuesta , ListaEtiquetas , Stack2 ). Aridad=6.
 accept(Stack , IdPregunta , IdRespuesta , Stack2). Aridad=4.
 stackToString(Stack , StackStr). Aridad=2.
*/


%TDA Stack
% El stack tendra 4 listas, la primera sera la lista con los usuarios registrados, la 2da sera la lista con las preguntas, la 3ra sera la lista con respuestas y la ultima sera una lista con los datos del usuario activo.
% [ [Usuarios] , [Preguntas] , [Respuestas] , [Activo] .

%HECHOS

%Entrada: Un stack con 4 usuarios, 5 preguntas y 10 respuestas.
%Salida: El stack con el que se trabaja.
%Descripcion: Se crea un stack con usuarios, preguntas y respuestas.
stack1([ [ [ "Dyllan" , "123" , 0 ] , [ "Ignacio" , "456" , 0 ],[ "Salgado" , "789" , 0 ], [ "Espinoza" , "abc" , 0 ] ] , 
	[ [ 1 , "27-11-2020" , "holaquetal?" , [ "c" , "c++"] , "Dyllan" , 0 ] , [ 2 , "27-11-2020" , "holaestasbien?" , [ "c++" , "c"] , "Dyllan" , 0 ] , [ 3 , "28-11-2020" , "holaestasmal?" , [ "disney+" , "netflix"] , "Ignacio" , 0 ],
    [ 4 , "29-11-2020" , "holaestastranquilo?" , [ "twitch" , "facebook"] , "Salgado" , 0 ],[ 5 , "30-11-2020" , "holacomotellamas?" , [ "spotify" , "youtube"] , "Espinoza" , 0 ] ] , 
    [ [ 1 , "30-11-2020" , 1 , "respuestaAdyllan1" , [ "tamal" , "malo"] , "Ignacio" ], [ 1 , "30-11-2020" , 2 , "respuestaAdyllan2" , [ "tabien" , "buenardo"] , "Espinoza" ], [ 1 , "01-12-2020" , 3 , "respuestaAdyllan3" , [ "hola" , "hola1"] , "Espinoza" ],
    [ 1 , "01-12-2020" , 4 , "respuestaAdyllan1.1" , [ "hola2" , "hola3"] , "Salgado" ], [ 2 , "02-12-2020" , 5 , "respuestaAdyllan2.1" , [ "hola4" , "hola5"] , "Espinoza" ],
    [ 3 , "02-12-2020" , 6 , "respuestaAIgnacio" , [ "hola6" , "hola7"] , "Salgado" ],[ 3 , "02-12-2020" , 7 , "respuestaAIgnacio" , [ "chao1" , "chao2"] , "Dyllan" ],
    [ 4 , "03-12-2020" , 8 , "respuestaASalgado" , [ "chao3" , "chao4"] , "Ignacio" ],[ 5 , "03-12-2020" , 9 , "respuestaAEspinoza1" , [ "chao5" , "chao6"] , "Dyllan" ],[ 5 , "03-12-2020" , 10 , "respuestaAEspinoza2" , [ "chao7" , "chao8"] , "Salgado" ]],[]]).
%Entrada: Un stack con 2 usuarios, 3 preguntas y 1 respuesta.
%Salida: El stack con el que se trabaja.
%Descripcion: Se crea un stack con usuarios, preguntas y respuestas.
stack2([ [ [ "Dyllan" , "123" , 0 ] , [ "Salgado" , "456" , 0 ] ] , [ [ 1 , "29-11-2020" , "Pregunta1Dyll" , [ "Anime" , "Goku"] , "Dyllan" , 0 ] , [ 2 , "30-11-2020" , "pregunta2Salg" , [ "Garen" , "Yasuo"] , "Salgado" , 0 ] , [ 3 , "01-12-2020" , "pregunta3Dyll" , [ "Videos" , "Musica"] , "Dyllan" , 0 ] ] , [ [ 2 , "01-12-2020" , 1 , "RespondeDyllanASalgado" , [ "Anime" , "DragonBallZ"] , "Dyllan" ] ] , [] ]).


%REGLAS

%CONSTRUCTOR
% Entrada: Ninguna entrada.
% Salida: Representacion del stack utilizado
% Descripcion: Crea la representacion del stack, usando listas vacias.
% Ejemplo: crearStack(Stack1).
crearStack( StackSalida ):- StackSalida = [ [] , [] , [] , [] ].

%PERTENENCIA
%Pertenencia Usuario.
% Entrada: Se ingresa un usuario.
% Salida: boleano.
% Descripcion: Comprueba que sus elementos pertenezcan a los datos especificados.
% Ejemplo: pertenenciaUsuarios( [ [ "Dyllan" , "123" , 0 ] ] ).
% pertenenciaUsuarios( [ [ hola , "123" , h ] ] ).
pertenenciaUsuarios( [] ).
pertenenciaUsuarios( [ Cabeza | Cola] ):- is_list( Cabeza ) , obtenerUsuario( Cabeza , NombreUsuario ) , string( NombreUsuario ) ,
	obtenerPassUsuario( Cabeza , PassUsuario ) ,string( PassUsuario ) ,obtenerReputacionUsuario( Cabeza , ReputacionUsuario ) , number( ReputacionUsuario ) ,
	pertenenciaUsuarios( Cola ).
		
%Pertenencia Preguntas.
% Entrada: Se ingresan preguntas.
% Salida: boleano.
% Descripcion: Comprueba que sus elementos pertenezcan a los datos especificados.
% Ejemplo: pertenenciaPreguntas( [ [ 1 , "01-12-2020" , "Mi pregunta" , [ "Prolog" , "C#"] , "Dyllan" , 0 ] ] ).
% pertenenciaPreguntas( [ [ 1 , "01-12-2020" , "Mi pregunta" , [ "Prolog" , "C#"] , 123 , 0 ] ] ).
pertenenciaPreguntas( [] ).
pertenenciaPreguntas( [ Cabeza | Cola ] ):- is_list( Cabeza ) , obtenerIDPregunta( Cabeza , IDPreguntas ) , number( IDPreguntas ) ,
	obtenerFechaPregunta( Cabeza , FechaPreguntas ) , string( FechaPreguntas ) ,obtenerContenidoPregunta( Cabeza , ContenidoPreguntas ) , string( ContenidoPreguntas ) ,
	obtenerEtiquetasPregunta( Cabeza , Etiquetas ) , is_list( Etiquetas ) ,obtenerAutorPregunta( Cabeza , AutorPregunta ) , string( AutorPregunta ) ,
	obtenerRespondidaPregunta( Cabeza , RespondidaPreguntas ) , number( RespondidaPreguntas ) , pertenenciaPreguntas( Cola ).

%Pertenencia Respuestas.
% Entrada: Se ingresan respuestas.
% Salida: boleano.
% Descripcion: Comprueba que sus elementos pertenezcan a los datos especificados.
% Ejemplo: pertenenciaRespuestas( [ [ 1 , "01-12-2020" , 1 , "Mi respuesta" , [ "hola" , "holas"] , "Dyllan" ] ] ).
% pertenenciaRespuestas( [ [ 1 , "01-12-2020" , 1 , 123 , [ "hola" , "holas"] , "Dyllan" ] ] ).
pertenenciaRespuestas( [] ).
pertenenciaRespuestas( [ Cabeza | Cola ] ):-is_list( Cabeza ) ,obtenerID1Respuesta( Cabeza , ID1Respuestas ) , number( ID1Respuestas ) ,
	obtenerFechaRespuesta( Cabeza , FechaRespuestas ) , string( FechaRespuestas ) ,obtenerID2Respuesta( Cabeza , ID2Respuestas ) , number( ID2Respuestas ) ,
	obtenerContenidoRespuesta( Cabeza , ContenidoRepuesta ) , string( ContenidoRepuesta ) ,obtenerEtiquetasRespuesta( Cabeza , EtiquetasRepuestas ) , is_list( EtiquetasRepuestas ) ,
	obtenerAutorRespuesta( Cabeza , AutorRespuesta ) , string( AutorRespuesta ) , pertenenciaRespuestas( Cola ).

%Pertenencia Usuario Activo.
% Entrada: Se ingresan usuario activo.
% Salida: boleano.
% Descripcion: Comprueba que sus elementos pertenezcan a los datos especificados.
% Ejemplo: pertenenciaUsuarioActivo( [ "Dyllan" , "123" ] ).
% pertenenciaUsuarioActivo( [ "Dyllan" , 123 ] ).
pertenenciaUsuarioActivo( [] ).
pertenenciaUsuarioActivo( [ Cabeza | Cola]  ):-string( Cabeza ) , pertenenciaUsuarioActivo( Cola ).

%Pertenencia Stack
% Entrada: Se ingresa el stack.
% Salida: boleano.
% Descripcion: Comprueba que sus elementos pertenezcan a los datos especificados.
% Ejemplo: perteneceAStack([ [ [ "Salgado" , "456" , 0 ] ] , [ [ 1 , "01-12-2020" , "Soy pregunta" , [ "pregunta" , "nel"] , "Dyllan" , 0 ] ]  , [] , [ "Dyllan" , "123" ] ]).
% perteneceAStack([  "dyllan","123",0  , [ [ 1 , "01-12-2020" , "Soy pregunta" , [ "binario" , "nulo"] , "Dyllan" , 0 ] ]  , [] , [ "Dyllan" , "123" ] ]).
perteneceAStack( Stack ):- obtenerUsuarioS( Stack , UsuarioS ) , pertenenciaUsuarios( UsuarioS ) ,
	obtenerPreguntaS( Stack , PreguntaS ) , pertenenciaPreguntas( PreguntaS ) ,
	obtenerRespuestaS( Stack , RespuestaS ) , pertenenciaRespuestas( RespuestaS ) ,
	obtenerActivo( Stack , UsuarioActivo ) , pertenenciaUsuarioActivo( UsuarioActivo ).

%SELECTORES
% Entrada: El elemento que se quiere seleccionar
% Salida: El elemento. 
% Descripcion: El selector es utilizado para obtener datos dentro del stack.

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

%PREDICADOS ADICIONALES

%existeUsuario
% Entrada: Un usuario.
% Salida: Un boleano con true o false, donde true es existe y false no existe.
% Descripcion: Funcion que se utiliza para saber si un usuario existe en nuestro stack.
% Ejemplo: existeUsuario( [ [ "Dyllan" , "123" , 0 ] , [ "Salgado" , "456" , 0 ] ] , "Dyllan" , Existe ).
% existeUsuario( [ [ "Dyllan" , "123" , 0 ] , [ "Salgado" , "456" , 0 ] ] , "Dyllansasa" , Existe ).
existeUsuario( [] , _ , Existe  ):- Existe = false.
existeUsuario( [ Cabeza | _ ] , NombreUsuario , Existe ):-
	obtenerUsuario( Cabeza , NombreUsuarioStack ) , NombreUsuarioStack == NombreUsuario , Existe = true.
existeUsuario( [ Cabeza | Cola ] , NombreUsuario , Existe ):-obtenerUsuario( Cabeza , NombreUsuarioStack ) , not( NombreUsuarioStack == NombreUsuario ) , 
	existeUsuario( Cola , NombreUsuario , Existe ).

%existePregunta
% Entrada: Una pregunta 
% Salida: false o true si existe respuesta.
% Descripcion: Se utiliza para saber si una pregunta existe.
% Ejemplo: existePregunta([ [ 1 , "01-12-2020" , "pregunta1" , [ "pregunta" , "pregunta1"] , "Dyllan" , 0 ] , [ 2 , "02-12-2020" , "pregunta2" , [ "pregunta" , "pregunta2"] , "Salgado" , 0 ]], 1 ,Existe).
% existePregunta([ [ 1 , "01-12-2020" , "pregunta1" , [ "pregunta" , "pregunta1"] , "Dyllan" , 0 ] , [ 2 , "02-12-2020" , "pregunta2" , [ "pregunta" , "pregunta2"] , "Salgado" , 0 ]], 3 ,Existe).
existePregunta( [] , _ , Existe ):- Existe = false.
existePregunta( [ Cabeza | _ ] , IDPregunta, Existe ):-
	obtenerIDPregunta( Cabeza , IDPreguntaStack ) , 
	IDPregunta == IDPreguntaStack , Existe = true.
existePregunta( [ Cabeza | Cola ] , IDPregunta , Existe ):-
	obtenerIDPregunta( Cabeza , IDPreguntaStack ) , 
	not( IDPregunta == IDPreguntaStack ) , existePregunta( Cola , IDPregunta , Existe ).

%existeRespuesta
% Entrada: Respuesta
% Salida: false o true si existe respuesta.
% Descripcion: Se utiliza para saber si una respuesta existe.
% Ejemplo: existeRespuesta([ [ 1 , "01-12-2020" , 1 , "respuestaXD" , [ "XD" , "DX"] , "Salgado" ] ], 1, Existe).
% existeRespuesta([ [ 1 , "01-12-2020" , 1 , "RespuestaXD" , [ "XD" , "DX"] , "Salgado" ] ], 2, Existe).
existeRespuesta( [] , _ , Existe ):-Existe=false.
existeRespuesta( [ Cabeza | _ ] , IDRespuesta , Existe ):-
	obtenerID2Respuesta( Cabeza , IDRespuestaStack ) , 
	IDRespuesta == IDRespuestaStack , Existe = true.
existeRespuesta( [ Cabeza | Cola ] , IDRespuesta , Existe ):-
	obtenerID2Respuesta( Cabeza , IDRespuestaStack ) , 
	not( IDRespuesta == IDRespuestaStack ) , existeRespuesta( Cola , IDRespuesta , Existe ).

%contarPreguntasRespuestas
% Entrada: Preguntas o respuestas.
% Salida: Cantidad de preguntas o respuestas.
% Descripcion: Se utiliza para saber la cantidad de preguntas y respuestas que estan en nuestro stack.
% contarPreguntasRespuestas( [ [ 1 , "01-12-2020" , 2 , "SoyRespuesta" , [ "XD" , "DX"] , "Dyllan" ] , [ 1 , "02-12-2020" , 2 , "SoyRespuesta2" , [ "Hola" , "Holi"] , "Dyllan" ] ] , 0 , Cantidad ).
% contarPreguntasRespuestas( [ [ 1 , "01-12-2020" , 2 , "SoyRespuesta" , [ "XD" , "DX"] , "Dyllan" ] ] , 0 , Cantidad ).
contarPreguntasRespuestas( [ _ | Cola ] , Cantidad , Salida ):-CantidadAux is ( Cantidad + 1) , contarPreguntasRespuestas( Cola , CantidadAux , Salida ).
contarPreguntasRespuestas( [ ] , Cantidad , Salida ):-Salida = Cantidad.

%sacarUsuario
% Entrada: Se ingresa el nombre de un usuario.
% Salida: Si se encuentra nos entrega el usuario , si no devuelve un false.
% Descripcion: Se utiliza para obtener un usuario.
% Ejemplo: sacarUsuario( [ [ "Dyllan" , "123" , 0 ] , [ "Salgado" , "456" , 0 ] ] , "Dyllan" , Usuario ).
% sacarUsuario( [ [ "Dyllan" , "123" , 0 ] , [ "Salgado" , "456" , 0 ] ] , "juanito" , Usuario ).
sacarUsuario( [] , _ , Usuario ):- Usuario=false.
sacarUsuario( [ Cabeza | _ ] , NombreUsuario , Usuario ):-obtenerUsuario( Cabeza , NombreUsuarioStack ) , NombreUsuarioStack == NombreUsuario , Usuario = Cabeza.
sacarUsuario( [ Cabeza | Cola ] , NombreUsuario , Usuario ):-
	obtenerUsuario( Cabeza , NombreUsuarioStack ) , not( NombreUsuarioStack == NombreUsuario ) , sacarUsuario( Cola , NombreUsuario , Usuario ).

%sacarPass
% Entrada: Se ingresa la pass de un usuario.
% Salida: Se obtiene la pass
% Descripcion: se utiliza para obtener la pass de un usuario y ver que calze con su nombre.
% Ejemplo: sacarPass( [ [ "Dyllan" , "123" , 0 ] , [ "Salgado" , "456" , 0 ] ] , "Dyllan" , Pass ).
% sacarPass( [ [ "Dyllan" , "123" , 0 ] , [ "Salgado" , "456" , 0 ] ] , "juanito" , Pass ).
sacarPass( [] , _ , Pass ):- Pass=false.
sacarPass( [ Cabeza | _ ] , NombreUsuario , Pass ):-
	obtenerUsuario( Cabeza , NombreUsuarioStack ) , NombreUsuarioStack == NombreUsuario , obtenerPassUsuario( Cabeza , PassUsuario ) , Pass = PassUsuario.
	sacarPass( [ Cabeza | Cola ] , NombreUsuario , Pass ):-
	obtenerUsuario( Cabeza , NombreUsuarioStack ) , not( NombreUsuarioStack == NombreUsuario ) , sacarPass( Cola , NombreUsuario , Pass ).

%sacarPregunta
% Entrada: Se ingresa una pregunta.
% Salida: Obtener la pregunta.
% Descripcion: Es utilizada para obtener la pregunta por su id.
% Ejemplo: sacarPregunta( [ [ 1 , "01-12-2020" , "pregunta1" , [ "pregunta" , "pregunta1"] , "Dyllan" , 0 ] ] , 1 , Pregunta ).
% sacarPregunta( [ [ 1 , "01-12-2020" , "pregunta1" , [ "pregunta" , "pregunta1"] , "Dyllan" , 0 ] ] , 3 , Pregunta ).
sacarPregunta( [] , _ , Pregunta ):-Pregunta=false.
sacarPregunta( [ Cabeza | _ ] , IDPregunta , Pregunta ):-obtenerIDPregunta( Cabeza , IDPreguntaStack ) , IDPregunta == IDPreguntaStack , Pregunta = Cabeza.
sacarPregunta( [ Cabeza | Cola ] , IDPregunta , Pregunta ):-obtenerIDPregunta( Cabeza , IDPreguntaStack ) , not( IDPregunta == IDPreguntaStack ) , 
	sacarPregunta( Cola , IDPregunta , Pregunta ).

%sacarRespuesta
% Entrada: Se ingresa una respuesta.
% Salida: Obtener la respuesta.
% Descripcion: Es utilizada para obtener la respuesta por su id.
% Ejemplo: sacarRespuesta( [ [ 1 , "01-12-2020" , 1 , "pregunta" , [ "lol" , "lmao"] , "Salgado" ] ] , 1 , Respuesta ).
% sacarRespuesta( [ [ 1 , "01-12-2020" , 1 , "pregunta" , [ "lol" , "lmao"] , "Salgado" ] ] , 3 , Respuesta ).
sacarRespuesta( [] , _ , RespuestaA ):-RespuestaA=false.
sacarRespuesta( [ Cabeza | _ ] , IDRespuesta , Respuesta ):-
	obtenerID2Respuesta( Cabeza , IDRespuestaStack ) , IDRespuesta == IDRespuestaStack , Respuesta = Cabeza.
sacarRespuesta( [ Cabeza | Cola ] , IDRespuesta , RespuestaA ):-
	obtenerID2Respuesta( Cabeza , IDRespuestaStack ) , not( IDRespuesta == IDRespuestaStack ) , sacarRespuesta( Cola , IDRespuesta , RespuestaA ).

%PreguntasNuevas
% Entrada: Una pregunta
% Salida: Una pregunta modificada.
% Descripcion: Se utiliza para el accept para que cambia la respuesta a respondida.
% Ejemplo: preguntaNueva( [ [ 1 , "01-12-2020" , "preguntaNoRespondida" , [ "Respondan" , "Awita"] , "Dyllan" , 0 ] ] , 1 , [ 1 , "02-12-2020" , "PreguntaRespondida" , [ "Respondan" , "Awita"] , "Salgado" , 1 ] , [] , PreguntaSalida ).
preguntaNueva( [] , _ , _ , Lista , Salida ):-Salida = Lista.
preguntaNueva( [ Cabeza | Cola ] , IdPregunta , Pregunta , Lista , Salida ):-obtenerIDPregunta( Cabeza , IdPreguntaAux ) , IdPreguntaAux == IdPregunta , 
	append( [Pregunta] , Lista , ListaConPregunta ) , preguntaNueva( Cola , IdPregunta , Pregunta , ListaConPregunta , Salida ).
preguntaNueva( [ Cabeza | Cola ] , IdPregunta , Pregunta , Lista , Salida ):-
	obtenerIDPregunta( Cabeza , IdPreguntaAux ) , not( IdPreguntaAux == IdPregunta ) , append( [Cabeza] , Lista , ListaConPregunta ) , 
	preguntaNueva( Cola , IdPregunta , Pregunta , ListaConPregunta , Salida).

%usuariosNuevo
% Entrada: Un usuario
% Salida: Un usuario modificado
% Descripcion: Se utiliza para la funcion accept, para poder ingresar la reputacion al usuario.
% Ejemplo: usuariosNuevo( [ [ "Dyllan" , "123" , 0 ] , [ "Salgado" , "456" , 0 ] ] , "Dyllan" , [ "Dyllan" , "123" , 15 ] , [] , Salida ).
usuariosNuevo( [ ] , _ , _ , Lista , Salida ):-Salida = Lista.
usuariosNuevo( [ Cabeza | Cola ] , NombreUsuario , UsuarioNuevo , Lista , Salida ):-obtenerUsuario( Cabeza , NombreUsuarioAux ) , 
	NombreUsuarioAux == NombreUsuario , append( [UsuarioNuevo] , Lista , ListaConUsuario ) , usuariosNuevo( Cola , NombreUsuario , UsuarioNuevo , ListaConUsuario , Salida ).
usuariosNuevo( [ Cabeza | Cola ] , NombreUsuario , UsuarioNuevo , Lista , Salida ):-obtenerUsuario( Cabeza , NombreUsuarioAux ) , 
	not( NombreUsuarioAux == NombreUsuario ) , append( [Cabeza] , Lista , ListaConUsuario ) , usuariosNuevo( Cola , NombreUsuario , UsuarioNuevo , ListaConUsuario , Salida ).

%agregaUsuarios
% Entrada: Obtiene los datos de un usuario
% Salida: Datos usuario
% Descripcion: Se utiliza para realizar el stackToString, para añadir sus datos y que sean impresos.
agregaUsuarios( Lista , [] , Salida ):-Salida = Lista.
agregaUsuarios( Lista , [ Cabeza | Cola ] , Salida ):-
	append( Lista , ["\nNombre: "] , Salida1 ) , obtenerUsuario( Cabeza , NombreUsuario ) ,	append( Salida1 , [ NombreUsuario ] , Salida2 ) ,
	append( Salida2 , [". Pass: "] , Salida3 ) , obtenerPassUsuario( Cabeza , PassUsuario ) , append( Salida3 , [ PassUsuario ] , Salida4 ) ,
	append( Salida4 , [". Reputacion: "] , Salida5 ) , obtenerReputacionUsuario( Cabeza , ReputacionUsuario ) , append( Salida5 , [ReputacionUsuario] , Salida6 ) , agregaUsuarios( Salida6 , Cola , Salida ).

%agregaPreguntas
% Entrada: Obtiene los datos de una pregunta.
% Salida: Datos de pregunta.
% Descripcion: Se utiliza para realizar el stackToString, para añadir sus datos y que sean impresos.
agregaPreguntas( Lista , [] , Salida ):-Salida = Lista.
%caso para cuando la pregunta no esta respondida.
agregaPreguntas( Lista , [ Cabeza | Cola ] , Salida ):-
	append( Lista ,   ["ID Pregunta: "] , Salida1 ) , obtenerIDPregunta( Cabeza , IDPregunta ) , append( Salida1 , [IDPregunta] , Salida2 ),
	append( Salida2 , [". Fecha: "] , Salida3 ) , obtenerFechaPregunta( Cabeza , FechaPregunta ) , append( Salida3 , [FechaPregunta] , Salida4 ),
	append( Salida4 , [". Contenido: "] , Salida5 ) , obtenerContenidoPregunta( Cabeza , ContenidoPregunta ) , append( Salida5 , [ContenidoPregunta] , Salida6 ),
	append( Salida6 , [". Etiquetas: "] , Salida7 ) , obtenerEtiquetasPregunta( Cabeza , EtiquetaPregunta ) , append( Salida7 , [EtiquetaPregunta] , Salida8 ),
	append( Salida8 , [". Autor: "] , Salida9 ) , obtenerAutorPregunta( Cabeza , AutorPregunta ) , append( Salida9 , [AutorPregunta] , Salida10 ),
	append( Salida10 ,[". Respondida?: "] , Salida11 ) ,obtenerRespondidaPregunta( Cabeza , Respondida ) , Respondida == 0 , append( Salida11 , ["No"] , Salida12 ), append( Salida12 , ["\n"] , Salida13 ),
	agregaPreguntas( Salida13 , Cola , Salida ).
%caso para cuando la pregunta ya esta respondida.
agregaPreguntas( Lista , [ Cabeza | Cola ] , Salida ):-
	append( Lista ,   ["ID Pregunta: "] , Salida1 ) , obtenerIDPregunta( Cabeza , IDPregunta ) , append( Salida1 , [IDPregunta] , Salida2 ),
	append( Salida2 , [". Fecha: "] , Salida3 ) , obtenerFechaPregunta( Cabeza , FechaPregunta ) , append( Salida3 , [FechaPregunta] , Salida4 ),
	append( Salida4 , [". Contenido: "] , Salida5 ) , obtenerContenidoPregunta( Cabeza , ContenidoPregunta ) , append( Salida5 , [ContenidoPregunta] , Salida6 ),
	append( Salida6 , [". Etiquetas: "] , Salida7 ) , obtenerEtiquetasPregunta( Cabeza , EtiquetaPregunta ) , append( Salida7 , [EtiquetaPregunta] , Salida8 ),
	append( Salida8 , [". Autor: "] , Salida9 ) , obtenerAutorPregunta( Cabeza , AutorPregunta ) , append( Salida9 , [AutorPregunta] , Salida10 ),
	append( Salida10 ,[". Respondida?: "] , Salida11 ) ,obtenerRespondidaPregunta( Cabeza , Respondida ) , Respondida == 1 , append( Salida11 , ["Si"] , Salida12 ), append( Salida12 , ["\n"] , Salida13 ),
	agregaPreguntas( Salida13 , Cola , Salida ).
			
%agregaRespuestas
% Entrada: Obtiene los datos de una respuesta.
% Salida: Datos de una respuesta.
% Descripcion: Se utiliza para realizar el stackToString, para añadir sus datos y que sean impresos.
agregaRespuestas( Lista , [] , Salida ):-Salida = Lista.
agregaRespuestas( Lista , [ Cabeza | Cola ] , Salida ):-
	append( Lista , ["ID Pregunta: "] , Salida1 ) , obtenerID1Respuesta( Cabeza , IDPregunta ) , append( Salida1 , [IDPregunta] , Salida2 ) ,
	append( Salida2 , [". Fecha: "] , Salida3 ) , obtenerFechaRespuesta( Cabeza , FechaRespuesta) , append( Salida3 , [FechaRespuesta] , Salida4 ) ,
	append( Salida4 , [". ID Respuesta: "] , Salida5 ) , obtenerID2Respuesta( Cabeza , IDRespuesta ) , append( Salida5 , [IDRespuesta] , Salida6 ), 
	append( Salida6 , [". Contenido: "] , Salida7 ) , obtenerContenidoRespuesta( Cabeza , ContenidoRespuesta ) , append( Salida7 , [ContenidoRespuesta] , Salida8 ),
	append( Salida8 , [". Etiqueta: "] , Salida9 ) , obtenerEtiquetasRespuesta( Cabeza , EtiqietaRespuesta ) , append( Salida9 , [EtiqietaRespuesta] , Salida10 ),
	append( Salida10 , [". Autor: "] , Salida11 ) , obtenerAutorRespuesta( Cabeza , AutorRespuesta ) , append( Salida11 , [AutorRespuesta] , Salida12 ), append( Salida12 , ["\n"] , Salida13 ),
	agregaRespuestas( Salida13 , Cola , Salida ).
	
%agregaUsuariosActivo
% Entrada: Obtiene los datos de un usuario Activo.
% Salida: Datos de un usuario activo.
% Descripcion: Se utiliza para realizar el stackToString, para añadir sus datos y que sean impresos.
agregaUsuariosActivo( Lista , Usuario , Salida ):-append( Lista , ["Nombre: "] , Salida1 ) , 
	obtenerNombreActivo( Usuario , NombreUsuarioActivo ) , append( Salida1 , [NombreUsuarioActivo] , Salida2 ),append( Salida2 , [". Pass: "] , Salida3 ) , 
	obtenerPassActivo( Usuario , PassUsuarioActivo ) , append( Salida3 , [PassUsuarioActivo] , Salida4 ),
	Salida = Salida4.

%filtroPreguntas
% Entrada: Lista con preguntas y nombre de quien las escribio.
% Salida: Todas sus preguntas.
% Descripcion: Se utiliza para encontrar todas las preguntas de un usuario.
filtroPreguntas( [] , _ , Lista , Salida ):-Salida = Lista.
filtroPreguntas( [ Cabeza | Cola ] , NombreUsuario , Lista , Salida ):-obtenerAutorPregunta( Cabeza , Nombre ) ,Nombre == NombreUsuario,
	append( [Cabeza] , Lista , ListaConPreguntadasFiltradas ),filtroPreguntas( Cola , NombreUsuario , ListaConPreguntadasFiltradas , Salida ).
filtroPreguntas( [ Cabeza | Cola ] , NombreUsuario , Lista , Salida ):-obtenerAutorPregunta( Cabeza , Nombre ) ,not( Nombre == NombreUsuario ),
	filtroPreguntas( Cola , NombreUsuario , Lista , Salida ).

%formatoListas
% Entrada: Una lista
% Salida: Nos entrega una lista.
% Descripcion: Se utiliza para la funcion stack to string para poder realizar la impresion de la lista de listas.
formatoListas( Lista , [] , Salida ):-Salida = Lista.
formatoListas( Lista , [ Cabeza | Cola ] , Salida ):-is_list( Cabeza ),listaString( "" , Cabeza , Salida1 ),append( Lista , [Salida1] , Salida2 ),formatoListas( Salida2 , Cola , Salida ).
formatoListas( Lista , [ Cabeza | Cola ] , Salida ):-not( is_list( Cabeza ) ),append( Lista , [Cabeza] , Salida1 ),formatoListas( Salida1 , Cola , Salida ).

%listaString
% Entrada: Un string
% Salida: lista de string concatenados.
% Descripcion: Se utliza en la funcion stack to string para concatenar los string.
listaString( String , [] , Salida ):-Salida = String.
listaString( String , [ Cabeza | Cola ] , Salida ):-string_concat(String, Cabeza, Salida1), string_concat(Salida1, " , ", Salida2),listaString( Salida2 , Cola , Salida ).

%FUNCIONES OBLIGATORIAS
%EJEMPLOS DE ESTAS FUNCIONES SE ENCUENTRAN AL FINAL.

%stackRegister
% Entrada: recibe al stack , nombre de usuario y pass de usuario.
% Salida: Stack con  usuarios registrados.
% Descripcion: Predicado para registrar un usuario. Si el usuario no se encuentra registrado, se ingresara al stack pero si ya se encuentra un usuario con mismo nombre retorna un falso.  
stackRegister( Stack , NombreUsuario , PassUsuario , Stack2 ):-string( NombreUsuario ) , string( PassUsuario ),obtenerUsuarioS( Stack , UsuarioS ),
	existeUsuario( UsuarioS , NombreUsuario , Existe ),Existe == true,Stack2 = Stack,!,fail.
stackRegister( Stack , NombreUsuario , PassUsuario , Stack2 ):-string( NombreUsuario ) , string( PassUsuario ),obtenerUsuarioS( Stack , UsuarioS ),
	existeUsuario( UsuarioS , NombreUsuario , Existe ),
	Existe == false,obtenerPreguntaS( Stack , Preguntas ) , obtenerRespuestaS( Stack , Respuestas ) , obtenerActivo( Stack , UsuarioActivo ),
	append( UsuarioS , [ [ NombreUsuario , PassUsuario , 0 ] ], Usuarios2 ),Stack2 = [ Usuarios2 , Preguntas , Respuestas , UsuarioActivo ].

%stackLogin
% Entrada: recibe el stack, se ingresa nombre de usuario, y pass.
% Salida: Stack con usuario logeado.
% Descripcion: Predicado para logear un usuario. Si el usuario no se encuentra en el stack o se a equivocado en la clave, entregara un false.
stackLogin( Stack , NombreUsuario , PassUsuario , Stack2 ):-string( NombreUsuario ) , string( PassUsuario ),obtenerUsuarioS( Stack , UsuarioS ),
	sacarPass( UsuarioS , NombreUsuario , Pass ),Pass = false,Stack2 = false,!,fail.
stackLogin( Stack , NombreUsuario , PassUsuario , Stack2 ):-string( NombreUsuario ) , string( PassUsuario ),obtenerUsuarioS( Stack , UsuarioS ),
	sacarPass( UsuarioS , NombreUsuario , Pass ),not( Pass == false ),Pass == PassUsuario,obtenerPreguntaS( Stack , Preguntas ) , obtenerRespuestaS( Stack , Respuestas ),
	Stack2 = [ UsuarioS , Preguntas , Respuestas , [ NombreUsuario , PassUsuario ] ].
stackLogin( Stack , NombreUsuario , PassUsuario , Stack2 ):-string( NombreUsuario ) , string( PassUsuario ),obtenerUsuarioS( Stack , UsuarioS ),
	sacarPass( UsuarioS , NombreUsuario , Pass ),not( Pass == false ),not( Pass == PassUsuario ),Stack2 = false,!,fail.

%ask
% Entrada: recibe el stack, fecha, texto de la pregunta, una lista de etiquetas.
% Salida: stack con pregunta realizada.
% Descripcion: debe estar logueado un usuario para poder realizar una pregunta, nos permite generar preguntas que se tendran en nuestro stack.
ask( Stack , Fecha , TextoPregunta , ListaEtiquetas , Stack2):-string( Fecha ) , string( TextoPregunta ) , is_list( ListaEtiquetas ) ,obtenerActivo( Stack , UsuarioActivo ) ,
	UsuarioActivo == [],Stack2 = false,!,fail.
ask( Stack , Fecha , TextoPregunta , ListaEtiquetas , Stack2 ):-string( Fecha ) , string( TextoPregunta ) , is_list( ListaEtiquetas ) ,obtenerActivo( Stack , UsuarioActivo ) ,
	not( UsuarioActivo == [] ),obtenerNombreActivo( UsuarioActivo , NombreActivo ),obtenerUsuarioS( Stack , Usuarios ) , obtenerPreguntaS( Stack , Preguntas ) ,
	obtenerRespuestaS( Stack , Respuestas ),contarPreguntasRespuestas( Preguntas , 0 , Salida),ID is (Salida+1),
	append( Preguntas , [[ ID , Fecha , TextoPregunta , ListaEtiquetas , NombreActivo , 0 ]] , Preguntas2 ),Stack2 = [ Usuarios , Preguntas2 , Respuestas , [] ].

%answer
% Entrada: Recibe el stack,la fecha, id a pregunta responder, la respuesta, lista de etiquetas.
% Salida: respuesta formulada para una respuesta con id
% Descripcion: Nos permite responder una pregunta con su id.
answer( Stack , _ , _ , _ , _ , Stack2 ):-obtenerActivo( Stack , Activo ),Activo == [],Stack2 = false, !,fail.
answer( Stack , _ , IdPregunta , _ , _ , Stack2 ):-obtenerActivo( Stack , Activo ),not( Activo == [] ),obtenerPreguntaS( Stack , Preguntas ),
	existePregunta( Preguntas , IdPregunta , Existe ),Existe == false,Stack2 = false,!,fail.
answer( Stack , Fecha , IdPregunta , TextoRespuesta , ListaEtiquetas , Stack2 ):-obtenerActivo( Stack , Activo ),not( Activo == [] ),obtenerPreguntaS( Stack , Preguntas ),
    existePregunta( Preguntas , IdPregunta , Existe ),Existe == true,
	obtenerUsuarioS( Stack , Usuarios ) , obtenerRespuestaS( Stack , Respuestas ) ,contarPreguntasRespuestas( Respuestas , 0 ,Cantidad ),ID is ( Cantidad + 1 ),
	obtenerNombreActivo( Activo , NombreActivo ),append( Respuestas , [[ IdPregunta , Fecha , ID , TextoRespuesta , ListaEtiquetas , NombreActivo ]] , Respuestas2 ),!,
	Stack2 = [ Usuarios , Preguntas , Respuestas2 , []].

%accept
% Entrada: Stack id de pregunta, id de respuesta.
% Salida: respuesta aceptada para una pregunta, se añaden puntajes a quien respondio y a quien creo la pregunta.
% Descripcion: Predicado que nos permite aceptar respuestas de preguntas, solo el usuario que genera pregunta puede aceptar las respuestas.
%caso cuando no se encuentra una sesion activa.
accept( Stack , _ , _ , Stack2 ):-obtenerActivo( Stack , Activo ),Activo == [],Stack2 = false,!,fail.

%caso cuando la pregunta no existe, tira false.
accept( Stack , IdPregunta , _ , _ ):-obtenerActivo( Stack , Activo ),not( Activo == [] ),obtenerPreguntaS( Stack , Preguntas ),
	existePregunta( Preguntas , IdPregunta , ExistePregunta ),ExistePregunta == false,!,fail.

%caso cuando el usuario activo trata de aceptar una respuesta de pregunta que no le pertenece, entrega falso.	
accept( Stack , IdPregunta , _ , _ ):-obtenerActivo( Stack , Activo ),not( Activo == [] ),obtenerPreguntaS( Stack , Preguntas ),
	existePregunta( Preguntas , IdPregunta , ExistePregunta ),ExistePregunta == true,obtenerNombreActivo( Activo , NombreActivo ),
	sacarPregunta( Preguntas , IdPregunta , PreguntaLogueado ), obtenerAutorPregunta( PreguntaLogueado , AutorPregunta ) , 
	not( NombreActivo == AutorPregunta ),!,fail.

%caso cuando la respuesta no existe, entrega un  falso.
accept( Stack , IdPregunta , IdRespuesta , _ ):-obtenerActivo( Stack , Activo ),not( Activo == [] ),obtenerPreguntaS( Stack , Preguntas ),
	existePregunta( Preguntas , IdPregunta , ExistePregunta ),ExistePregunta == true,obtenerNombreActivo( Activo , NombreActivo ),
	sacarPregunta( Preguntas , IdPregunta , PreguntaLogueado ), obtenerAutorPregunta( PreguntaLogueado , AutorPregunta ) , 
	NombreActivo == AutorPregunta,obtenerRespuestaS( Stack , Respuestas ),
	existeRespuesta( Respuestas , IdRespuesta , ExisteRespuesta ),ExisteRespuesta == false,!,fail.
	
%caso cuando la id de pregunta asociada de la respuesta no corresponde a pregunta que se quiere responder.
accept( Stack , IdPregunta , IdRespuesta , _ ):-
	obtenerActivo( Stack , Activo ),
	not( Activo == [] ),
	obtenerPreguntaS( Stack , Preguntas ),
	existePregunta( Preguntas , IdPregunta ,ExistePregunta ),
	ExistePregunta == true,
	obtenerNombreActivo( Activo , NombreActivo ),
	sacarPregunta( Preguntas , IdPregunta , PreguntaLogueado ), 
	obtenerAutorPregunta( PreguntaLogueado , AutorPregunta ) , 
	NombreActivo == AutorPregunta,
	obtenerRespuestaS( Stack , Respuestas ),
	existeRespuesta( Respuestas , IdRespuesta , ExisteRespuesta ),
	ExisteRespuesta == true,
	sacarRespuesta( Respuestas , IdRespuesta , RespuestaRespondedor ),
	obtenerID1Respuesta( RespuestaRespondedor , IDPreguntaAsociada),
	not(IDPreguntaAsociada == IdPregunta),
	!, fail.
%caso cuando la respuesta esta respondida, pero el usuario que responde no se encuentra registrado.
accept( Stack , IdPregunta , IdRespuesta , _ ):-
	obtenerActivo( Stack , Activo ),
	not( Activo == [] ),
	obtenerPreguntaS( Stack , Preguntas ),
	existePregunta( Preguntas , IdPregunta ,ExistePregunta ),
	ExistePregunta == true,
	obtenerNombreActivo( Activo , NombreActivo ),
	sacarPregunta( Preguntas , IdPregunta , PreguntaLogueado ), 
	obtenerAutorPregunta( PreguntaLogueado , AutorPregunta ) , 
	NombreActivo == AutorPregunta,
	obtenerRespuestaS( Stack , Respuestas ),
	existeRespuesta( Respuestas , IdRespuesta , ExisteRespuesta ),
	ExisteRespuesta == true,
	sacarRespuesta( Respuestas , IdRespuesta , RespuestaRespondedor ),
	obtenerID1Respuesta( RespuestaRespondedor , IDPreguntaAsociada),
	IDPreguntaAsociada == IdPregunta,
	obtenerAutorRespuesta( RespuestaRespondedor , AutorRespuesta ),
	obtenerUsuarioS( Stack , Usuarios ),
	existeUsuario( Usuarios , AutorRespuesta , ExisteRespondedor ),
	ExisteRespondedor == false,
	!,fail.

%caso bonito cuando todo existe da el puntaje al usuario que responde y acepta la respuesta.
accept( Stack , IdPregunta , IdRespuesta , Stack2 ):-obtenerActivo( Stack , Activo ),not( Activo == [] ),obtenerPreguntaS( Stack , Preguntas ),
	existePregunta( Preguntas , IdPregunta , ExistePregunta ),ExistePregunta == true,obtenerNombreActivo( Activo , NombreActivo ),
	sacarPregunta( Preguntas , IdPregunta , PreguntaAutor ), obtenerAutorPregunta( PreguntaAutor , AutorPregunta ) , NombreActivo == AutorPregunta,
	obtenerRespuestaS( Stack , Respuestas ),existeRespuesta( Respuestas , IdRespuesta , ExisteRespuesta ),ExisteRespuesta == true,
	sacarRespuesta( Respuestas , IdRespuesta , RespuestaRespondedor ),obtenerAutorRespuesta( RespuestaRespondedor , AutorRespuesta ),
	obtenerID1Respuesta( RespuestaRespondedor , IDPreguntaAsociada), IDPreguntaAsociada == IdPregunta,
	obtenerUsuarioS( Stack , Usuarios ),
	existeUsuario( Usuarios , AutorRespuesta , ExisteRespondedor ),ExisteRespondedor == true,!,sacarUsuario( Usuarios , AutorRespuesta , UsuarioRespondedor ),
	obtenerPassUsuario( UsuarioRespondedor , PassRespondedor ),obtenerReputacionUsuario( UsuarioRespondedor , ReputacionRespondedor ),
	ReputacionNueva is ( ReputacionRespondedor + 15 ),UsuarioRespondedorNuevo = [ AutorRespuesta , PassRespondedor , ReputacionNueva ],
	usuariosNuevo( Usuarios , AutorRespuesta , UsuarioRespondedorNuevo , [] , Usuarios2 ),
	sacarPregunta( Preguntas , IdPregunta , PreguntaAutor ),
	obtenerFechaPregunta( PreguntaAutor , FechaPregunta ) ,
	obtenerContenidoPregunta( PreguntaAutor , ContenidoPregunta ) ,obtenerEtiquetasPregunta( PreguntaAutor , EtiquetasPregunta ) ,
	sacarUsuario( Usuarios , AutorPregunta , UsuarioRespondido ), obtenerPassUsuario( UsuarioRespondido , PassRespondido ),
	obtenerReputacionUsuario( UsuarioRespondido , ReputacionRespondido ), ReputacionNueva2 is ( ReputacionRespondido + 2 ),
	UsuarioRespondidoNuevo = [ AutorPregunta , PassRespondido , ReputacionNueva2 ], usuariosNuevo( Usuarios2 , AutorPregunta , UsuarioRespondidoNuevo , [] , Usuarios3 ),
	Pregunta2 = [ IdPregunta , FechaPregunta , ContenidoPregunta , EtiquetasPregunta , AutorPregunta , 1 ],
	preguntaNueva( Preguntas , IdPregunta , Pregunta2 , [] , Preguntas2 ),Stack2 = [ Usuarios3 , Preguntas2 , Respuestas , [] ].

%stackToString
% Entrada: Todo el stack
% Salida: stack como string
% Descripcion: Nos permite transformar todo nuestro stack como si fuera un string.
% Nos permite mostrar como string todo el stack, caso cuando no hay usuario activo.
stackToString( Stack , StackStr ):-
	perteneceAStack( Stack ),
	obtenerUsuarioS( Stack , Autores ) , obtenerPreguntaS( Stack , Preguntas ) , obtenerRespuestaS( Stack , Respuestas ) , obtenerActivo( Stack , UsuarioActivo ),UsuarioActivo == [],
	append( [] , ["USUARIOS REGISTRADOS"] , Salida1 ) , append( Salida1 , ["\n"] , Salida2 ), 
	agregaUsuarios( Salida2 , Autores , Salida3 ) , append( Salida3 , ["\n"] , Salida4 ), 
	append( Salida4 , ["PREGUNTAS DEL STACK"] , Salida5 ) , append( Salida5 , ["\n"] , Salida6 ),append( Salida6 , ["\n"] , Salida7 ), 
	agregaPreguntas( Salida7 , Preguntas , Salida8 ) , append( Salida8 , ["\n"] , Salida9 ), 
	append( Salida9 , ["RESPUESTAS DEL STACK"] , Salida10 ) , append( Salida10 , ["\n"] , Salida11 ),append( Salida11 , ["\n"] , Salida12 ), 
	agregaRespuestas( Salida12 , Respuestas , Salida13 ) , append( Salida13 , ["\n"] , Salida14 ), 
	append( Salida14 , ["USUARIO CON SESION INICIADA"] , Salida15 ) , append( Salida15 , ["\n"] , Salida16 ),append( Salida16 , ["\n"] , Salida17 ), 
	append( Salida17 , ["NO SE ENCUENTRA USUARIO CON SESION INICIADA"] , Salida18 ),
	formatoListas( [] , Salida18 , Salida19 ),
	atomics_to_string( Salida19 , StackAsString ),
	StackStr = StackAsString.
%Si existe un usuario activo, solo se mostraran las preguntas del usuario y si esta respondida o no.
stackToString( Stack , StackStr ):-
	perteneceAStack( Stack ),
	obtenerUsuarioS( Stack , Autores ) , obtenerPreguntaS( Stack , Preguntas ) , obtenerActivo( Stack , UsuarioActivo ),
	not( UsuarioActivo == [] ), obtenerNombreActivo( UsuarioActivo , NombreActivo ),
	filtroPreguntas( Preguntas , NombreActivo , [] , PreguntasFiltradas ),
	append( [] , ["USUARIOS REGISTRADOS"] , Salida1 ) , append( Salida1 , ['\n'] , Salida3),
	sacarUsuario( Autores , NombreActivo , UsuarioActivoStack ),
	ListaConUsuario = ( [ UsuarioActivoStack ] ),
	agregaUsuarios( Salida3 , ListaConUsuario , Salida4 ),	append( Salida4 , ["\n"] , Salida5 ), append( Salida5 , ["\n"] , Salida6 ), 
	append( Salida6 , ["PREGUNTAS DEL STACK"] , Salida7 ) , append( Salida7 , ["\n"] , Salida8 ),append( Salida8 , ["\n"] , Salida9 ), 
	agregaPreguntas( Salida9 , PreguntasFiltradas , Salida10 ) , append( Salida10 , ["\n"] , Salida11 ),append( Salida11 , ["\n"] , Salida12 ), 
	append( Salida12 , ["USUARIO CON SESION INICIADA"] , Salida13 ) , append( Salida13, ["\n"] , Salida14 ),append( Salida14, ["\n"] , Salida15 ),
	agregaUsuariosActivo( Salida15 , UsuarioActivo , Salida16 ) ,
	formatoListas( [] , Salida16 , Salida17 ),
	atomics_to_string( Salida17, StackAsString),
	StackStr = StackAsString.

%EJEMPLOS:
%stackRegister:
%1)stackRegister( [ [ [ "Dyllan" , "123" , 0 ] , [ "Salgado" , "456" , 0 ] ] , [ ] , [ ] , [ ] ] , "SoyNuevo" , "clave123" , StackRegistrado).
%2)stackRegister( [ [ [ "Dyllan" , "123" , 0 ] , [ "Salgado" , "456" , 0 ] ] , [ ] , [ ] , [ ] ] , "Dyllan" , "clave123" , StackRegistrado).
%3)stackRegister( [ [ [ "Dyllan" , "123" , 0 ] , [ "Salgado" , "456" , 0 ] ] , [ ] , [ ] , [ ] ] , SoyNuevo , "clave123" , StackRegistrado).

%stackLogin:
%1)stackLogin( [ [ [ "Dyllan" , "123" , 0 ] , [ "Salgado" , "456" , 0 ] ,["SoyNuevo","clave123",0 ] ] , [ ] , [ ] , [ ] ] , "Dyllan" , "123" , StackLogeado).
%2)stackLogin( [ [ [ "Dyllan" , "123" , 0 ] , [ "Salgado" , "456" , 0 ] ,["SoyNuevo","clave123",0 ] ] , [ ] , [ ] , [ ] ] , "Dyllan" , "clavemala" , StackLogeado).
%3)stackLogin( [ [ [ "Dyllan" , "123" , 0 ] , [ "Salgado" , "456" , 0 ] ,["SoyNuevo","clave123",0 ] ] , [ ] , [ ] , [ ] ] , "Usuariomalo" , "clave123" , StackLogeado).

%ask:
%1)ask([[["Dyllan", "123", 0], ["Salgado", "456", 0] ], [], [], ["Dyllan", "123"]],"02-12-2020","pregunta1",["pan","jamon"],StackConAsk).
%2)ask([[["Dyllan", "123", 0], ["Salgado", "456", 0] ], [], [], ["Salgado", "123"]],"02-12-2020", pregunta1 ,["pan","jamon"],StackConAsk).
%3)ask([[["Dyllan", "123", 0], ["Salgado", "456", 0] ], [], [], ["Dyllan", "123"]],"02-12-2020", "pregunta1" ,"pan",StackConAsk).

%answer:
%1)answer([[["Dyllan", "123", 0], ["Salgado", "456", 0] ], [[1, "02-12-2020", "pregunta1", ["pan", "jamon"], "Salgado", 0]], [], ["Dyllan","123"] ], "03-12-2020" , 1 , "respuesta a Salgado" , ["aaaaaah" , "eeeeeh"] , StackConAnswer).
%2)answer([[["Dyllan", "123", 0], ["Salgado", "456", 0] ], [[1, "02-12-2020", "pregunta1", ["pan", "jamon"], "Salgado", 0]], [], ["Dyllan","123"] ], "03-12-2020" , 2 , "respuesta a Salgado" , ["aaaaaah" , "eeeeeh"] , StackConAnswer).
%3)answer([[["Dyllan", "123", 0], ["Salgado", "456", 0] ], [[1, "02-12-2020", "pregunta1", ["pan", "jamon"], "Salgado", 0]], [], ["Dyllan","123"] ], "03-12-2020" , 0 , "respuesta a Salgado" , ["aaaaaah" , "eeeeeh"] , StackConAnswer).

%accept:
%1)accept([[["Dyllan","123",0],["Salgado","456",0]],[[1,"02-12-2020","pregunta1",["pan","jamon"],"Salgado",0]],[[1,"03-12-2020",1,"respuesta a Salgado",["aaaaaah","eeeeeh"],"Dyllan"]],["Salgado","456"] ],1,1,StackAceptado).
%2)accept([[["Dyllan","123",0],["Salgado","456",0]],[[1,"02-12-2020","pregunta1",["pan","jamon"],"Dyllan",0]],[[1,"03-12-2020",1,"respuesta a Dyllan",["aaaaaah","eeeeeh"],"Salgado"]],["Dyllan","123"] ],1,1,StackAceptado).
%3)accept([[["Dyllan","123",0],["Salgado","456",0]],[[1,"02-12-2020","pregunta1",["pan","jamon"],"Salgado",0]],[[1,"03-12-2020",1,"respuesta a Salgado",["aaaaaah","eeeeeh"],"Dyllan"]],["Salgado","456"] ],2,1,StackAceptado).

%stackToString
%1)stackToString([[["Dyllan","123",15],["Salgado","456",2]],[[1,"02-12-2020","pregunta1",["pan","jamon"],"Salgado",1]],[[1,"03-12-2020",1,"respuesta a Salgado",["aaaaaah","eeeeeh"],"Dyllan"]],[]], StackStr).
%2)stackToString([[["Dyllan","123",15],["Salgado","456",2]],[[1,"02-12-2020","pregunta1",["pan","jamon"],"Salgado",1]],[[1,"03-12-2020",1,"respuesta a Salgado",["aaaaaah","eeeeeh"],"Dyllan"]],["Salgado","456"]], StackStr).
%3)stackToString([[["Dyllan","123",15],["Salgado","456",2]],[[1,"02-12-2020","pregunta1",["pan","jamon"],"Salgado",1]],[[1,"03-12-2020",1,"respuesta a Salgado",["aaaaaah","eeeeeh"],"Dyllan"]],["Salgado",clavemala ]], StackStr).


%Ejemplo con los stack creados:
%Se llama al stack1 y se registra un usuario con el stackRegister.
	%stack1(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2).
%Luego de registrarlo se logea con el stackLogin.
	%stack1(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2),stackLogin(Stack2,"SoyNuevoEnStack","123",Stack3).
%Si esta logeado puede realizar una pregunta y se cierra su sesion activa.
	%stack1(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2),stackLogin(Stack2,"SoyNuevoEnStack","123",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4).
%Vuelve a logearse para realizar una respuesta, se cierra nuevamente la sesion activa.
	%stack1(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2),stackLogin(Stack2,"SoyNuevoEnStack","123",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4),stackLogin(Stack4,"SoyNuevoEnStack","123",Stack5),answer(Stack5,"05-12-2020",2,"mi respuesta",["lol","dota"],Stack6).
%Logeamos a un usuario que quiera aceptar una respuesta de su pregunta y se acepta con accept.
	%stack1(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2),stackLogin(Stack2,"SoyNuevoEnStack","123",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4),stackLogin(Stack4,"SoyNuevoEnStack","123",Stack5),answer(Stack5,"05-12-2020",2,"mi respuesta",["lol","dota"],Stack6),stackLogin(Stack6,"Dyllan","123",Stack7),accept(Stack7,2,11,Stack8).
%Logeamos a otro usuario que quiera aceptar una respuesta de su pregunta y se acepta con accept.
	%stack1(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2),stackLogin(Stack2,"SoyNuevoEnStack","123",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4),stackLogin(Stack4,"SoyNuevoEnStack","123",Stack5),answer(Stack5,"05-12-2020",2,"mi respuesta",["lol","dota"],Stack6),stackLogin(Stack6,"Ignacio","456",Stack7),accept(Stack7,3,6,Stack8).
%Se realiza stackToString para mostrar todo el stack como string.
	%stack1(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2),stackLogin(Stack2,"SoyNuevoEnStack","123",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4),stackLogin(Stack4,"SoyNuevoEnStack","123",Stack5),answer(Stack5,"05-12-2020",2,"mi respuesta",["lol","dota"],Stack6),stackLogin(Stack6,"Dyllan","123",Stack7),accept(Stack7,2,11,Stack8),stackToString(Stack8,Stack9).
%Se realiza stackToString para mostrar todo el stack como string.
	%stack1(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2),stackLogin(Stack2,"SoyNuevoEnStack","123",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4),stackLogin(Stack4,"SoyNuevoEnStack","123",Stack5),answer(Stack5,"05-12-2020",2,"mi respuesta",["lol","dota"],Stack6),stackLogin(Stack6,"Ignacio","456",Stack7),accept(Stack7,3,6,Stack8),stackToString(Stack8,Stack9).

%Stack2
%Se llama al stack2 y se registra un usuario con el stackRegister.
	%stack2(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2).
%Luego de registrarlo se logea con el stackLogin.
	%stack2(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2),stackLogin(Stack2,"SoyNuevoEnStack","123",Stack3).
%Si esta logeado puede realizar una pregunta y se cierra su sesion activa.
	%stack2(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2),stackLogin(Stack2,"SoyNuevoEnStack","123",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4).
%Se logea dyllan para aceptar una respuesta.
	%stack2(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2),stackLogin(Stack2,"SoyNuevoEnStack","123",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4),stackLogin(Stack4,"Salgado","456",Stack5).
%Acepta una respuesta.
	%caso donde se ingresan bien datos, nombre usuario,clave y si existe pregunta y respuesta.
	%stack2(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2),stackLogin(Stack2,"SoyNuevoEnStack","123",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4),stackLogin(Stack4,"Salgado","456",Stack5),accept(Stack5,2,1,Stack6). 
	%caso donde no existe pregunta o respuesta.
	%stack2(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2),stackLogin(Stack2,"SoyNuevoEnStack","123",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4),stackLogin(Stack4,"Salgado","456",Stack5),accept(Stack5,2,2,Stack6).
%stackToString.
	%Sin sesion activa.
	%stack2(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2),stackLogin(Stack2,"SoyNuevoEnStack","123",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4),stackLogin(Stack4,"Salgado","456",Stack5),accept(Stack5,2,1,Stack6),stackToString(Stack6,StackStr).
	%Con sesion activa.
	%stack2(X), stackRegister(X,"SoyNuevoEnStack","123",Stack2),stackLogin(Stack2,"SoyNuevoEnStack","123",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4),stackLogin(Stack4,"Salgado","456",Stack5),accept(Stack5,2,1,Stack6),stackLogin(Stack6,"Dyllan","123",Stack7),stackToString(Stack7,StackStr).

%Creando Stack desde 0.
%Se crea el stack.
	%crearStack(Stack).
%Registramos a un usuario en el Stack.
	%crearStack(Stack),stackRegister(Stack,"Dyllan","clave123",Stack1).
%Registramos a otro usuario en el Stack.
	%crearStack(Stack),stackRegister(Stack,"Dyllan","clave123",Stack1),stackRegister(Stack1,"Salgado","clave456",Stack2).
%Logeamos a Salgado para formular pregunta.
    %crearStack(Stack),stackRegister(Stack,"Dyllan","clave123",Stack1),stackRegister(Stack1,"Salgado","clave456",Stack2),stackLogin(Stack2,"Salgado","clave456",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4).
%Se logea a Dyllan para responder la pregunta de salgado.
    %crearStack(Stack),stackRegister(Stack,"Dyllan","clave123",Stack1),stackRegister(Stack1,"Salgado","clave456",Stack2),stackLogin(Stack2,"Salgado","clave456",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4),stackLogin(Stack4,"Dyllan","clave123",Stack5), answer(Stack5,"05-12-2020",1,"mi respuesta",["lol","dota"],Stack6).
%Se logea a Salgado para aceptar la respuesta de Dyllan.
	%crearStack(Stack),stackRegister(Stack,"Dyllan","clave123",Stack1),stackRegister(Stack1,"Salgado","clave456",Stack2),stackLogin(Stack2,"Salgado","clave456",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4),stackLogin(Stack4,"Dyllan","clave123",Stack5), answer(Stack5,"05-12-2020",1,"mi respuesta",["lol","dota"],Stack6),stackLogin(Stack6,"Salgado","clave456",Stack7),accept(Stack7,1,1,Stack8).
%Se imprime con usuario activo y sin usuario activo.
	%Con usuario activo: crearStack(Stack),stackRegister(Stack,"Dyllan","clave123",Stack1),stackRegister(Stack1,"Salgado","clave456",Stack2),stackLogin(Stack2,"Salgado","clave456",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4),stackLogin(Stack4,"Dyllan","clave123",Stack5), answer(Stack5,"05-12-2020",1,"mi respuesta",["lol","dota"],Stack6),stackLogin(Stack6,"Salgado","clave456",Stack7),accept(Stack7,1,1,Stack8), stackLogin(Stack8,"Salgado","clave456",Stack9), stackToString(Stack9, StackStr).
	%Sin usuario activo: crearStack(Stack),stackRegister(Stack,"Dyllan","clave123",Stack1),stackRegister(Stack1,"Salgado","clave456",Stack2),stackLogin(Stack2,"Salgado","clave456",Stack3),ask(Stack3,"04-12-2020","preguntita",["prolog","C"],Stack4),stackLogin(Stack4,"Dyllan","clave123",Stack5), answer(Stack5,"05-12-2020",1,"mi respuesta",["lol","dota"],Stack6),stackLogin(Stack6,"Salgado","clave456",Stack7),accept(Stack7,1,1,Stack8), stackToString(Stack8, StackStr).
	