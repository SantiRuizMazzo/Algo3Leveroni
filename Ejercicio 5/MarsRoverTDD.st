!classDefinition: #TestsMarsRover category: 'MarsRoverTDD'!
TestCase subclass: #TestsMarsRover
	instanceVariableNames: 'marsRover posicionInicial posicionFinal avanzar retroceder rotarADerecha rotarAIzquierda norte sur este oeste comandoVacio comandoInvalido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:35:09'!
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

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:32:30'!
test01EjecutarSecuenciaDeComandosVaciaNoHaceNada

	posicionInicial _ 2@2.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: sur
	      yEjecutar: comandoVacio
	      queDebeCumplir: [self assert: (marsRover estaEn: posicionInicial yApuntaA: sur)	]
	
! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:34:40'!
test02AvanzarApuntandoAlNorteTerminaEnPosicionEsperada

	posicionInicial _ 2@2.
	posicionFinal _ 2@3.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: norte
	      yEjecutar: avanzar 
	      queDebeCumplir: [ self assert: (marsRover estaEn: posicionFinal yApuntaA: norte)]

! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:34:40'!
test03AvanzarApuntandoAlSurTerminaEnPosicionEsperada

	posicionInicial _ 2@2.
	posicionFinal _ 2@1.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: sur
	      yEjecutar: avanzar
	      queDebeCumplir: [self assert: (marsRover estaEn: posicionFinal yApuntaA: sur)	]

! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:34:40'!
test04AvanzarApuntandoAlEsteTerminaEnPosicionEsperada

	posicionInicial _ 2@2.
	posicionFinal _ 3@2.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: este
	      yEjecutar: avanzar 
	      queDebeCumplir: [ self assert: (marsRover estaEn: posicionFinal yApuntaA: este)]
	! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:34:40'!
test05AvanzarApuntandoAlOesteTerminaEnPosicionEsperada

	posicionInicial _ 2@2.
	posicionFinal _ 1@2.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: oeste
	      yEjecutar: avanzar 
	      queDebeCumplir: [ self assert: (marsRover estaEn: posicionFinal yApuntaA: oeste)]! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:34:51'!
test06RetrocederApuntandoAlNorteTerminaEnPosicionEsperada

	posicionInicial _ 2@2.
	posicionFinal _ 2@1.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: norte
	      yEjecutar: retroceder 
	      queDebeCumplir: [ self assert: (marsRover estaEn: posicionFinal yApuntaA: norte)]	! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:34:51'!
test07RetrocederApuntandoAlSurTerminaEnPosicionEsperada

	posicionInicial _ 2@2.
	posicionFinal _ 2@3.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: sur
		yEjecutar: retroceder 
		queDebeCumplir: [ self assert: (marsRover estaEn: posicionFinal yApuntaA: sur)]	! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:34:51'!
test08RetrocederApuntandoAlEsteTerminaEnPosicionEsperada

	posicionInicial _ 2@2.
	posicionFinal _ 1@2.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: este
		yEjecutar: retroceder 
		queDebeCumplir: [ self assert: (marsRover estaEn: posicionFinal yApuntaA: este)]	
	! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:34:51'!
test09RetrocederApuntandoAlOesteTerminaEnPosicionEsperada

	posicionInicial _ 2@2.
	posicionFinal _ 3@2.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: oeste
		yEjecutar: retroceder 
		queDebeCumplir: [ self assert: (marsRover estaEn: posicionFinal yApuntaA: oeste)]	
	! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:35:01'!
test10RotarADerechaApuntandoAlNorteTerminaApuntandoAlEste

	posicionInicial _ 2@2.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: norte
		yEjecutar: rotarADerecha 
		queDebeCumplir: [ self assert: (marsRover estaEn: posicionInicial yApuntaA: este)]	
	! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:35:01'!
test11RotarADerechaApuntandoAlSurTerminaApuntandoAlOeste

	posicionInicial _ 2@2.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: sur
		yEjecutar: rotarADerecha 
		queDebeCumplir: [ self assert: (marsRover estaEn: posicionInicial yApuntaA: oeste)]	
	! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:35:01'!
