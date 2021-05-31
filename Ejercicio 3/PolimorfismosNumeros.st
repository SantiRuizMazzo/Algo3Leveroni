!classDefinition: #NumeroTest category: 'PolimorfismosNumeros'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PolimorfismosNumeros'!

!NumeroTest methodsFor: 'tests' stamp: 'SRM 5/28/2021 10:56:30'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'SRM 5/28/2021 17:08:44'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two.! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'SRM 5/28/2021 09:45:31'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 5/7/2020 17:46:14'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'PolimorfismosNumeros'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PolimorfismosNumeros'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'SRM 5/31/2021 14:27:49'!
- aSubtrahend

	self subclassResponsibility! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'SRM 5/31/2021 16:38:43'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'SRM 5/31/2021 14:29:12'!
beAddedToEntero: anEnteroAugend

	self subclassResponsibility! !

!Numero methodsFor: 'private' stamp: 'SRM 5/31/2021 14:29:16'!
beAddedToFraccion: aFraccionAugend

	self subclassResponsibility! !

!Numero methodsFor: 'private' stamp: 'SRM 5/31/2021 14:29:19'!
beSubstractedFromEntero: anEnteroMinuend

	self subclassResponsibility! !

!Numero methodsFor: 'private' stamp: 'SRM 5/31/2021 14:29:23'!
beSubstractedFromFraccion: aFraccionMinuend

	self subclassResponsibility! !

!Numero methodsFor: 'private' stamp: 'SRM 5/31/2021 14:29:27'!
divideAFraccion: aFraccionDividend

	self subclassResponsibility! !

!Numero methodsFor: 'private' stamp: 'SRM 5/31/2021 14:29:31'!
divideAnEntero: anEnteroDividend

	self subclassResponsibility! !

!Numero methodsFor: 'private' stamp: 'SRM 5/31/2021 14:29:38'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'private' stamp: 'SRM 5/31/2021 14:29:43'!
multiplyAFraccion: aFraccionMultiplicand

	self subclassResponsibility! !

!Numero methodsFor: 'private' stamp: 'SRM 5/31/2021 14:29:46'!
multiplyAnEntero: anEnteroMultiplicand

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'PolimorfismosNumeros'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'SRM 5/31/2021 14:30:02'!
invalidNumberTypeErrorDescription
	
	^'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'PolimorfismosNumeros'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PolimorfismosNumeros'!

!Entero methodsFor: 'arithmetic operations' stamp: 'SRM 5/31/2021 14:21:46'!
* aMultiplier 
	
	^aMultiplier multiplyAnEntero: self. 
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'SRM 5/30/2021 16:55:19'!
+ anAdder 
	
	^anAdder beAddedToEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'SRM 5/31/2021 16:23:08'!
- aSubtrahend 
	
	^aSubtrahend negated beAddedToEntero: self
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'SRM 5/30/2021 18:35:07'!
/ aDivisor 
	
	^aDivisor divideAnEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'SRM 5/30/2021 20:08:24'!
fibonacci

	self subclassResponsibility.
		! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'SRM 5/30/2021 18:07:06'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'SRM 5/28/2021 10:55:56'!
isZero
	
	^value = 0.! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 14:38:14'!
