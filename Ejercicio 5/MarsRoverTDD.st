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

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:31:39'!
test01ProcesarComandoVacioNoHaceNada

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ sur.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: comandoVacio
		yAsegurarQue: [self assert: (marsRover estaEnPosicion: posicionInicial yApuntaA: inicialPuntoCardinalInicial)	.]
	
! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:28:41'!
test02AvanzarHaciaElNorteAvanzaCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 1@2.
	inicialPuntoCardinalInicial _ norte.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: avanzar 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionFinal yApuntaA: inicialPuntoCardinalInicial). ]

! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:33:00'!
test03AvanzarHaciaElSurAvanzaCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 3@2.
	inicialPuntoCardinalInicial _ sur.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: avanzar
		yAsegurarQue: [self assert: (marsRover estaEnPosicion: posicionFinal yApuntaA: inicialPuntoCardinalInicial)	.]

! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:33:45'!
test04AvanzarHaciaElEsteAvanzaCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 2@3.
	inicialPuntoCardinalInicial _ este.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: avanzar 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionFinal yApuntaA: inicialPuntoCardinalInicial). ]
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:34:08'!
test05AvanzarHaciaElOesteAvanzaCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 2@1.
	inicialPuntoCardinalInicial _ oeste.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: avanzar 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionFinal yApuntaA: inicialPuntoCardinalInicial). ]! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:34:47'!
test06RetrocederHaciaElNorteRetrocedeCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 3@2.
	inicialPuntoCardinalInicial _ norte.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: retroceder 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionFinal yApuntaA: inicialPuntoCardinalInicial). ]	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:35:58'!
test07RetrocederHaciaElSurRetrocedeCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 1@2.
	inicialPuntoCardinalInicial _ sur.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: retroceder 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionFinal yApuntaA: inicialPuntoCardinalInicial). ]	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:36:42'!
test08RetrocederHaciaElEsteRetrocedeCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 2@1.
	inicialPuntoCardinalInicial _ este.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: retroceder 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionFinal yApuntaA: inicialPuntoCardinalInicial). ]	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:37:04'!
test09RetrocederHaciaElOesteRetrocedeCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 2@3.
	inicialPuntoCardinalInicial _ oeste.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: retroceder 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionFinal yApuntaA: inicialPuntoCardinalInicial). ]	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:37:39'!
test10RotarADerechaApuntandoAlNorteTerminaApuntandoAlEste

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ norte.
	inicialPuntoCardinalFinal _ este.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: rotarADerecha 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionInicial yApuntaA: inicialPuntoCardinalFinal). ]	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:37:48'!
test11RotarADerechaApuntandoAlSurTerminaApuntandoAlOeste

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ sur.
	inicialPuntoCardinalFinal _ oeste.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: rotarADerecha 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionInicial yApuntaA: inicialPuntoCardinalFinal). ]	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:38:15'!
test12RotarADerechaApuntandoAlEsteTerminaApuntandoAlSur

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ este.
	inicialPuntoCardinalFinal _ sur.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: rotarADerecha 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionInicial yApuntaA: inicialPuntoCardinalFinal). ]	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:38:22'!
test13RotarADerechaApuntandoAlOesteTerminaApuntandoAlNorte

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ oeste.
	inicialPuntoCardinalFinal _ norte.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: rotarADerecha 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionInicial yApuntaA: inicialPuntoCardinalFinal). ]	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:38:39'!
test14RotarAIzquierdaApuntandoAlNorteTerminaApuntandoAlOeste

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ norte.
	inicialPuntoCardinalFinal _ oeste.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: rotarAIzquierda 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionInicial yApuntaA: inicialPuntoCardinalFinal). ]	
	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:38:58'!
test15RotarAIzquierdaApuntandoAlSurTerminaApuntandoAlEste

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ sur.
	inicialPuntoCardinalFinal _ este.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: rotarAIzquierda 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionInicial yApuntaA: inicialPuntoCardinalFinal). ]	
	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:39:07'!
test16RotarAIzquierdaApuntandoAlEsteTerminaApuntandoAlNorte

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ este.
	inicialPuntoCardinalFinal _ norte.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: rotarAIzquierda 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionInicial yApuntaA: inicialPuntoCardinalFinal). ]	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:39:11'!
test17RotarAIzquierdaApuntandoAlOesteTerminaApuntandoAlSur

	posicionInicial _ 2@2.
	inicialPuntoCardinalInicial _ oeste.
	inicialPuntoCardinalFinal _ sur.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: rotarAIzquierda 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionInicial yApuntaA: inicialPuntoCardinalFinal). ]	
	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:40:37'!