test12RotarADerechaApuntandoAlEsteTerminaApuntandoAlSur

	posicionInicial _ 2@2.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: este
		yEjecutar: rotarADerecha 
		queDebeCumplir: [ self assert: (marsRover estaEn: posicionInicial yApuntaA: sur)]	
	! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:35:01'!
test13RotarADerechaApuntandoAlOesteTerminaApuntandoAlNorte

	posicionInicial _ 2@2.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: oeste
		yEjecutar: rotarADerecha 
		queDebeCumplir: [ self assert: (marsRover estaEn: posicionInicial yApuntaA: norte)]	
	! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:35:09'!
test14RotarAIzquierdaApuntandoAlNorteTerminaApuntandoAlOeste

	posicionInicial _ 2@2.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: norte
		yEjecutar: rotarAIzquierda 
		queDebeCumplir: [ self assert: (marsRover estaEn: posicionInicial yApuntaA: oeste)]	
	
	! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:35:09'!
test15RotarAIzquierdaApuntandoAlSurTerminaApuntandoAlEste

	posicionInicial _ 2@2.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: sur
		yEjecutar: rotarAIzquierda 
		queDebeCumplir: [ self assert: (marsRover estaEn: posicionInicial yApuntaA: este)]	
	
	! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:35:09'!
test16RotarAIzquierdaApuntandoAlEsteTerminaApuntandoAlNorte

	posicionInicial _ 2@2.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: este
		yEjecutar: rotarAIzquierda 
		queDebeCumplir: [ self assert: (marsRover estaEn: posicionInicial yApuntaA: norte)]	
	! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:35:09'!
test17RotarAIzquierdaApuntandoAlOesteTerminaApuntandoAlSur

	posicionInicial _ 2@2.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: oeste
		yEjecutar: rotarAIzquierda 
		queDebeCumplir: [ self assert: (marsRover estaEn: posicionInicial yApuntaA: sur)]	
	
	! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:35:59'!
test18SePuedeEjecutarSecuenciaDeMasDeUnComandoValido

	| unaSecuenciaDeComandos |
	unaSecuenciaDeComandos _ 	rotarADerecha,avanzar,avanzar,retroceder,rotarADerecha,rotarAIzquierda.
	posicionInicial _ 2@2.
	posicionFinal _ 3@2.
	
	self crearMarsRoverEn: posicionInicial apuntandoA: norte
		yEjecutar: unaSecuenciaDeComandos 
		queDebeCumplir: [ self assert: (marsRover estaEn: posicionFinal yApuntaA: este)]	
	! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:35:09'!
test19EjecutarSecuenciaDondeHayUnComandoInvalidoDebeLanzarUnError

	| unaSecuenciaDeComandos |
	unaSecuenciaDeComandos _ 	rotarADerecha,avanzar,avanzar,comandoInvalido,retroceder,rotarAIzquierda.
	posicionInicial _ 2@2.
	posicionFinal _ 4@2.
	
	self seDebeLanzarUnErrorCon: [self crearMarsRoverEn: posicionInicial apuntandoA: norte
								   yEjecutar: unaSecuenciaDeComandos] 
		ySeDebeCumplir: [ :anError | self assert: anError messageText = marsRover class descripcionDeComandoInvalido.
							    self assert: (marsRover estaEn: posicionFinal yApuntaA: este)	]
					
	! !

!TestsMarsRover methodsFor: 'Tests' stamp: 'SRM 7/1/2021 17:32:03'!
test20CrearMarsRoverConDireccionInvalidaDebeLanzarUnError

	| unaDireccionInicialInvalida |
	posicionInicial _ 2@2.
	unaDireccionInicialInvalida _ 'hola'.
	
	self seDebeLanzarUnErrorCon: [ MarsRover en: posicionInicial apuntandoA: unaDireccionInicialInvalida]		
	      ySeDebeCumplir: [ :anError | self assert: anError messageText = MarsRover descripcionDePuntoCardinalInicialInvalido]
! !


!TestsMarsRover methodsFor: 'Eliminacion codigo repetido' stamp: 'SRM 7/1/2021 15:39:20'!
crearMarsRoverEn: unaPosicionInicial apuntandoA: unaPuntoCardinalInicial yEjecutar: unaSecuenciaDeComandos
	
	marsRover _ MarsRover en: unaPosicionInicial apuntandoA: unaPuntoCardinalInicial.
	marsRover ejecutar: unaSecuenciaDeComandos! !

