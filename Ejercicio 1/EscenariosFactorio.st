!classDefinition: #Caja category: 'EscenariosFactorio'!
DenotativeObject subclass: #Caja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EscenariosFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Caja class' category: 'EscenariosFactorio'!
Caja class
	instanceVariableNames: 'contenido'!

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:42:38'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:08:26'!
cantidadDeMenas
	^contenido size.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:20:37'!
cantidadDeMenasDeCarbon
	^contenido count: [ :cadaElemento | cadaElemento = 'una mena de carbon' ].! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:20:19'!
cantidadDeMenasDeHierro
	^contenido count: [ :cadaElemento | cadaElemento = 'una mena de hierro' ].! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'SRM 5/10/2021 16:44:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: 'una mena de carbon'; yourself).! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:09:06'!
vaciar
	contenido := OrderedCollection new.! !


!classDefinition: #CintaA category: 'EscenariosFactorio'!
DenotativeObject subclass: #CintaA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EscenariosFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaA class' category: 'EscenariosFactorio'!
CintaA class
	instanceVariableNames: 'destino contenido'!

!CintaA class methodsFor: 'as yet unclassified' stamp: 'AGG 5/3/2021 21:32:26'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'AGG 5/3/2021 21:29:15'!
destino: aContenedor 
	destino := aContenedor.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'AGG 5/8/2021 16:11:00'!
estaVacia
	^(contenido isEmpty).! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'SRM 5/10/2021 16:44:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := Caja.
	contenido := ((OrderedCollection new)).! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 09:47:53'!
transportar
	|menasATransportar|
	menasATransportar := contenido.
	self vaciar.
	^destino agregarMenas: menasATransportar.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 09:35:00'!
vaciar
	contenido := OrderedCollection new.! !


!classDefinition: #CintaB category: 'EscenariosFactorio'!
DenotativeObject subclass: #CintaB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EscenariosFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaB class' category: 'EscenariosFactorio'!
CintaB class
	instanceVariableNames: 'destino contenido'!

!CintaB class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:09:17'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:09:17'!
destino: aContenedor 
	destino := aContenedor.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'AGG 5/8/2021 16:12:16'!
estaVacia
	^(contenido isEmpty).! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'SRM 5/10/2021 16:44:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := CintaA.
	contenido := ((OrderedCollection new)).! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:09:17'!
transportar
	|menasATransportar|
	menasATransportar := contenido.
	self vaciar.
	^destino agregarMenas: menasATransportar.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:09:17'!
vaciar
	contenido := OrderedCollection new.! !


!classDefinition: #ExtractorDeCarbon category: 'EscenariosFactorio'!
DenotativeObject subclass: #ExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EscenariosFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeCarbon class' category: 'EscenariosFactorio'!
ExtractorDeCarbon class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:23:04'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:44:58'!
conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de carbon'! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:49'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:29:41'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'AGG 5/8/2021 16:03:22'!
energiaActual
	^energiaActual.
! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:29'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:34:57'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas).! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SRM 5/10/2021 16:44:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := Caja.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:27'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:36:12'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:57'!
sacarEnergia: energiaASacar
	energiaActual := energiaActual - energiaASacar! !


!classDefinition: #ExtractorDeHierro category: 'EscenariosFactorio'!
DenotativeObject subclass: #ExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EscenariosFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeHierro class' category: 'EscenariosFactorio'!
ExtractorDeHierro class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:00:58'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:01:24'!
conjuntoDeMenasDeHierroCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de hierro'! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:00:58'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:00:58'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:00:58'!
energiaActual
	^energiaActual.
! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:00:58'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:02:33'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeHierroCantidad: cantidadDeMenas).! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'SRM 5/10/2021 16:44:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := CintaB.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:00:58'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:00:58'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'AGG 5/5/2021 10:00:58'!
sacarEnergia: energiaASacar
	energiaActual := energiaActual - energiaASacar! !


!classDefinition: #PruebasDeExtractorDeCarbon category: 'EscenariosFactorio'!
DenotativeObject subclass: #PruebasDeExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EscenariosFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeExtractorDeCarbon class' category: 'EscenariosFactorio'!
PruebasDeExtractorDeCarbon class
	instanceVariableNames: ''!

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:37:39'!
setUp
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:41:43'!
test01UnExtractorSinEnergiaNoExtraeMenas
	"Cuando no cargue energia en el extractor, no saco menas"
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:46:54'!
test02UnExtractorConInsuficienteEnergiaNoExtraeMenas
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 1 * joule.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:47:56'!
test03UnExtractorConSuficienteEnergiaExtrae1Mena
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:49:57'!
test04UnExtractorConservaLaEnergiaNoUtilizada
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 7 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 2 * joule.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:50:53'!
test05UnExtractorPuedeExtraerMultiplesMenasConMuchaEnergia
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 50 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 10.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 0 * joule.
! !


!classDefinition: #PruebasDeFactorio category: 'EscenariosFactorio'!
DenotativeObject subclass: #PruebasDeFactorio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EscenariosFactorio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeFactorio class' category: 'EscenariosFactorio'!
PruebasDeFactorio class
	instanceVariableNames: ''!

!PruebasDeFactorio class methodsFor: 'tests' stamp: 'SRM 5/10/2021 16:42:54'!
testEscenarioExtractorCaja

	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: Caja.
	
	Caja vaciar.
	
	ExtractorDeCarbon extraer.
	
	Assert that: Caja cantidadDeMenas isEqualTo: 1.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.! !

!PruebasDeFactorio class methodsFor: 'tests' stamp: 'SRM 5/10/2021 16:42:20'!
testEscenarioExtractorCintaCaja
	
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: CintaA.

	CintaA destino: Caja.

	CintaA vaciar.
	Caja vaciar.
	
	ExtractorDeCarbon extraer.
	CintaA transportar.
	
	Assert that: CintaA estaVacia isEqualTo: true. 
	Assert that: Caja cantidadDeMenas isEqualTo: 1.
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.  ! !

!PruebasDeFactorio class methodsFor: 'tests' stamp: 'SRM 5/10/2021 16:41:50'!
testEscenarioExtractorExtractorCintaCintaCaja

	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: CintaA.
	
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeHierro agregarEnergia: 5 * joule.
	ExtractorDeHierro destino: CintaB.

	CintaB destino: CintaA.
	CintaA destino: Caja.

	CintaA vaciar.
	CintaB vaciar.
	Caja vaciar.
		
	ExtractorDeHierro extraer.
	CintaB transportar.

	ExtractorDeCarbon extraer.
	CintaA transportar.
	
	Assert that: CintaA estaVacia isEqualTo: true.   
	Assert that: CintaB estaVacia isEqualTo: true.   
	
	Assert that: Caja cantidadDeMenas isEqualTo: 2.  
	Assert that: Caja cantidadDeMenasDeCarbon isEqualTo: 1.   
	Assert that: Caja cantidadDeMenasDeHierro isEqualTo: 1.   ! !

Caja initializeAfterFileIn!
CintaA initializeAfterFileIn!
CintaB initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!
ExtractorDeHierro initializeAfterFileIn!