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

!OOStackTest methodsFor: 'test' stamp: 'SRM 6/10/2021 16:08:50'!
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
	instanceVariableNames: 'stack sentenceFinder collection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'SRM 6/10/2021 17:21:04'!
invalidPrefixErrorShouldBeRaisedWhenExecuted: aBlockThatShouldRaiseAnError

	self should: aBlockThatShouldRaiseAnError
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'SRM 6/10/2021 17:27:47'!
pushSentencesToStack: aStack

	aStack push: 'Santiago Ruiz'.
	aStack push: 'Micaela pandolfo'.
	aStack push: 'manu mendez'.! !

!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'SRM 6/10/2021 16:50:49'!
setUp

	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new.
	! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SRM 6/10/2021 17:42:26'!
test01EmptyPrefixShouldRaiseAnError

	self pushSentencesToStack: stack.
	
	self invalidPrefixErrorShouldBeRaisedWhenExecuted: [sentenceFinder findAndCollectAllSentencesWithThePrefix: '' on: stack].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SRM 6/10/2021 17:42:25'!
test02PrefixWithWhiteSpaceShouldRaiseAnError

	self pushSentencesToStack: stack.
	
	self invalidPrefixErrorShouldBeRaisedWhenExecuted: [sentenceFinder findAndCollectAllSentencesWithThePrefix: 'ho la' on: stack]! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SRM 6/10/2021 17:42:26'!
test03PrefixIsNotAStringShouldRaiseAnError

	self pushSentencesToStack: stack.
	
	self invalidPrefixErrorShouldBeRaisedWhenExecuted: [sentenceFinder findAndCollectAllSentencesWithThePrefix: 1 on: stack]! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SRM 6/10/2021 17:42:26'!
test04EmptyStackShouldReturnAnEmptyCollection

	collection := sentenceFinder findAndCollectAllSentencesWithThePrefix: 'aaa' on: stack.
	self assert: collection isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SRM 6/10/2021 17:42:26'!
test05StackIsNotAnOOStackShouldRaiseAnError

	self should: [sentenceFinder findAndCollectAllSentencesWithThePrefix: 'hola' on: 'IAmNotAStack']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidStackDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SRM 6/10/2021 17:42:25'!
test06SentenceFinderFindsAtLeastOneSentence

	self pushSentencesToStack: stack.
	stack push: 'Gabriela Martinez'.
	
       collection := 	sentenceFinder findAndCollectAllSentencesWithThePrefix: 'Gabri' on: stack.
	self assert: ((collection size = 1) and: (collection includes: 'Gabriela Martinez'))
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SRM 6/10/2021 17:42:25'!
test07SentenceFinderFindsNoSentence

	self pushSentencesToStack: stack.
	
       collection := 	sentenceFinder findAndCollectAllSentencesWithThePrefix: 'Sergio' on: stack.
	self assert: collection isEmpty
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SRM 6/10/2021 17:42:26'!
test08SentenceFinderRaisesAnErrorButStackKeepsIntact

	| previousStack |
	
	self pushSentencesToStack: stack.
	previousStack := stack.
	
	self should: [sentenceFinder findAndCollectAllSentencesWithThePrefix: 1 on: stack]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidPrefixDescription ].
	self assert: previousStack = stack! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SRM 6/10/2021 17:42:25'!
test09SentenceFinderFindsAtLeastOneSentenceAndStackKeepsIntact

	| previousStack |
	
	self pushSentencesToStack: stack.
	stack push: 'Gabriela Martinez'.
	previousStack := stack.
	
       sentenceFinder findAndCollectAllSentencesWithThePrefix: 'Gabri' on: stack.
	self assert: previousStack = stack
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SRM 6/10/2021 17:42:25'!
test10SentenceFinderFindsNoSentenceButStackKeepsIntact

	| previousStack |
	
	self pushSentencesToStack: stack.
	previousStack := stack.
	
       sentenceFinder findAndCollectAllSentencesWithThePrefix: 'Sergio' on: stack.
	self assert: previousStack = stack
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'SRM 6/10/2021 17:42:25'!
test11SentenceFinderRespectsCaseSensitive

	self pushSentencesToStack: stack.
	stack push: 'Gabriela Martinez'.
	stack push: 'gabriela gonzalez'. 
	
       collection := 	sentenceFinder findAndCollectAllSentencesWithThePrefix: 'Gabri' on: stack.
	self assert: ((collection size = 1) and: (collection includes: 'Gabriela Martinez'))! !


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

!OOStack methodsFor: 'public' stamp: 'SRM 6/10/2021 15:26:54'!
pop
	
	self canGetAnElement.
	^elements removeLast! !

!OOStack methodsFor: 'public' stamp: 'SRM 6/7/2021 20:08:32'!
push: anObject

	elements add: anObject
	! !

!OOStack methodsFor: 'public' stamp: 'SRM 6/10/2021 17:58:35'!
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

!SentenceFinderByPrefix methodsFor: 'public' stamp: 'SRM 6/10/2021 17:53:12'!
findAndCollectAllSentencesWithThePrefix: aSentencePrefix on: aStack

	| currentSentence collection auxiliarStack |

	(aStack isKindOf: OOStack) ifFalse: [self error: SentenceFinderByPrefix invalidStackDescription ].
	(aSentencePrefix isKindOf: String) ifFalse: [self error: SentenceFinderByPrefix invalidPrefixDescription].
	(aSentencePrefix isEmpty or: (aSentencePrefix includesSubString: ' ')) ifTrue: [self error: SentenceFinderByPrefix invalidPrefixDescription].
		
	collection := OrderedCollection new.
	auxiliarStack := aStack.	
	
	aStack size timesRepeat: [
		currentSentence := auxiliarStack pop.
		(currentSentence beginsWith: aSentencePrefix) ifTrue: [collection add: currentSentence]].
	^collection
	

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'SRM 6/10/2021 15:49:57'!
invalidPrefixDescription

	^'Invalid prefix'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'SRM 6/10/2021 16:09:21'!
invalidStackDescription

	^'Invalid stack'! !


!classDefinition: #StackElementsCounter category: 'Stack-Exercise'!
Object subclass: #StackElementsCounter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElementsCounter methodsFor: 'public' stamp: 'SRM 6/9/2021 10:08:20'!
thereIsSomeElement

	self subclassResponsibility ! !


!classDefinition: #EmptyStackCounter category: 'Stack-Exercise'!
StackElementsCounter subclass: #EmptyStackCounter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackCounter methodsFor: 'public' stamp: 'SRM 6/9/2021 10:08:20'!
thereIsSomeElement

	self error: OOStack stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStackCounter class' category: 'Stack-Exercise'!
EmptyStackCounter class
	instanceVariableNames: ''!

!EmptyStackCounter class methodsFor: 'public' stamp: 'SRM 6/9/2021 10:01:54'!
canInstantiateFrom: aStackSize

	^aStackSize = 0! !


!classDefinition: #NonEmptyStackCounter category: 'Stack-Exercise'!
StackElementsCounter subclass: #NonEmptyStackCounter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyStackCounter methodsFor: 'public' stamp: 'SRM 6/9/2021 10:08:20'!
thereIsSomeElement! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyStackCounter class' category: 'Stack-Exercise'!
NonEmptyStackCounter class
	instanceVariableNames: ''!

!NonEmptyStackCounter class methodsFor: 'public' stamp: 'SRM 6/9/2021 10:25:55'!
canInstantiateFrom: aStackSize

	^aStackSize > 0! !