!TestsMarsRover methodsFor: 'Eliminacion codigo repetido' stamp: 'SRM 7/1/2021 17:32:29'!
crearMarsRoverEn: unaPosicionInicial apuntandoA: unPuntoCardinalInicial yEjecutar: unaSecuenciaDeComandos
queDebeCumplir: unBloqueDeAfirmaciones

	self crearMarsRoverEn: unaPosicionInicial apuntandoA: unPuntoCardinalInicial yEjecutar: unaSecuenciaDeComandos.
	unBloqueDeAfirmaciones value	
! !

!TestsMarsRover methodsFor: 'Eliminacion codigo repetido' stamp: 'SRM 7/1/2021 17:32:03'!
seDebeLanzarUnErrorCon: unBloqueDeCodigo		ySeDebeCumplir: unBloqueDeAfirmaciones

	self should: unBloqueDeCodigo raise: Error - MessageNotUnderstood withExceptionDo: unBloqueDeAfirmaciones

	! !


!classDefinition: #ComandoDeMarsRover category: 'MarsRoverTDD'!
Object subclass: #ComandoDeMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!ComandoDeMarsRover methodsFor: 'Ejecucion' stamp: 'SRM 7/1/2021 16:56:48'!
serEjecutadoPor: unMarsRover

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoDeMarsRover class' category: 'MarsRoverTDD'!
ComandoDeMarsRover class
	instanceVariableNames: ''!

!ComandoDeMarsRover class methodsFor: 'Verificacion' stamp: 'SRM 7/1/2021 16:00:37'!
estaAsociadaA: unaClaveDeComando

	self subclassResponsibility ! !


!ComandoDeMarsRover class methodsFor: 'Instanciacion' stamp: 'SRM 7/1/2021 16:00:37'!
segun: unaClaveDeComando

	| subclaseDeComando |
	subclaseDeComando _ self allSubclasses detect: [ :unaSubclase | unaSubclase estaAsociadaA: unaClaveDeComando] 
		ifNone: [self error: MarsRover descripcionDeComandoInvalido].
	^subclaseDeComando new! !


!classDefinition: #ComandoAvanzar category: 'MarsRoverTDD'!
ComandoDeMarsRover subclass: #ComandoAvanzar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!ComandoAvanzar methodsFor: 'Ejecucion' stamp: 'SRM 7/1/2021 16:56:48'!
serEjecutadoPor: unMarsRover

	unMarsRover avanzar! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoAvanzar class' category: 'MarsRoverTDD'!
ComandoAvanzar class
	instanceVariableNames: ''!

!ComandoAvanzar class methodsFor: 'Verificacion' stamp: 'SRM 7/1/2021 16:00:37'!
estaAsociadaA: unaClaveDeComando

	^unaClaveDeComando = $f! !


!classDefinition: #ComandoRetroceder category: 'MarsRoverTDD'!
ComandoDeMarsRover subclass: #ComandoRetroceder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!ComandoRetroceder methodsFor: 'Ejecucion' stamp: 'SRM 7/1/2021 16:56:48'!
serEjecutadoPor: unMarsRover

	unMarsRover retroceder! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRetroceder class' category: 'MarsRoverTDD'!
ComandoRetroceder class
	instanceVariableNames: ''!

!ComandoRetroceder class methodsFor: 'Verificacion' stamp: 'SRM 7/1/2021 16:00:37'!
estaAsociadaA: unaClaveDeComando

	^unaClaveDeComando = $b! !


!classDefinition: #ComandoRotarDerecha category: 'MarsRoverTDD'!
ComandoDeMarsRover subclass: #ComandoRotarDerecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!ComandoRotarDerecha methodsFor: 'Ejecucion' stamp: 'SRM 7/1/2021 16:56:48'!
serEjecutadoPor: unMarsRover

	unMarsRover rotarADerecha! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRotarDerecha class' category: 'MarsRoverTDD'!
ComandoRotarDerecha class
	instanceVariableNames: ''!