test18SePuedeProcesarUnaSecuenciaDeComandosValidos

	| unaSecuenciaDeComandos |
	
	unaSecuenciaDeComandos _ rotarADerecha,avanzar,avanzar,comandoVacio,retroceder,rotarADerecha,rotarAIzquierda.
	posicionInicial _ 2@2.
	posicionFinal _ 2@3.
	inicialPuntoCardinalInicial _ norte.
	inicialPuntoCardinalFinal _ este.
	
	self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
		moverSegunComandos: unaSecuenciaDeComandos 
		yAsegurarQue: [ self assert: (marsRover estaEnPosicion: posicionFinal yApuntaA: inicialPuntoCardinalFinal). ]	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:42:43'!
test19SecuenciaDondeHayComandosInvalidosDebeLanzarError

	| unaSecuenciaDeComandos |
	posicionInicial _ 2@2.
	posicionFinal _ 2@4.
	inicialPuntoCardinalInicial _ norte.
	inicialPuntoCardinalFinal _ este.
	unaSecuenciaDeComandos _ rotarADerecha,avanzar,avanzar,comandoInvalido,retroceder,rotarAIzquierda.
	
	self should: [self crearMarsRoverEnPosicion: posicionInicial apuntandoA: inicialPuntoCardinalInicial
				yMoverSegunComandos: unaSecuenciaDeComandos]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
						self assert: anError messageText = marsRover class descripcionDeComandoInvalido.
						self assert: (marsRover estaEnPosicion: posicionFinal)	.
						self assert: (marsRover apuntaA: inicialPuntoCardinalFinal)	]
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'agg 7/1/2021 09:52:02'!
test20CrearMarsRoverConDireccionInvalidaDebeLanzarError

	| unaDireccionInicialInvalida |
	posicionInicial _ 2@2.
	unaDireccionInicialInvalida _ 'hola'.
	
	self should: [ MarsRover en: posicionInicial apuntandoA: unaDireccionInicialInvalida]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | self assert: anError messageText = MarsRover descripcionDePuntoCardinalInicialInvalida].
	
	"self unaExcepcionDebeSerLanzadaCon:  [ MarsRover en: posicionInicial apuntandoA: unaDireccionInicialInvalida]
		ySeDebeHacer: [ :anError | self assert: anError messageText = MarsRover descripcionDePuntoCardinalInicialInvalida]."	! !


!TestsMarsRover methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 09:26:54'!
crearMarsRoverEnPosicion: unaPosicionInicial apuntandoA: unPuntoCardinalInicial moverSegunComandos: secuenciaDeComandos
yAsegurarQue: unaAfirmacionAAsegurar

	marsRover _ self crearMarsRoverEnPosicion: posicionInicial apuntandoA: unPuntoCardinalInicial yMoverSegunComandos: secuenciaDeComandos.
	unaAfirmacionAAsegurar value	.
! !

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

!MarsRover methodsFor: 'Verificaciones' stamp: 'agg 7/1/2021 09:59:36'!
apuntaA: unaInicialPuntoCardinal
	
	^puntoCardinalActual comienzaCon: unaInicialPuntoCardinal! !

!MarsRover methodsFor: 'Verificaciones' stamp: 'agg 7/1/2021 09:12:57'!
estaEnPosicion: unaPosicion
	
	^posicionActual = unaPosicion ! !

!MarsRover methodsFor: 'Verificaciones' stamp: 'agg 7/1/2021 09:14:17'!
estaEnPosicion: unaPosicion yApuntaA: unaOrientacion
	
	^(self estaEnPosicion: unaPosicion) and: [self apuntaA: unaOrientacion]! !


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


!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 09:53:00'!
avanzar

	puntoCardinalActual seAvanza: self
! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 09:53:06'!
avanzarHaciaElEste

	posicionActual _ posicionActual + (0@1)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 09:53:43'!
avanzarHaciaElNorte

	posicionActual _ posicionActual - (1@0)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 09:59:50'!
avanzarHaciaElOeste

	posicionActual _ posicionActual - (0@1)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 09:59:55'!
avanzarHaciaElSur

	posicionActual _ posicionActual + (1@0)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 09:59:59'!
retroceder

	puntoCardinalActual seRetrocede: self
! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 10:00:08'!
retrocederHaciaElEste

	posicionActual _ posicionActual - (0@1)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 10:00:14'!
