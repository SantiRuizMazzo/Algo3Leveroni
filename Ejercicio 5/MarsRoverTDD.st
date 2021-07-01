!classDefinition: #TestsMarsRover category: 'MarsRoverTDD'!
TestCase subclass: #TestsMarsRover
	instanceVariableNames: 'marsRover posicionInicial direccionInicial posicionFinal direccionFinal avanzar retroceder rotarDerecha rotarIzquierda norte sur este oeste comandoVacio comandoInvalido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 10:06:14'!
setUp

	comandoVacio _ ''.
	comandoInvalido _ '°'.
	avanzar _ 'f'.
	retroceder _ 'b'.
	rotarDerecha _ 'r'.
	rotarIzquierda _ 'l'.
	norte _ 'N'.
	sur _ 'S'.
	este _ 'E'.
	oeste _ 'O'
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:14:31'!
test01ProcesarComandoVacioNoHaceNada

	posicionInicial _ 2@2.
	direccionInicial _ sur.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: comandoVacio.
	
	self assert: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover apuntaA: direccionInicial)! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:14:42'!
test02AvanzarHaciaElNorteAvanzaCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 1@2.
	direccionInicial _ norte.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: avanzar.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: direccionInicial)	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:14:42'!
test03AvanzarHaciaElSurAvanzaCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 3@2.
	direccionInicial _ sur.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: avanzar.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: direccionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:14:42'!
test04AvanzarHaciaElEsteAvanzaCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 2@3.
	direccionInicial _ este.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: avanzar.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: direccionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:14:42'!
test05AvanzarHaciaElOesteAvanzaCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 2@1.
	direccionInicial _ oeste.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: avanzar.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: direccionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:14:43'!
test06RetrocederHaciaElNorteRetrocedeCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 3@2.
	direccionInicial _ norte.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: retroceder.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: direccionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:14:42'!
test07RetrocederHaciaElSurRetrocedeCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 1@2.
	direccionInicial _ sur.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: retroceder.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: direccionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:14:42'!
test08RetrocederHaciaElEsteRetrocedeCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 2@1.
	direccionInicial _ este.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: retroceder.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: direccionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:14:42'!
