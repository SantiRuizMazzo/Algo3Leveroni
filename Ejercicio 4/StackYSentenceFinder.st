!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'SRM 6/7/2021 16:40:09'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'private' stamp: 'SRM 6/9/2021 10:10:47'!
canGetAnElement

	| instantiableSubclass |
	instantiableSubclass := StackElementsCounter allSubclasses detect: [:aSubclass | aSubclass canInstantiateFrom: self size].
	^instantiableSubclass new thereIsSomeElement! !

!OOStack methodsFor: 'private' stamp: 'SRM 6/9/2021 09:24:34'!
initializeEmpty

	elements := OrderedCollection new! !


!OOStack methodsFor: 'public' stamp: 'SRM 6/7/2021 19:37:26'!
isEmpty

	^elements isEmpty! !

!OOStack methodsFor: 'public' stamp: 'SRM 6/9/2021 10:17:11'!
pop
	
	self canGetAnElement.
	^elements removeLast! !

!OOStack methodsFor: 'public' stamp: 'SRM 6/7/2021 20:08:32'!
push: anObject

	elements add: anObject
	! !

!OOStack methodsFor: 'public' stamp: 'SRM 6/7/2021 19:35:54'!
size

	^elements size! !

!OOStack methodsFor: 'public' stamp: 'SRM 6/9/2021 10:10:07'!
top
	
	self canGetAnElement.
	^elements at: elements size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'instantiation' stamp: 'SRM 6/9/2021 10:21:17'!
new

	^super new initializeEmpty
	! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #StackElementsCounter category: 'Stack-Exercise'!
Object subclass: #StackElementsCounter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElementsCounter methodsFor: 'as yet unclassified' stamp: 'SRM 6/9/2021 10:08:20'!
thereIsSomeElement

	self subclassResponsibility ! !


!classDefinition: #EmptyStackCounter category: 'Stack-Exercise'!
StackElementsCounter subclass: #EmptyStackCounter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackCounter methodsFor: 'as yet unclassified' stamp: 'SRM 6/9/2021 10:08:20'!
thereIsSomeElement

	self error: OOStack stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStackCounter class' category: 'Stack-Exercise'!
EmptyStackCounter class
	instanceVariableNames: ''!

!EmptyStackCounter class methodsFor: 'as yet unclassified' stamp: 'SRM 6/9/2021 10:01:54'!
canInstantiateFrom: aStackSize

	^aStackSize = 0! !


!classDefinition: #NonEmptyStackCounter category: 'Stack-Exercise'!
StackElementsCounter subclass: #NonEmptyStackCounter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyStackCounter methodsFor: 'as yet unclassified' stamp: 'SRM 6/9/2021 10:08:20'!
thereIsSomeElement! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyStackCounter class' category: 'Stack-Exercise'!
NonEmptyStackCounter class
	instanceVariableNames: ''!

!NonEmptyStackCounter class methodsFor: 'as yet unclassified' stamp: 'SRM 6/9/2021 10:25:55'!
canInstantiateFrom: aStackSize

	^aStackSize > 0! !