!ComandoRotarDerecha class methodsFor: 'Verificacion' stamp: 'SRM 7/1/2021 16:00:37'!
estaAsociadaA: unaClaveDeComando

	^unaClaveDeComando = $r! !


!classDefinition: #ComandoRotarIzquierda category: 'MarsRoverTDD'!
ComandoDeMarsRover subclass: #ComandoRotarIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!ComandoRotarIzquierda methodsFor: 'Ejecucion' stamp: 'SRM 7/1/2021 16:56:48'!
serEjecutadoPor: unMarsRover

	unMarsRover rotarAIzquierda! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ComandoRotarIzquierda class' category: 'MarsRoverTDD'!
ComandoRotarIzquierda class
	instanceVariableNames: ''!

!ComandoRotarIzquierda class methodsFor: 'Verificacion' stamp: 'SRM 7/1/2021 16:00:37'!
estaAsociadaA: unaClaveDeComando

	^unaClaveDeComando = $l! !


!classDefinition: #MarsRover category: 'MarsRoverTDD'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicionActual orientacionActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!MarsRover methodsFor: 'Verificaciones' stamp: 'SRM 7/1/2021 16:53:10'!
estaEn: unaPosicion yApuntaA: unPuntoCardinal
	
	^(unaPosicion = posicionActual) and: [orientacionActual apuntaA: unPuntoCardinal]! !


!MarsRover methodsFor: 'Ejecucion comandos' stamp: 'SRM 7/1/2021 17:18:38'!
ejecutar: unaSecuenciaDeComandos

	unaSecuenciaDeComandos do: [ :unaClaveDeComando | self ejecutarSegun: unaClaveDeComando]
	! !


!MarsRover methodsFor: 'Inicializacion - privado' stamp: 'SRM 7/1/2021 16:26:07'!
inicializarEn: unaPosicionInicial con: unaOrientacionInicial
	
	posicionActual _ unaPosicionInicial.
	orientacionActual _ unaOrientacionInicial! !


!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 17:00:40'!
avanzar

	orientacionActual guiarAvanceDe: self! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 17:21:28'!
avanzarApuntandoAlEste

	posicionActual _ posicionActual + (1@0)! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 17:21:45'!
avanzarApuntandoAlNorte

	posicionActual _ posicionActual + (0@1)! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 17:22:07'!
avanzarApuntandoAlOeste

	posicionActual _ posicionActual - (1@0)! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 17:22:26'!
avanzarApuntandoAlSur

	posicionActual _ posicionActual - (0@1)! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 16:56:48'!
ejecutarSegun: unaClaveDeComando

	| unComando |
	unComando _ ComandoDeMarsRover segun: unaClaveDeComando.
	unComando serEjecutadoPor: self

		
		! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 17:06:19'!
retroceder

	orientacionActual guiarRetrocesoDe: self! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 17:22:45'!
retrocederApuntandoAlEste

	posicionActual _ posicionActual - (1@0)! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 17:22:59'!
retrocederApuntandoAlNorte

	posicionActual _ posicionActual - (0@1)! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 17:23:09'!
retrocederApuntandoAlOeste

	posicionActual _ posicionActual + (1@0)! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 17:23:32'!
retrocederApuntandoAlSur

	posicionActual _ posicionActual + (0@1)! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 17:06:46'!
rotarADerecha

	orientacionActual guiarRotacionADerechaDe: self! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 18:40:12'!
rotarADerechaApuntandoAlEste

	orientacionActual _ OrientacionSur new! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 18:40:22'!
rotarADerechaApuntandoAlNorte

	orientacionActual _ OrientacionEste new! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 18:40:32'!
rotarADerechaApuntandoAlOeste

	orientacionActual _ OrientacionNorte new! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 18:41:24'!
rotarADerechaApuntandoAlSur

	orientacionActual _ OrientacionOeste new! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 17:07:37'!
rotarAIzquierda

	orientacionActual guiarRotacionAIzquierdaDe: self! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 18:41:44'!
rotarAIzquierdaApuntandoAlEste

	orientacionActual _ OrientacionNorte new! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 18:42:02'!
rotarAIzquierdaApuntandoAlNorte

	orientacionActual _ OrientacionOeste new! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 18:42:13'!