retrocederHaciaElNorte

	posicionActual _ posicionActual + (1@0)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 10:00:18'!
retrocederHaciaElOeste

	posicionActual _ posicionActual + (0@1)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 10:00:22'!
retrocederHaciaElSur

	posicionActual _ posicionActual - (1@0)! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 6/30/2021 23:59:57'!
rotarADerecha

	puntoCardinalActual seRotaADerecha: self! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 10:00:29'!
rotarADerechaHaciaElEste

	puntoCardinalActual _ Sur new! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 10:00:35'!
rotarADerechaHaciaElNorte

	puntoCardinalActual _ Este new! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 10:00:40'!
rotarADerechaHaciaElOeste

	puntoCardinalActual _ Norte new! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'agg 7/1/2021 10:00:44'!
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


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverTDD'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'Descripciones de error' stamp: 'SRM 6/30/2021 16:04:28'!
descripcionDeComandoInvalido
	
	^'Comando invalido'! !

!MarsRover class methodsFor: 'Descripciones de error' stamp: 'agg 6/30/2021 23:26:45'!
descripcionDePuntoCardinalInicialInvalida

	^'Punto cardinal inicial invalido'! !


!MarsRover class methodsFor: 'Instanciacion' stamp: 'agg 7/1/2021 09:04:47'!
en: unaPosicionInicial apuntandoA: unaInicialDePuntoCardinal

	| unPuntoCardinalInicial |
	
	unPuntoCardinalInicial _ OrientacionDeMarsRover conInicial: unaInicialDePuntoCardinal.

	^MarsRover new inicializarEn: unaPosicionInicial apuntandoA: unPuntoCardinalInicial
	! !


!classDefinition: #OrientacionDeMarsRover category: 'MarsRoverTDD'!
Object subclass: #OrientacionDeMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!OrientacionDeMarsRover methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 09:56:29'!
comienzaCon: letra
	self subclassResponsibility.! !

!OrientacionDeMarsRover methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:43:21'!
seAvanza: unMarsRover
	self subclassResponsibility! !

!OrientacionDeMarsRover methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:43:26'!
seRetrocede: unMarsRover
	self subclassResponsibility! !

!OrientacionDeMarsRover methodsFor: 'as yet unclassified' stamp: 'agg 6/30/2021 23:54:29'!
seRotaADerecha: unMarsRover
	self subclassResponsibility! !

!OrientacionDeMarsRover methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:05:13'!
seRotaAIzquierda: unMarsRover
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionDeMarsRover class' category: 'MarsRoverTDD'!
OrientacionDeMarsRover class
	instanceVariableNames: ''!

!OrientacionDeMarsRover class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 00:14:37'!
conInicial: unaInicialDePuntoCardinal

	| subclase |
	subclase := self allSubclasses detect: [ :claseActual | claseActual tieneComoInicialA: unaInicialDePuntoCardinal] 
		ifNone: [self error: MarsRover descripcionDePuntoCardinalInicialInvalida].
	^subclase new! !

!OrientacionDeMarsRover class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 10:03:48'!
tieneComoInicialA: inicial

	self subclassResponsibility ! !


!classDefinition: #Este category: 'MarsRoverTDD'!
OrientacionDeMarsRover subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!Este methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 09:57:43'!
comienzaCon: letraAComparar
	^('E' = letraAComparar).! !

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

!Este class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 08:42:55'!
tieneComoInicialA: inicial

	^inicial = 'E'! !


!classDefinition: #Norte category: 'MarsRoverTDD'!
OrientacionDeMarsRover subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!Norte methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 09:58:06'!
comienzaCon: letraAComparar
	^('N' = letraAComparar).! !

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

!Norte class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 08:43:04'!
tieneComoInicialA: inicial

	^inicial = 'N'! !


!classDefinition: #Oeste category: 'MarsRoverTDD'!
OrientacionDeMarsRover subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 09:58:20'!
comienzaCon: letraAComparar
	^('O' = letraAComparar).! !

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

!Oeste class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 08:43:09'!
tieneComoInicialA: inicial

	^inicial = 'O'! !


!classDefinition: #Sur category: 'MarsRoverTDD'!
OrientacionDeMarsRover subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!Sur methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 09:58:36'!
comienzaCon: letraAComparar
	^('S' = letraAComparar).! !

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

!Sur class methodsFor: 'as yet unclassified' stamp: 'agg 7/1/2021 08:43:18'!
tieneComoInicialA: inicial

	^inicial = 'S'! !