test09RetrocederHaciaElOesteRetrocedeCorrectamente

	posicionInicial _ 2@2.
	posicionFinal _ 2@3.
	direccionInicial _ oeste.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: retroceder.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self assert: (marsRover apuntaA: direccionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:15:09'!
test10RotarADerechaApuntandoAlNorteTerminaApuntandoAlEste

	posicionInicial _ 2@2.
	direccionInicial _ norte.
	direccionFinal _ este.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarDerecha.
	
	self deny: (marsRover apuntaA: direccionInicial).
	self assert: (marsRover apuntaA: direccionFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:15:09'!
test11RotarADerechaApuntandoAlSurTerminaApuntandoAlOeste

	posicionInicial _ 2@2.
	direccionInicial _ sur.
	direccionFinal _ oeste.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarDerecha.
	
	self deny: (marsRover apuntaA: direccionInicial).
	self assert: (marsRover apuntaA: direccionFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:15:09'!
test12RotarADerechaApuntandoAlEsteTerminaApuntandoAlSur

	posicionInicial _ 2@2.
	direccionInicial _ este.
	direccionFinal _ sur.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarDerecha.
	
	self deny: (marsRover apuntaA: direccionInicial).
	self assert: (marsRover apuntaA: direccionFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:15:09'!
test13RotarADerechaApuntandoAlOesteTerminaApuntandoAlNorte

	posicionInicial _ 2@2.
	direccionInicial _ oeste.
	direccionFinal _ norte.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarDerecha.
	
	self deny: (marsRover apuntaA: direccionInicial).
	self assert: (marsRover apuntaA: direccionFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:15:09'!
test14RotarAIzquierdaApuntandoAlNorteTerminaApuntandoAlOeste

	posicionInicial _ 2@2.
	direccionInicial _ norte.
	direccionFinal _ oeste.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarIzquierda.
	
	self deny: (marsRover apuntaA: direccionInicial).
	self assert: (marsRover apuntaA: direccionFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:15:09'!
test15RotarAIzquierdaApuntandoAlSurTerminaApuntandoAlEste

	posicionInicial _ 2@2.
	direccionInicial _ sur.
	direccionFinal _ este.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarIzquierda.
	
	self deny: (marsRover apuntaA: direccionInicial).
	self assert: (marsRover apuntaA: direccionFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:15:09'!
test16RotarAIzquierdaApuntandoAlEsteTerminaApuntandoAlNorte

	posicionInicial _ 2@2.
	direccionInicial _ este.
	direccionFinal _ norte.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarIzquierda.
	
	self deny: (marsRover apuntaA: direccionInicial).
	self assert: (marsRover apuntaA: direccionFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:15:09'!
test17RotarAIzquierdaApuntandoAlOesteTerminaApuntandoAlSur

	posicionInicial _ 2@2.
	direccionInicial _ oeste.
	direccionFinal _ sur.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: rotarIzquierda.
	
	self deny: (marsRover apuntaA: direccionInicial).
	self assert: (marsRover apuntaA: direccionFinal)	.
	self assert: (marsRover estaEnPosicion: posicionInicial)	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:14:30'!
test18ProcesarComandoInvalidoDebeLanzarError

	posicionInicial _ 2@2.
	direccionInicial _ oeste.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
		
	self should: [marsRover procesarSecuenciaDeComandos: comandoInvalido]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | self assert: anError messageText = marsRover class descripcionDeComandoInvalido.
						            self assert: (marsRover apuntaA: direccionInicial)	.
							     self assert: (marsRover estaEnPosicion: posicionInicial)	]
		! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 16:15:09'!
test19SePuedeProcesarUnaSecuenciaDeComandosValidos

	| unaSecuenciaDeComandos |
	unaSecuenciaDeComandos _ rotarDerecha,avanzar,avanzar,comandoVacio,retroceder,rotarDerecha,rotarIzquierda.
	posicionInicial _ 2@2.
	posicionFinal _ 2@3.
	direccionInicial _ norte.
	direccionFinal _ este.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	marsRover procesarSecuenciaDeComandos: unaSecuenciaDeComandos.
	
	self deny: (marsRover estaEnPosicion: posicionInicial).
	self assert: (marsRover estaEnPosicion: posicionFinal)	.
	self deny: (marsRover apuntaA: direccionInicial).
	self assert: (marsRover apuntaA: direccionFinal)	.
	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 21:04:29'!
test20

	"Es mas interesante el caso que testea este test que el 18, por ende como nos paso de una, significa que posiblemente ya testeamos esto,
	por lo tanto borraria el test 18 que es menos interesante y prueba el comando invalido tambien"
	| unaSecuenciaDeComandos |
	posicionInicial _ 2@2.
	posicionFinal _ 2@4.
	direccionInicial _ norte.
	direccionFinal _ este.
	unaSecuenciaDeComandos _ rotarDerecha,avanzar,avanzar,comandoInvalido,retroceder,rotarIzquierda.
	
	marsRover _ MarsRover en: posicionInicial apuntandoA: direccionInicial.
	
	self should: [marsRover procesarSecuenciaDeComandos: unaSecuenciaDeComandos]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
						self assert: anError messageText = marsRover class descripcionDeComandoInvalido.
						self deny: (marsRover estaEnPosicion: posicionInicial).
						self assert: (marsRover estaEnPosicion: posicionFinal)	.
						self deny: (marsRover apuntaA: direccionInicial).
						self assert: (marsRover apuntaA: direccionFinal)	]
	
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 21:03:43'!
test21CrearMarsRoverConPosicionInvalidaDebeLanzarError

	| unaPosicionInicialInvalida |
	unaPosicionInicialInvalida _ 'hola'.
	direccionInicial _ norte.
	
	self should: [ MarsRover en: unaPosicionInicialInvalida apuntandoA: direccionInicial]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | self assert: anError messageText = MarsRover descripcionDePosicionInicialInvalida]
	
	"Consultar duda en clase, crear este test nos surgio por seguir la heuristica de crear objetos completos y validos"
	"Deberiamos eliminar este test"
	! !

!TestsMarsRover methodsFor: 'tests' stamp: 'SRM 6/30/2021 21:03:12'!
test22CrearMarsRoverConDireccionInvalidaDebeLanzarError

	| unaDireccionInicialInvalida |
	posicionInicial _ 2@2.
	unaDireccionInicialInvalida _ 'hola'.
	
	self should: [ MarsRover en: posicionInicial apuntandoA: unaDireccionInicialInvalida]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | self assert: anError messageText = MarsRover descripcionDeDireccionInicialInvalida]
	
	
	! !


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

!ComandoMarsRover class methodsFor: 'as yet unclassified' stamp: 'SRM 6/30/2021 19:03:46'!
xxx: unComandoCodificado

	| subclase |
	subclase := self allSubclasses detect: [ :claseActual | claseActual yyy: unComandoCodificado] 
		ifNone: [self error: MarsRover descripcionDeComandoInvalido].
	^subclase new! !

!ComandoMarsRover class methodsFor: 'as yet unclassified' stamp: 'SRM 6/30/2021 19:04:37'!
yyy: zzz

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

!ComandoAvanzar class methodsFor: 'as yet unclassified' stamp: 'SRM 6/30/2021 19:05:26'!
yyy: zzz

	^zzz = $f! !


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

!ComandoRetroceder class methodsFor: 'as yet unclassified' stamp: 'SRM 6/30/2021 19:05:47'!
yyy: zzz

	^zzz = $b! !


!classDefinition: #ComandoRotarDerecha category: 'MarsRoverTDD'!
ComandoMarsRover subclass: #ComandoRotarDerecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!ComandoRotarDerecha methodsFor: 'as yet unclassified' stamp: 'SRM 6/30/2021 19:29:03'!
esProcesadoPor: unMarsRover

	unMarsRover rotarDerecha ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRotarDerecha class' category: 'MarsRoverTDD'!
ComandoRotarDerecha class
	instanceVariableNames: ''!

!ComandoRotarDerecha class methodsFor: 'as yet unclassified' stamp: 'SRM 6/30/2021 19:06:01'!
yyy: zzz

	^zzz = $r! !


!classDefinition: #ComandoRotarIzquierda category: 'MarsRoverTDD'!
ComandoMarsRover subclass: #ComandoRotarIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!ComandoRotarIzquierda methodsFor: 'as yet unclassified' stamp: 'SRM 6/30/2021 19:29:14'!
esProcesadoPor: unMarsRover

	unMarsRover rotarIzquierda ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRotarIzquierda class' category: 'MarsRoverTDD'!
ComandoRotarIzquierda class
	instanceVariableNames: ''!

!ComandoRotarIzquierda class methodsFor: 'as yet unclassified' stamp: 'SRM 6/30/2021 19:06:06'!
yyy: zzz

	^zzz = $l! !


!classDefinition: #MarsRover category: 'MarsRoverTDD'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicionActual direccionActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!MarsRover methodsFor: 'Verificaciones' stamp: 'SRM 6/29/2021 18:34:25'!
apuntaA: unaDireccion
	
	^direccionActual = unaDireccion! !

!MarsRover methodsFor: 'Verificaciones' stamp: 'SRM 6/29/2021 17:32:07'!
estaEnPosicion: unaPosicion
	
	^posicionActual = unaPosicion ! !


!MarsRover methodsFor: 'Procesamiento' stamp: 'SRM 6/30/2021 19:34:49'!
procesarComandoCodificado: unComandoCodificado

	| comandoDecodificado |
	comandoDecodificado _ ComandoMarsRover xxx: unComandoCodificado.
	comandoDecodificado esProcesadoPor: self

		
		! !

!MarsRover methodsFor: 'Procesamiento' stamp: 'SRM 6/30/2021 18:35:18'!
procesarSecuenciaDeComandos: unaSecuenciaDeComandosCodificada

	unaSecuenciaDeComandosCodificada do: [ :unComandoCodificado | self procesarComandoCodificado: unComandoCodificado]
	! !


!MarsRover methodsFor: 'Inicializacion - privado' stamp: 'SRM 6/30/2021 21:02:51'!
inicializarEn: unaPosicionInicial apuntandoA: unaDireccionInicial 

	"En creacion de objetos no hacer chequeos de tipo porque puede llegar a perjudicar polimorfismo"
	"(unaPosicionInicial isKindOf: Point) ifFalse: [self error: self class descripcionDePosicionInicialInvalida].	"
	(unaDireccionInicial ~= 'N' and: [unaDireccionInicial ~= 'S'] and: [unaDireccionInicial ~= 'E'] and: [unaDireccionInicial ~= 'O']) 
		ifTrue: [self error: self class  descripcionDeDireccionInicialInvalida].
	"Pero en el chequeo de las direcciones esta bien"
	"Chequeos mejor del lado de la clase (en:apuntandoA:)"
	
	posicionActual _ unaPosicionInicial.
	direccionActual _ unaDireccionInicial! !


!MarsRover methodsFor: 'Movimientos - privado' stamp: 'SRM 6/30/2021 19:49:40'!
avanzar

	"direccion seAvanza: self
	
seAvanza: unMarsRover
	
	unMarsRover seAvanzaHaciaElNorte"

	direccionActual = 'N' ifTrue: [posicionActual _ posicionActual - (1@0)].
    	direccionActual = 'S' ifTrue: [posicionActual _ posicionActual + (1@0)].
    	direccionActual = 'E' ifTrue: [	posicionActual _ posicionActual + (0@1)].
    	direccionActual = 'O' ifTrue: [posicionActual _ posicionActual - (0@1)]! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'SRM 6/30/2021 19:26:26'!
retroceder

	direccionActual = 'N' ifTrue:	 [posicionActual _ posicionActual + (1@0)].
    	direccionActual = 'S' ifTrue: [	posicionActual _ posicionActual - (1@0)].
   	direccionActual = 'E' ifTrue: [	posicionActual _ posicionActual - (0@1)].
    	direccionActual = 'O' ifTrue: [	posicionActual _ posicionActual + (0@1)]! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'SRM 6/30/2021 19:27:23'!
rotarDerecha

	direccionActual = 'N' ifTrue:	 [direccionActual _ 'E'] 
						ifFalse: [	direccionActual = 'S' ifTrue:	 [direccionActual _ 'O'] 
							ifFalse: [direccionActual = 'E' ifTrue:	 [direccionActual _ 'S']
								ifFalse: [direccionActual = 'O' ifTrue:	 [direccionActual _ 'N']]]]! !

!MarsRover methodsFor: 'Movimientos - privado' stamp: 'SRM 6/30/2021 19:28:18'!
rotarIzquierda

	direccionActual = 'N' ifTrue:	 [direccionActual _ 'O'] 
						ifFalse: [	direccionActual = 'S' ifTrue:	 [direccionActual _ 'E'] 
							ifFalse: [direccionActual = 'E' ifTrue:	 [direccionActual _ 'N']
								ifFalse: [direccionActual = 'O' ifTrue:	 [direccionActual _ 'S']]]]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverTDD'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'Descripciones de error' stamp: 'SRM 6/30/2021 16:04:28'!
descripcionDeComandoInvalido
	
	^'Comando invalido'! !

!MarsRover class methodsFor: 'Descripciones de error' stamp: 'SRM 6/30/2021 17:49:24'!
descripcionDeDireccionInicialInvalida

	^'Direccion inicial invalida'! !

!MarsRover class methodsFor: 'Descripciones de error' stamp: 'SRM 6/30/2021 17:41:21'!
descripcionDePosicionInicialInvalida

	^'Posicion inicial invalida'! !


!MarsRover class methodsFor: 'Instanciacion' stamp: 'SRM 6/30/2021 17:44:31'!
en: unaPosicionInicial apuntandoA: unaDireccionInicial

	^MarsRover new inicializarEn: unaPosicionInicial apuntandoA: unaDireccionInicial
	! !