rotarAIzquierdaApuntandoAlOeste

	orientacionActual _ OrientacionSur new! !

!MarsRover methodsFor: 'Ejecucion comandos - privado' stamp: 'SRM 7/1/2021 18:42:30'!
rotarAIzquierdaApuntandoAlSur

	orientacionActual _ OrientacionEste new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverTDD'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'Descripciones de error' stamp: 'SRM 7/1/2021 17:19:20'!
descripcionDeComandoInvalido

	^'Comando invalido'! !

!MarsRover class methodsFor: 'Descripciones de error' stamp: 'SRM 7/1/2021 16:17:12'!
descripcionDePuntoCardinalInicialInvalido

	^'Punto cardinal inicial invalido'! !


!MarsRover class methodsFor: 'Instanciacion' stamp: 'SRM 7/1/2021 16:24:35'!
en: unaPosicionInicial apuntandoA: unPuntoCardinal

	| unaOrientacionInicial |
	unaOrientacionInicial _ OrientacionDeMarsRover segun: unPuntoCardinal.

	^self new inicializarEn: unaPosicionInicial con: unaOrientacionInicial
	! !


!classDefinition: #OrientacionDeMarsRover category: 'MarsRoverTDD'!
Object subclass: #OrientacionDeMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!OrientacionDeMarsRover methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 17:00:46'!
guiarAvanceDe: unMarsRover

	self subclassResponsibility! !

!OrientacionDeMarsRover methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 17:06:19'!
guiarRetrocesoDe: unMarsRover

	self subclassResponsibility! !

!OrientacionDeMarsRover methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 17:06:46'!
guiarRotacionADerechaDe: unMarsRover

	self subclassResponsibility! !

!OrientacionDeMarsRover methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 17:07:37'!
guiarRotacionAIzquierdaDe: unMarsRover

	self subclassResponsibility! !


!OrientacionDeMarsRover methodsFor: 'Verificacion' stamp: 'SRM 7/1/2021 16:53:10'!
apuntaA: unPuntoCardinal

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionDeMarsRover class' category: 'MarsRoverTDD'!
OrientacionDeMarsRover class
	instanceVariableNames: ''!

!OrientacionDeMarsRover class methodsFor: 'Instanciacion' stamp: 'SRM 7/1/2021 16:32:28'!
segun: unPuntoCardinal

	| subclaseDeOrientacion |
	subclaseDeOrientacion _ self allSubclasses detect: [ :unaSubclase | unaSubclase apuntaA: unPuntoCardinal] 
		ifNone: [self error: MarsRover descripcionDePuntoCardinalInicialInvalido].
	^subclaseDeOrientacion new! !


!OrientacionDeMarsRover class methodsFor: 'Verificacion' stamp: 'SRM 7/1/2021 16:32:28'!
apuntaA: unPuntoCardinal

	self subclassResponsibility ! !


!classDefinition: #OrientacionEste category: 'MarsRoverTDD'!
OrientacionDeMarsRover subclass: #OrientacionEste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!OrientacionEste methodsFor: 'Verificacion' stamp: 'SRM 7/1/2021 16:53:10'!
apuntaA: unPuntoCardinal

	^unPuntoCardinal = 'E'! !


!OrientacionEste methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 17:01:52'!
guiarAvanceDe: unMarsRover

	unMarsRover avanzarApuntandoAlEste! !

!OrientacionEste methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 17:08:02'!
guiarRetrocesoDe: unMarsRover

	unMarsRover retrocederApuntandoAlEste! !

!OrientacionEste methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 18:40:12'!
guiarRotacionADerechaDe: unMarsRover

	unMarsRover rotarADerechaApuntandoAlEste! !

!OrientacionEste methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 18:41:44'!
guiarRotacionAIzquierdaDe: unMarsRover

	unMarsRover rotarAIzquierdaApuntandoAlEste! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionEste class' category: 'MarsRoverTDD'!
OrientacionEste class
	instanceVariableNames: ''!

!OrientacionEste class methodsFor: 'Verificacion' stamp: 'SRM 7/1/2021 16:32:28'!
apuntaA: unPuntoCardinal

	^unPuntoCardinal = 'E'! !


