!classDefinition: #TestsMarsRover category: 'MarsRoverTDD'!
TestCase subclass: #TestsMarsRover
	instanceVariableNames: 'marsRover posicionInicial inicialPuntoCardinalInicial posicionFinal inicialPuntoCardinalFinal avanzar retroceder rotarADerecha rotarAIzquierda norte sur este oeste comandoVacio comandoInvalido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:57:40'!
setUp

	comandoVacio _ ''.
	comandoInvalido _ '°'.
	avanzar _ 'f'.
	retroceder _ 'b'.
	rotarADerecha _ 'r'.
	rotarAIzquierda _ 'l'.
	norte _ 'N'.
	sur _ 'S'.
	este _ 'E'.
	oeste _ 'O'
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 00:41:46'!
test01ProcesarComandoVacioNoHaceNada

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ sur.
	
	"marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.	
	marsRover procesarSecuenciaDeComandos: comandoVacio."
	
	"NUEVO"marsRover _ self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial yMoverSegunComandos: comandoVacio.

	"self assert: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover apuntaA: inicialPuntoCardinalInicial)	"
	"NUEVO"self afirmarMarsRover: marsRover estaEnPosicion: posicionInicial yApuntaA: inicialPuntoCardinalInicial.

! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 00:44:50'!
test02AvanzarHaciaElNorteAvanzaCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 1@2.
	inicialPuntoCardinalInicial _ norte.
	
	"marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: avanzar.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: inicialPuntoCardinalInicial)	"
	"NUEVO"self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: avanzar 
		yAsegurarQueLaPosicionFinalEs: posicionFinal

! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:19:34'!
test03AvanzarHaciaElSurAvanzaCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 3@2.
	inicialPuntoCardinalInicial _ sur.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: avanzar.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: inicialPuntoCardinalInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:19:34'!
test04AvanzarHaciaElEsteAvanzaCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 2@3.
	inicialPuntoCardinalInicial _ este.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: avanzar.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: inicialPuntoCardinalInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:19:35'!
test05AvanzarHaciaElOesteAvanzaCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 2@1.
	inicialPuntoCardinalInicial _ oeste.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: avanzar.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: inicialPuntoCardinalInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:19:35'!
test06RetrocederHaciaElNorteRetrocedeCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 3@2.
	inicialPuntoCardinalInicial _ norte.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: retroceder.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: inicialPuntoCardinalInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:19:35'!
test07RetrocederHaciaElSurRetrocedeCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 1@2.
	inicialPuntoCardinalInicial _ sur.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: retroceder.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: inicialPuntoCardinalInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:19:35'!
test08RetrocederHaciaElEsteRetrocedeCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 2@1.
	inicialPuntoCardinalInicial _ este.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: retroceder.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: inicialPuntoCardinalInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:19:35'!
test09RetrocederHaciaElOesteRetrocedeCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 2@3.
	inicialPuntoCardinalInicial _ oeste.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: retroceder.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: inicialPuntoCardinalInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:57:32'!
