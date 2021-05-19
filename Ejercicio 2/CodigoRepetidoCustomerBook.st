!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'SRM 5/18/2021 21:55:54'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook action |
	
	customerBook := CustomerBook new.
	
	action := [customerBook addCustomerNamed: 'John Lenon'].
	self checkThat: action isDoneInLessTimeThan: 50*millisecond.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AGG 5/18/2021 15:08:56'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney action |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	action := [customerBook removeCustomerNamed: paulMcCartney].
	self checkThat: action isDoneInLessTimeThan: 100*millisecond.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AGG 5/18/2021 15:46:46'!
test03CanNotAddACustomerWithEmptyName 
	
	| customerBook |
			
	customerBook := CustomerBook new.
	
	self forceToFail: [ customerBook addCustomerNamed: '']
		withError: Error 
		andDo: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AGG 5/18/2021 15:46:58'!
test04CanNotRemoveAnInvalidCustomer

	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.

	self forceToFail: [customerBook removeCustomerNamed: 'Paul McCartney']
		withError: NotFound
		andDo: [ :anError | self checkThat: johnLennon isTheOnlyCustomerIn: customerBook].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AGG 5/18/2021 15:47:19'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self addAndSuspendCustomer: paulMcCartney from: customerBook.
	self checkFrom: customerBook thatAmountOfTotalCustomersIs: 1 OfWhichAreActive: 0 AndAreSuspended: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AGG 5/18/2021 15:47:31'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	self addAndSuspendCustomer: paulMcCartney from: customerBook.
	customerBook removeCustomerNamed: paulMcCartney.
	self checkFrom: customerBook thatAmountOfTotalCustomersIs: 0 OfWhichAreActive: 0 AndAreSuspended: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AGG 5/18/2021 15:47:46'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
		
	self forceToFail: [ customerBook suspendCustomerNamed: 'Ringo Starr']
	 	withError: CantSuspend
		andDo: [ :anError | self checkThat: johnLennon isTheOnlyCustomerIn: customerBook ].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AGG 5/18/2021 15:48:51'!
test08CanNotSuspendAnAlreadySuspendedCustomer	

	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	self addAndSuspendCustomer: johnLennon from: customerBook.

	self forceToFail: [ customerBook suspendCustomerNamed: johnLennon]
	 	withError: CantSuspend
		andDo: [ :anError | self checkThat: johnLennon isTheOnlyCustomerIn: customerBook ].! !


!CustomerBookTest methodsFor: 'private' stamp: 'AGG 5/18/2021 15:24:03'!
addAndSuspendCustomer: customer from: book
	
	book addCustomerNamed: customer.
	book suspendCustomerNamed: customer.! !

!CustomerBookTest methodsFor: 'private' stamp: 'AGG 5/18/2021 15:42:56'!
checkFrom: customerBook thatAmountOfTotalCustomersIs: amountOfTotalCustomers OfWhichAreActive: amountOfActiveCustomers AndAreSuspended: amountOfSuspendedCustomers

	self assert: amountOfTotalCustomers equals: customerBook numberOfCustomers.
	self assert: amountOfActiveCustomers equals: customerBook numberOfActiveCustomers.
	self assert: amountOfSuspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	! !

!CustomerBookTest methodsFor: 'private' stamp: 'AGG 5/18/2021 15:45:10'!
checkThat: action isDoneInLessTimeThan: timeInMilliseconds
	
	self assert: (action timeToRun) < (timeInMilliseconds).! !

!CustomerBookTest methodsFor: 'private' stamp: 'AGG 5/18/2021 15:41:47'!
checkThat: customer isTheOnlyCustomerIn: customerBook

	self assert: ((customerBook numberOfCustomers = 1) and: (customerBook includesCustomerNamed: customer)).
			! !

!CustomerBookTest methodsFor: 'private' stamp: 'AGG 5/18/2021 15:14:51'!
forceToFail: actionsToFail withError: typeOfError andDo: actionsToDoWhenItFails

	[actionsToFail value.
		self fail]
		on: typeOfError
		do: actionsToDoWhenItFails.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'AGG 5/18/2021 15:59:34'!
addCustomerNamed: aName
	
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	active add: aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'AGG 5/18/2021 15:55:37'!
removeCustomerNamed: aCustomer 

	active remove: aCustomer ifAbsent: [
		suspended remove: aCustomer ifAbsent: [^ NotFound signal.].
	]! !

!CustomerBook methodsFor: 'customer management' stamp: 'AGG 5/18/2021 16:02:58'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	active remove: aName.
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'AGG 5/18/2021 16:01:10'!
numberOfCustomers
	
	^(self numberOfActiveCustomers + self numberOfSuspendedCustomers). ! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