beAddedToEntero: anEnteroAugend

	^self class with: (anEnteroAugend integerValue + self integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 16:37:02'!
beAddedToFraccion: aFraccionAugend

	^self + aFraccionAugend
	"lo enviamos al revés aprovechando la conmutatividad de la suma, para no repetir código"! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 16:50:00'!
divideAFraccion: aFraccionDividend

	^aFraccionDividend beDividedByAnEntero: self
	"invertimos el orden para evitar romper encapsulamiento"! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 14:37:46'!
divideAnEntero: aDividend

	self subclassResponsibility! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 16:36:34'!
multiplyAFraccion: aFraccionMultiplicand

	^self * aFraccionMultiplicand
	"lo enviamos al revés aprovechando la conmutatividad de la multiplicación, para no repetir código"! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 14:37:16'!
multiplyAnEntero: anEnteroMultiplicand

	^self class with: anEnteroMultiplicand integerValue * value! !


!Entero methodsFor: 'validation - private' stamp: 'SRM 5/31/2021 16:17:11'!
checkThatIsAValidDenominator! !

!Entero methodsFor: 'validation - private' stamp: 'SRM 5/31/2021 16:16:10'!
checkThatIsAValidNumerator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'PolimorfismosNumeros'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'SRM 5/31/2021 17:06:26'!
with: aValue 
	
	| class |
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	class := Entero allSubclasses detect: [:currentClass | currentClass includesValue: aValue] ifNone: [self error: 'el valor no es válido'].
	^class new initializeWith: aValue
	
	
	
	! !


!Entero class methodsFor: 'error descriptions' stamp: 'SRM 5/31/2021 14:30:10'!
negativeFibonacciErrorDescription
	
	^'Fibonacci no está definido aquí para Enteros Negativos'! !


!classDefinition: #Cero category: 'PolimorfismosNumeros'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PolimorfismosNumeros'!

!Cero methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/30/2021 18:35:07'!
divideAnEntero: anEnteroDividend

	Fraccion error: Fraccion canNotDivideByZeroErrorDescription.! !


!Cero methodsFor: 'arithmetic operations' stamp: 'SRM 5/30/2021 20:03:50'!
fibonacci

	^Entero with: 1.

	! !


!Cero methodsFor: 'validation - private' stamp: 'SRM 5/31/2021 16:16:42'!
checkThatIsAValidNumerator

	self error: 'una fraccion no puede ser cero'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'PolimorfismosNumeros'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'private' stamp: 'SRM 5/31/2021 17:06:26'!
includesValue: aValue

	^(aValue = 0)! !


!classDefinition: #DistintoDeCero category: 'PolimorfismosNumeros'!
Entero subclass: #DistintoDeCero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PolimorfismosNumeros'!

!DistintoDeCero methodsFor: 'arithmetic operations' stamp: 'SRM 5/31/2021 14:31:15'!
fibonacci

	self subclassResponsibility! !


!DistintoDeCero methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 14:31:29'!
divideACoprimeEntero: anEnteroDividend

	^Fraccion new initializeWith: anEnteroDividend over: self! !

!DistintoDeCero methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 14:31:23'!
divideAnEntero: anEnteroDividend

	| denominator greatestCommonDivisor numerator |
	greatestCommonDivisor := anEnteroDividend greatestCommonDivisorWith: self. 
	numerator := anEnteroDividend // greatestCommonDivisor.
	denominator := self // greatestCommonDivisor.
	
	^denominator divideACoprimeEntero: numerator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DistintoDeCero class' category: 'PolimorfismosNumeros'!
DistintoDeCero class
	instanceVariableNames: ''!

!DistintoDeCero class methodsFor: 'private' stamp: 'SRM 5/31/2021 17:06:26'!
includesValue: aValue

	^false! !


!classDefinition: #Negativo category: 'PolimorfismosNumeros'!
DistintoDeCero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PolimorfismosNumeros'!

!Negativo methodsFor: 'arithmetic operations' stamp: 'SRM 5/31/2021 14:31:40'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription! !


!Negativo methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 14:31:36'!
divideAnEntero: anEnteroDividend

	^anEnteroDividend negated / self negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negativo class' category: 'PolimorfismosNumeros'!
Negativo class
	instanceVariableNames: ''!

!Negativo class methodsFor: 'private' stamp: 'SRM 5/31/2021 17:06:26'!
includesValue: aValue

	^(aValue < 0)! !


!classDefinition: #Positivo category: 'PolimorfismosNumeros'!
DistintoDeCero subclass: #Positivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PolimorfismosNumeros'!

!Positivo methodsFor: 'arithmetic operations' stamp: 'SRM 5/31/2021 14:31:50'!
fibonacci

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Positivo class' category: 'PolimorfismosNumeros'!
Positivo class
	instanceVariableNames: ''!

!Positivo class methodsFor: 'private' stamp: 'SRM 5/31/2021 17:06:25'!
includesValue: aValue

	^false! !


!classDefinition: #MayorAUno category: 'PolimorfismosNumeros'!
Positivo subclass: #MayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PolimorfismosNumeros'!

!MayorAUno methodsFor: 'arithmetic operations' stamp: 'SRM 5/31/2021 14:31:56'!
fibonacci

	| one two |
	one := Entero with: 1.
	two := Entero with: 2.
	
	^(self - one) fibonacci + (self - two) fibonacci! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MayorAUno class' category: 'PolimorfismosNumeros'!
MayorAUno class
	instanceVariableNames: ''!

!MayorAUno class methodsFor: 'private' stamp: 'SRM 5/31/2021 17:06:26'!
includesValue: aValue

	^(aValue > 1)! !


!classDefinition: #Uno category: 'PolimorfismosNumeros'!
Positivo subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PolimorfismosNumeros'!

!Uno methodsFor: 'arithmetic operations' stamp: 'SRM 5/31/2021 14:32:08'!
fibonacci

	^Entero with: 1! !


!Uno methodsFor: 'validation - private' stamp: 'SRM 5/31/2021 16:17:45'!
checkThatIsAValidDenominator
	
	self error: 'una fraccion no puede tener denominador 1 porque sino es un entero'
	! !


!Uno methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/30/2021 19:04:41'!
divideACoprimeEntero: anEnteroDividend

	^anEnteroDividend! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'PolimorfismosNumeros'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'private' stamp: 'SRM 5/31/2021 17:06:26'!
includesValue: aValue

	^(aValue = 1)! !


!classDefinition: #Fraccion category: 'PolimorfismosNumeros'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PolimorfismosNumeros'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'SRM 5/31/2021 14:32:15'!
* aMultiplier 
	
	^aMultiplier multiplyAFraccion: self
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'SRM 5/31/2021 14:32:19'!
+ anAdder 
		
	^anAdder beAddedToFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'SRM 5/31/2021 16:23:43'!
- aSubtrahend 
	
	^aSubtrahend negated beAddedToFraccion: self
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'SRM 5/31/2021 14:32:27'!
/ aDivisor 
	
	^aDivisor divideAFraccion: self! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'SRM 5/31/2021 14:27:12'!
denominator

	^denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'SRM 5/31/2021 14:27:17'!
numerator

	^numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'SRM 5/31/2021 16:18:10'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"	
	aNumerator checkThatIsAValidNumerator.
	aDenominator checkThatIsAValidDenominator.
	
	numerator := aNumerator.
	denominator := aDenominator
	
	! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 14:32:54'!
beAddedToEntero: anEnteroAugend

	^numerator + (denominator * anEnteroAugend) / denominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 14:33:00'!
beAddedToFraccion: aFraccionAugend

	| newNumerator newDenominator | 
	
	newNumerator := (numerator * aFraccionAugend denominator) + (denominator * aFraccionAugend numerator).
	newDenominator := denominator * aFraccionAugend denominator. 
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 16:48:29'!
beDividedByAnEntero: anEnteroDivisor

	^numerator / ( denominator * anEnteroDivisor )! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 14:33:15'!
divideAFraccion: aFraccionDividend

	^(aFraccionDividend numerator * denominator) / (aFraccionDividend denominator * numerator)! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 14:33:19'!
divideAnEntero: anEnteroDividend

	^ anEnteroDividend * denominator / numerator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 14:33:23'!
multiplyAFraccion: aFraccionMultiplicand

	^(aFraccionMultiplicand numerator * numerator) / (aFraccionMultiplicand denominator * denominator)! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'SRM 5/31/2021 14:33:29'!
multiplyAnEntero: anEnteroMultiplicand

	^anEnteroMultiplicand * numerator / denominator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'PolimorfismosNumeros'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'private' stamp: 'SRM 5/31/2021 17:06:26'!
includesValue: aValue! !