test10RotarADerechaApuntandoAlNorteTerminaApuntandoAlEste

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ norte.
	inicialPuntoCardinalFinal _ este.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarADerecha.
	
	self deny: (marsRover apuntaA: inicialPuntoCardinalInicial).
	self assert: (marsRover apuntaA: inicialPuntoCardinalFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:57:32'!
test11RotarADerechaApuntandoAlSurTerminaApuntandoAlOeste

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ sur.
	inicialPuntoCardinalFinal _ oeste.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarADerecha.
	
	self deny: (marsRover apuntaA: inicialPuntoCardinalInicial).
	self assert: (marsRover apuntaA: inicialPuntoCardinalFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:57:32'!
test12RotarADerechaApuntandoAlEsteTerminaApuntandoAlSur

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ este.
	inicialPuntoCardinalFinal _ sur.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarADerecha.
	
	self deny: (marsRover apuntaA: inicialPuntoCardinalInicial).
	self assert: (marsRover apuntaA: inicialPuntoCardinalFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:57:32'!
test13RotarADerechaApuntandoAlOesteTerminaApuntandoAlNorte

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ oeste.
	inicialPuntoCardinalFinal _ norte.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarADerecha.
	
	self deny: (marsRover apuntaA: inicialPuntoCardinalInicial).
	self assert: (marsRover apuntaA: inicialPuntoCardinalFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:57:40'!
test14RotarAIzquierdaApuntandoAlNorteTerminaApuntandoAlOeste

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ norte.
	inicialPuntoCardinalFinal _ oeste.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarAIzquierda.
	
	self deny: (marsRover apuntaA: inicialPuntoCardinalInicial).
	self assert: (marsRover apuntaA: inicialPuntoCardinalFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:57:40'!
test15RotarAIzquierdaApuntandoAlSurTerminaApuntandoAlEste

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ sur.
	inicialPuntoCardinalFinal _ este.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarAIzquierda.
	
	self deny: (marsRover apuntaA: inicialPuntoCardinalInicial).
	self assert: (marsRover apuntaA: inicialPuntoCardinalFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:57:40'!
test16RotarAIzquierdaApuntandoAlEsteTerminaApuntandoAlNorte

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ este.
	inicialPuntoCardinalFinal _ norte.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarAIzquierda.
	
	self deny: (marsRover apuntaA: inicialPuntoCardinalInicial).
	self assert: (marsRover apuntaA: inicialPuntoCardinalFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:57:40'!
test17RotarAIzquierdaApuntandoAlOesteTerminaApuntandoAlSur

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ oeste.
	inicialPuntoCardinalFinal _ sur.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarAIzquierda.
	
	self deny: (marsRover apuntaA: inicialPuntoCardinalInicial).
	self assert: (marsRover apuntaA: inicialPuntoCardinalFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:57:40'!
test18SePuedeProcesarUnaSecuenciaDeComandosValidos

	| unaSecuenciaDeComandos |
	unaSecuenciaDeComandos _ rotarADerecha,avanzar,avanzar,comandoVacio,retroceder,rotarADerecha,rotarAIzquierda.
	posicionInicial _ 2@2.
	posicionFinal _ 2@3.
	inicialPuntoCardinalInicial _ norte.
	inicialPuntoCardinalFinal _ este.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	marsRover procesarSecuenciaDeComandos: unaSecuenciaDeComandos.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self deny: (marsRover apuntaA: inicialPuntoCardinalInicial).
	self assert: (marsRover apuntaA: inicialPuntoCardinalFinal)	.! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:57:40'!
test19SecuenciaDondeHayComandosInvalidosDebeLanzarError

	| unaSecuenciaDeComandos |
	posicionInicial _ 2@2.
	posicionFinal _ 2@4.
	inicialPuntoCardinalInicial _ norte.
	inicialPuntoCardinalFinal _ este.
	unaSecuenciaDeComandos _ rotarADerecha,avanzar,avanzar,comandoInvalido,retroceder,rotarAIzquierda.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: inicialPuntoCardinalInicial.
	
	self should: [marsRover procesarSecuenciaDeComandos: unaSecuenciaDeComandos]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
						self assert: anError messageText = marsRover class descripcionDeComandoInvalido.
						self deny: (marsRover estaEnPosicion: posicionInicial).
						self assert: (marsRover estaEnPosicion: posicionFinal)	.
						self deny: (marsRover apuntaA: inicialPuntoCardinalInicial).
						self assert: (marsRover apuntaA: inicialPuntoCardinalFinal)	]
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:19:35'!
test20CrearMarsRoverConPosicionInvalidaDebeLanzarError

	| unaPosicionInicialInvalida |
	unaPosicionInicialInvalida _ 'hola'.
	inicialPuntoCardinalInicial _ norte.
	
	self should: [ MarsRover en: unaPosicionInicialInvalida apuntandoA: inicialPuntoCardinalInicial]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | self assert: anError messageText = MarsRover descripcionDePosicionInicialInvalida]
	
	"Consultar duda en clase, crear este test nos surgio por seguir la heuristica de crear objetos completos y validos"
	"Deberiamos eliminar este test"
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 6/30/2021 23:26:45'!
test21CrearMarsRoverConDireccionInvalidaDebeLanzarError

	| unaDireccionInicialInvalida |
	posicionInicial _ 2@2.
	unaDireccionInicialInvalida _ 'hola'.
	
	self should: [ MarsRover en: posicionInicial apuntandoA: unaDireccionInicialInvalida]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | self assert: anError messageText = MarsRover descripcionDePuntoCardinalInicialInvalida]
	
	
	! !


!TestsMarsRover methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:35:24'!
afirmarMarsRover: unMarsRover estaEnPosicion: unaPosicionFinal yApuntaA: unPuntoCardinalFinal
	
	self assert: (unMarsRover estaEnPosicion: unaPosicionFinal)	.
	self assert: (unMarsRover apuntaA: unPuntoCardinalFinal)	.! !

!TestsMarsRover methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:42:20'!
crearMarsRoverEnPosicion: unaPosicionInicial apuntandoA: unPuntoCardinalInicial moverSegunComandos: secuenciaDeComandos yAsegurarQueLaPosicionFinalEs: unaPosicionFinal

	marsRover _ self crearMarsRoverEnPosicion: posicionInicial apuntandoA: unPuntoCardinalInicial yMoverSegunComandos: secuenciaDeComandos.
	self afirmarMarsRover: marsRover estaEnPosicion: unaPosicionFinal yApuntaA: unPuntoCardinalInicial.! !

!TestsMarsRover methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:42:55'!
crearMarsRoverEnPosicion: unaPosicionInicial apuntandoA: unPuntoCardinalInicial rotarSegunComandos: secuenciaDeComandos yAsegurarQueElPuntoCardinalFinalEs: unPuntoCardinalFinal

	marsRover _ self crearMarsRoverEnPosicion: unaPosicionInicial apuntandoA: unPuntoCardinalInicial yMoverSegunComandos: secuenciaDeComandos.
	self afirmarMarsRover: marsRover estaEnPosicion: unaPosicionInicial yApuntaA: unPuntoCardinalFinal.! !

!TestsMarsRover methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:41:08'!
crearMarsRoverEnPosicion: unaPosicionInicial apuntandoA: unaInicialPuntoCardinalInicial yMoverSegunComandos: unaSecuenciaDeComandos
	
	marsRover _ MarsRover en: unaPosicionInicial apuntandoA: unaInicialPuntoCardinalInicial.
	marsRover procesarSecuenciaDeComandos: unaSecuenciaDeComandos.
	^marsRover! !


!classDefinition: #ComandoMarsRover category: 'MarsRoverTDD'!
Object subclass: #ComandoMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!ComandoMarsRover methodsFor: 'as yet unclassified' stamp: 'SRM 6/30/2021 18:48:32'!
esProcesadoPor: unMarsRover

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoMarsRover class' category: 'MarsRoverTDD'!
ComandoMarsRover class
	instanceVariableNames: ''!

!ComandoMarsRover class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:12:22'!
conComando: unComandoCodificado

	| subclase |
	subclase := self allSubclasses detect: [ :claseActual | claseActual seCodificaEn: unComandoCodificado] 
		ifNone: [self error: MarsRover descripcionDeComandoInvalido].
	^subclase new! !

!ComandoMarsRover class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:12:42'!
seCodificaEn: codificacion

	self subclassResponsibility ! !


!classDefinition: #ComandoAvanzar category: 'MarsRoverTDD'!
ComandoMarsRover subclass: #ComandoAvanzar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!ComandoAvanzar methodsFor: 'as yet unclassified' stamp: 'SRM 6/30/2021 19:36:55'!
esProcesadoPor: unMarsRover

	unMarsRover avanzar
	
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoAvanzar class' category: 'MarsRoverTDD'!
ComandoAvanzar class
	instanceVariableNames: ''!

!ComandoAvanzar class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:13:04'!
seCodificaEn: codificacion

	^codificacion = $f! !


!classDefinition: #ComandoRetroceder category: 'MarsRoverTDD'!
ComandoMarsRover subclass: #ComandoRetroceder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!ComandoRetroceder methodsFor: 'as yet unclassified' stamp: 'SRM 6/30/2021 19:28:43'!
esProcesadoPor: unMarsRover

	unMarsRover retroceder! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRetroceder class' category: 'MarsRoverTDD'!
ComandoRetroceder class
	instanceVariableNames: ''!

!ComandoRetroceder class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:13:09'!
seCodificaEn: codificacion

	^codificacion = $b! !


!classDefinition: #ComandoRotarDerecha category: 'MarsRoverTDD'!
ComandoMarsRover subclass: #ComandoRotarDerecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!ComandoRotarDerecha methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:55:17'!
esProcesadoPor: unMarsRover

	unMarsRover rotarADerecha ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRotarDerecha class' category: 'MarsRoverTDD'!
ComandoRotarDerecha class
	instanceVariableNames: ''!

!ComandoRotarDerecha class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:13:14'!
seCodificaEn: codificacion

	^codificacion = $r! !


!classDefinition: #ComandoRotarIzquierda category: 'MarsRoverTDD'!
ComandoMarsRover subclass: #ComandoRotarIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!ComandoRotarIzquierda methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:02:56'!
esProcesadoPor: unMarsRover

	unMarsRover rotarAIzquierda ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRotarIzquierda class' category: 'MarsRoverTDD'!
ComandoRotarIzquierda class
	instanceVariableNames: ''!

!ComandoRotarIzquierda class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:13:19'!
seCodificaEn: codificacion

	^codificacion = $l! !


!classDefinition: #MarsRover category: 'MarsRoverTDD'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicionActual puntoCardinalActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!MarsRover methodsFor: 'Verificaciones' stamp: 'agg 6/30/2021 23:21:11'!
apuntaA: unaInicialPuntoCardinal
	
	^self inicialPuntoCardinal = unaInicialPuntoCardinal! !

!MarsRover methodsFor: 'Verificaciones' stamp: 'SRM 6/29/2021 17:32:07'!
estaEnPosicion: unaPosicion
	
	^posicionActual = unaPosicion ! !


!MarsRover methodsFor: 'Procesamiento' stamp: 'agg 7/1/2021 00:11:30'!
procesarComandoCodificado: unComandoCodificado

	| comandoDecodificado |
	comandoDecodificado _ ComandoMarsRover conComando: unComandoCodificado.
	comandoDecodificado esProcesadoPor: self

		
		! !

!MarsRover methodsFor: 'Procesamiento' stamp: 'SRM 6/30/2021 18:35:18'!
procesarSecuenciaDeComandos: unaSecuenciaDeComandosCodificada

	unaSecuenciaDeComandosCodificada do: [ :unComandoCodificado | self procesarComandoCodificado: unComandoCodificado]
	! !


!MarsRover methodsFor: 'Inicializacion - privado' stamp: 'agg 6/30/2021 23:50:43'!
inicializarEn: unaPosicionInicial apuntandoA: unPuntoCardinalInicial
	
	posicionActual _ unaPosicionInicial.
	puntoCardinalActual _ unPuntoCardinalInicial! !


!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:50:43'!
avanzar
	puntoCardinalActual seAvanza: self
! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:37:50'!
avanzarHaciaElEste
	posicionActual _ posicionActual + (0@1)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:38:04'!
avanzarHaciaElNorte
	posicionActual _ posicionActual - (1@0)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:38:38'!
avanzarHaciaElOeste
	posicionActual _ posicionActual - (0@1)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:39:11'!
avanzarHaciaElSur
	posicionActual _ posicionActual + (1@0)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:50:43'!
retroceder
	puntoCardinalActual seRetrocede: self
! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:40:38'!
retrocederHaciaElEste
	posicionActual _ posicionActual - (0@1)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:40:06'!
retrocederHaciaElNorte
	posicionActual _ posicionActual + (1@0)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:40:42'!
retrocederHaciaElOeste
	posicionActual _ posicionActual + (0@1)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:40:23'!
retrocederHaciaElSur
	posicionActual _ posicionActual - (1@0)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:59:57'!
rotarADerecha

	puntoCardinalActual seRotaADerecha: self! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:55:26'!
rotarADerechaHaciaElEste
	puntoCardinalActual _ Sur new! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:55:40'!
rotarADerechaHaciaElNorte
	puntoCardinalActual _ Este new! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:55:54'!
rotarADerechaHaciaElOeste
	puntoCardinalActual _ Norte new! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:56:25'!
rotarADerechaHaciaElSur
	puntoCardinalActual _ Oeste new! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 00:06:25'!
rotarAIzquierda

	puntoCardinalActual seRotaAIzquierda: self! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 00:03:30'!
rotarAIzquierdaHaciaElEste

	puntoCardinalActual _ Norte new! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 00:03:43'!
rotarAIzquierdaHaciaElNorte

	puntoCardinalActual _ Oeste new! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 00:03:53'!
rotarAIzquierdaHaciaElOeste

	puntoCardinalActual _ Sur new! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 00:04:05'!
rotarAIzquierdaHaciaElSur

	puntoCardinalActual _ Este new! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:50:43'!
inicialPuntoCardinal
	^(puntoCardinalActual letra)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverTDD'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'Descripciones de error' stamp: 'SRM 6/30/2021 16:04:28'!
descripcionDeComandoInvalido
	
	^'Comando invalido'! !

!MarsRover class methodsFor: 'Descripciones de error' stamp: 'SRM 6/30/2021 17:41:21'!
descripcionDePosicionInicialInvalida

	^'Posicion inicial invalida'! !

!MarsRover class methodsFor: 'Descripciones de error' stamp: 'agg 6/30/2021 23:26:45'!
descripcionDePuntoCardinalInicialInvalida

	^'Punto cardinal inicial invalido'! !


!MarsRover class methodsFor: 'Instanciacion' stamp: 'agg 7/1/2021 00:14:03'!
en: unaPosicionInicial apuntandoA: unaInicialDePuntoCardinal

	| unPuntoCardinalInicial |
	
	"En creacion de objetos no hacer chequeos de tipo porque puede llegar a perjudicar polimorfismo"
	(unaPosicionInicial isKindOf: Point) ifFalse: [self error: self descripcionDePosicionInicialInvalida].	
	
	unPuntoCardinalInicial _ PuntoCardinal conInicial: unaInicialDePuntoCardinal.

	^MarsRover new inicializarEn: unaPosicionInicial apuntandoA: unPuntoCardinalInicial
	! !


!classDefinition: #PuntoCardinal category: 'MarsRoverTDD'!
Object subclass: #PuntoCardinal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:17:33'!
letra
	self subclassResponsibility! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:43:21'!
seAvanza: unMarsRover
	self subclassResponsibility! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:43:26'!
seRetrocede: unMarsRover
	self subclassResponsibility! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:54:29'!
seRotaADerecha: unMarsRover
	self subclassResponsibility! !

!PuntoCardinal methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:05:13'!
seRotaAIzquierda: unMarsRover
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuntoCardinal class' category: 'MarsRoverTDD'!
PuntoCardinal class
	instanceVariableNames: ''!

!PuntoCardinal class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:14:37'!
conInicial: unaInicialDePuntoCardinal

	| subclase |
	subclase := self allSubclasses detect: [ :claseActual | claseActual tieneComoInicialA: unaInicialDePuntoCardinal] 
		ifNone: [self error: MarsRover descripcionDePuntoCardinalInicialInvalida].
	^subclase new! !

!PuntoCardinal class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:14:37'!
tieneComoInicialA: ccc

	self subclassResponsibility ! !


!classDefinition: #Este category: 'MarsRoverTDD'!
PuntoCardinal subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!Este methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:16:56'!
letra
	^'E'! !

!Este methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:37:50'!
seAvanza: unMarsRover
	unMarsRover avanzarHaciaElEste.! !

!Este methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:43:44'!
seRetrocede: unMarsRover
	unMarsRover retrocederHaciaElEste.! !

!Este methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:55:26'!
seRotaADerecha: unMarsRover
	unMarsRover rotarADerechaHaciaElEste.! !

!Este methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:05:29'!
seRotaAIzquierda: unMarsRover
	unMarsRover rotarAIzquierdaHaciaElEste.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Este class' category: 'MarsRoverTDD'!
Este class
	instanceVariableNames: ''!

!Este class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:14:37'!
tieneComoInicialA: ccc

	^ccc = 'E'! !


!classDefinition: #Norte category: 'MarsRoverTDD'!
PuntoCardinal subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!Norte methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:17:08'!
letra
	^'N'! !

!Norte methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:38:04'!
seAvanza: unMarsRover
	unMarsRover avanzarHaciaElNorte.! !

!Norte methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:43:57'!
seRetrocede: unMarsRover
	unMarsRover retrocederHaciaElNorte.! !

!Norte methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:55:40'!
seRotaADerecha: unMarsRover
	unMarsRover rotarADerechaHaciaElNorte.! !

!Norte methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:05:54'!
seRotaAIzquierda: unMarsRover
	unMarsRover rotarAIzquierdaHaciaElNorte.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Norte class' category: 'MarsRoverTDD'!
Norte class
	instanceVariableNames: ''!

!Norte class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:14:37'!
tieneComoInicialA: ccc

	^ccc = 'N'! !


!classDefinition: #Oeste category: 'MarsRoverTDD'!
PuntoCardinal subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:17:14'!
letra
	^'O'! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:38:39'!
seAvanza: unMarsRover
	unMarsRover avanzarHaciaElOeste.! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:44:04'!
seRetrocede: unMarsRover
	unMarsRover retrocederHaciaElOeste.! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:55:54'!
seRotaADerecha: unMarsRover
	unMarsRover rotarADerechaHaciaElOeste.! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:06:00'!
seRotaAIzquierda: unMarsRover
	unMarsRover rotarAIzquierdaHaciaElOeste.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oeste class' category: 'MarsRoverTDD'!
Oeste class
	instanceVariableNames: ''!

!Oeste class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:14:37'!
tieneComoInicialA: ccc

	^ccc = 'O'! !


!classDefinition: #Sur category: 'MarsRoverTDD'!
PuntoCardinal subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!Sur methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:17:19'!
letra
	^'S'! !

!Sur methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:39:11'!
seAvanza: unMarsRover
	unMarsRover avanzarHaciaElSur.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:44:12'!
seRetrocede: unMarsRover
	unMarsRover retrocederHaciaElSur.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:56:26'!
seRotaADerecha: unMarsRover
	unMarsRover rotarADerechaHaciaElSur.! !

!Sur methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:06:06'!
seRotaAIzquierda: unMarsRover
	unMarsRover rotarAIzquierdaHaciaElSur.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sur class' category: 'MarsRoverTDD'!
Sur class
	instanceVariableNames: ''!

!Sur class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:14:37'!
tieneComoInicialA: ccc

	^ccc = 'S'! !