!classDefinition: #OrientacionNorte category: 'MarsRoverTDD'!
OrientacionDeMarsRover subclass: #OrientacionNorte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!OrientacionNorte methodsFor: 'Verificacion' stamp: 'SRM 7/1/2021 16:53:10'!
apuntaA: unPuntoCardinal

	^unPuntoCardinal = 'N'! !


!OrientacionNorte methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 17:08:39'!
guiarAvanceDe: unMarsRover

	unMarsRover avanzarApuntandoAlNorte! !

!OrientacionNorte methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 17:08:44'!
guiarRetrocesoDe: unMarsRover

	unMarsRover retrocederApuntandoAlNorte! !

!OrientacionNorte methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 18:40:22'!
guiarRotacionADerechaDe: unMarsRover

	unMarsRover rotarADerechaApuntandoAlNorte! !

!OrientacionNorte methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 18:42:02'!
guiarRotacionAIzquierdaDe: unMarsRover

	unMarsRover rotarAIzquierdaApuntandoAlNorte! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionNorte class' category: 'MarsRoverTDD'!
OrientacionNorte class
	instanceVariableNames: ''!

!OrientacionNorte class methodsFor: 'Verificacion' stamp: 'SRM 7/1/2021 16:32:28'!
apuntaA: unPuntoCardinal

	^unPuntoCardinal = 'N'! !


!classDefinition: #OrientacionOeste category: 'MarsRoverTDD'!
OrientacionDeMarsRover subclass: #OrientacionOeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!OrientacionOeste methodsFor: 'Verificacion' stamp: 'SRM 7/1/2021 16:53:09'!
apuntaA: unPuntoCardinal

	^unPuntoCardinal = 'O'! !


!OrientacionOeste methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 17:09:09'!
guiarAvanceDe: unMarsRover

	unMarsRover avanzarApuntandoAlOeste! !

!OrientacionOeste methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 17:09:16'!
guiarRetrocesoDe: unMarsRover

	unMarsRover retrocederApuntandoAlOeste! !

!OrientacionOeste methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 18:40:32'!
guiarRotacionADerechaDe: unMarsRover

	unMarsRover rotarADerechaApuntandoAlOeste! !

!OrientacionOeste methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 18:42:13'!
guiarRotacionAIzquierdaDe: unMarsRover

	unMarsRover rotarAIzquierdaApuntandoAlOeste! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionOeste class' category: 'MarsRoverTDD'!
OrientacionOeste class
	instanceVariableNames: ''!

!OrientacionOeste class methodsFor: 'Verificacion' stamp: 'SRM 7/1/2021 16:32:28'!
apuntaA: unPuntoCardinal

	^unPuntoCardinal = 'O'! !


!classDefinition: #OrientacionSur category: 'MarsRoverTDD'!
OrientacionDeMarsRover subclass: #OrientacionSur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverTDD'!

!OrientacionSur methodsFor: 'Verificacion' stamp: 'SRM 7/1/2021 16:53:10'!
apuntaA: unPuntoCardinal

	^unPuntoCardinal = 'S'! !


!OrientacionSur methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 17:09:38'!
guiarAvanceDe: unMarsRover

	unMarsRover avanzarApuntandoAlSur! !

!OrientacionSur methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 17:09:43'!
guiarRetrocesoDe: unMarsRover

	unMarsRover retrocederApuntandoAlSur! !

!OrientacionSur methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 18:41:24'!
guiarRotacionADerechaDe: unMarsRover

	unMarsRover rotarADerechaApuntandoAlSur! !

!OrientacionSur methodsFor: 'Guias de movimiento' stamp: 'SRM 7/1/2021 18:42:30'!
guiarRotacionAIzquierdaDe: unMarsRover

	unMarsRover rotarAIzquierdaApuntandoAlSur! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionSur class' category: 'MarsRoverTDD'!
OrientacionSur class
	instanceVariableNames: ''!

!OrientacionSur class methodsFor: 'Verificacion' stamp: 'SRM 7/1/2021 16:32:28'!
apuntaA: unPuntoCardinal

	^unPuntoCardinal = 'S'! !
