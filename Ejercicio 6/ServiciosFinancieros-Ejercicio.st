!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'test' stamp: 'SRM 7/5/2021 21:12:57'!
test01BalanceOfEmptyPortfolioIsZero
	
	| aPortfolio |
	
	aPortfolio _ Portfolio new.
	
	self assert: 0*peso equals: aPortfolio balance! !

!PortfolioTest methodsFor: 'test' stamp: 'SRM 7/5/2021 21:24:27'!
test02BalanceOfPortfolioWithOnlyOneAccountIsEqualToItsBalance
	
	| aPortfolio anAccount |
	
	anAccount _ ReceptiveAccount new.
	aPortfolio _ Portfolio new.
	
	Deposit register: 50*peso on: anAccount.
	aPortfolio add: anAccount.
	
	self assert: 50*peso equals: aPortfolio balance! !

!PortfolioTest methodsFor: 'test' stamp: 'SRM 7/5/2021 21:15:35'!
test03BalanceOfPortfolioWithMoreThanOneAccountIsTheSumOfAllAccountsBalances
	
	| aPortfolio anAccount anotherAccount |
	
	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	aPortfolio _ Portfolio new.
	
	Deposit register: 50*peso on: anAccount.
	Deposit register: 100*peso on: anotherAccount.
	
	aPortfolio add: anAccount.
	aPortfolio add: anotherAccount.	
	
	self assert: 150*peso equals: aPortfolio balance! !

!PortfolioTest methodsFor: 'test' stamp: 'SRM 7/6/2021 21:05:25'!
test04PortfolioKnowsRegisteredTransactions
	
	| aPortfolio aReceptiveAccount anotherAccount aDeposit anotherDeposit |
	
	aReceptiveAccount _ ReceptiveAccount new.
	aDeposit _ Deposit register: 10*peso on: aReceptiveAccount.
	anotherAccount _ ReceptiveAccount new.
	anotherDeposit _  Deposit register: 10*peso on: anotherAccount.
	aPortfolio _ Portfolio new.
	aPortfolio add: aReceptiveAccount.
	aPortfolio add: anotherAccount.
	
	self assert: (aPortfolio hasRegistered: aDeposit).	
	self assert: (aPortfolio hasRegistered: anotherDeposit).! !

!PortfolioTest methodsFor: 'test' stamp: 'SRM 7/6/2021 21:05:31'!
test05PortfolioDoesNotKnowNotRegisteredTransactions
	
	| aPortfolio aReceptiveAccount aDeposit |
	
	aReceptiveAccount _ ReceptiveAccount new.
	aDeposit _ Deposit for: 5*peso.
	aPortfolio _ Portfolio new.
	aPortfolio add: aReceptiveAccount.
	
	self deny: (aPortfolio hasRegistered: aDeposit)! !

!PortfolioTest methodsFor: 'test' stamp: 'SRM 7/6/2021 21:23:31'!
test06EmptyPortfolioHasNoTransactions
	
	| aPortfolio |
	
	aPortfolio _ Portfolio new.
	
	self assert: 0 equals: aPortfolio transactions size! !

!PortfolioTest methodsFor: 'test' stamp: 'SRM 7/6/2021 21:34:03'!
test07
	
	| aPortfolio anAccount aDeposit |
	
	anAccount _ ReceptiveAccount new.
	aDeposit _ Deposit register: 50*peso on: anAccount.
	aPortfolio _ Portfolio new.
	aPortfolio add: anAccount.
	
	self assert: 1 equals: aPortfolio transactions size.
	self assert: (aPortfolio transactions includes: aDeposit)! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SRM 7/5/2021 16:02:00'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated

	| account |
	
	account _ ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SRM 7/5/2021 16:02:06'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account _ ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SRM 7/5/2021 16:02:12'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account _ ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SRM 7/5/2021 16:02:21'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account _ ReceptiveAccount new.
	withdrawValue _ 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SRM 7/6/2021 17:02:11'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SRM 7/5/2021 16:02:50'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account _ ReceptiveAccount new.
	deposit _  Deposit for: 100 * peso.
	withdraw _ Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SRM 7/5/2021 16:02:57'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account _ ReceptiveAccount new.
	
	deposit _ Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 16:54:18'!
test01TransferDecreasesBalanceOnSenderAccountAndIncreasesBalanceOnReceiverAccount

	| senderAccount receiverAccount |
	
	senderAccount _ ReceptiveAccount new.
	Deposit register: 10*peso on: senderAccount.
	
	receiverAccount _ ReceptiveAccount new.
	
	Transfer register: 5*peso from: senderAccount to: receiverAccount.
	
	self assert: 5*peso equals: senderAccount balance.
	self assert: 5*peso equals: receiverAccount balance! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 17:15:15'!
test02TransferFromAccountWithNotEnoughMoneyShouldRaiseAnError

	| senderAccount receiverAccount |
	
	senderAccount _ ReceptiveAccount new.
	receiverAccount _ ReceptiveAccount new.
	
	self should: [Transfer register: 5*peso from: senderAccount to: receiverAccount] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [			:anError | 			self assert: anError messageText = Transfer notEnoughMoneyErrorDescription.
								self assert: 0*peso equals: senderAccount balance.
								self assert: 0*peso equals: receiverAccount balance]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 16:59:40'!
test03TransferKnowsItsOwnValue

	| senderAccount receiverAccount transfer |
	
	senderAccount _ ReceptiveAccount new.
	Deposit register: 10*peso on: senderAccount.
	
	receiverAccount _ ReceptiveAccount new.
	
	transfer _ Transfer register: 5*peso from: senderAccount to: receiverAccount.
	
	self assert: 5*peso equals: transfer value! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 17:07:19'!
test04TransferIsRegisteredInSenderAndReceiverAccounts

	| senderAccount receiverAccount deposit transfer |
	
	senderAccount _ ReceptiveAccount new.
	deposit _ Deposit register: 10 * peso on: senderAccount.
	
	receiverAccount _ ReceptiveAccount new.
	
	transfer _ Transfer register: 5*peso from: senderAccount to: receiverAccount.
		
	self assert: (senderAccount hasRegistered: transfer withdraw).
	self assert: (receiverAccount hasRegistered: transfer deposit).! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 17:33:11'!
test05TransferWithANonPositiveValueShouldRaiseAnError

	| senderAccount receiverAccount |
	
	senderAccount _ ReceptiveAccount new.
	receiverAccount _ ReceptiveAccount new.
	
	self should: [Transfer register: -5*peso from: senderAccount to: receiverAccount] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [			:anError | 			self assert: anError messageText = 'Valor invalido'.
								self assert: 0*peso equals: senderAccount balance.
								self assert: 0*peso equals: receiverAccount balance]! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 18:03:01'!
test06

	| senderAccount receiverAccount aTransfer |
	
	senderAccount _ ReceptiveAccount new.
	Deposit register: 10*peso on: senderAccount.
	
	receiverAccount _ ReceptiveAccount new.
	
	aTransfer _ Transfer register: 5*peso from: senderAccount to: receiverAccount.
	
	self assert: aTransfer withdraw contraparte equals: aTransfer deposit! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 21:05:39'!
test06EmptyPortfolioHasNoTransactions

	| senderAccount receiverAccount aTransfer |
	
	senderAccount _ ReceptiveAccount new.
	Deposit register: 10*peso on: senderAccount.
	
	receiverAccount _ ReceptiveAccount new.
	
	aTransfer _ Transfer register: 5*peso from: senderAccount to: receiverAccount.
	
	self assert: aTransfer deposit contraparte equals: aTransfer withdraw! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value contraparte'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'SRM 7/5/2021 15:54:53'!
value 

	^value ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 18:08:27'!
contraparte
	
	^contraparte! !

!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 18:08:48'!
suContraparteEs: unaTransaccion

	contraparte _ unaTransaccion! !

!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'SRM 7/5/2021 19:45:38'!
valueForBalance

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'SRM 7/4/2021 17:28:35'!
initializeFor: aValue

	value := aValue! !



!Withdraw methodsFor: 'as yet unclassified' stamp: 'SRM 7/5/2021 19:45:38'!
valueForBalance

	^self value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'SRM 7/4/2021 15:53:55'!
for: aValue

	^ self new initializeFor: aValue! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SRM 7/5/2021 21:21:28'!
add: aReceptiveAccount 
	
	accounts add: aReceptiveAccount! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SRM 7/5/2021 21:25:33'!
balance
	
	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [^0*peso]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 20:51:42'!
hasRegistered: aTransaction

	^accounts anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction]
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SRM 7/5/2021 21:11:01'!
initialize

	accounts _ OrderedCollection new! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 21:37:29'!
transactions
	
	"^OrderedCollection new add: (accounts first transactions first)"
	| unaColeccion |
	unaColeccion _ OrderedCollection new.
	unaColeccion _ accounts collect: [:anAccount | anAccount transactions first].
	^unaColeccion! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SRM 7/5/2021 19:45:38'!
balance

	^transactions sum: [:aTransaction | aTransaction valueForBalance] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SRM 7/4/2021 16:06:56'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'withdraw deposit value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'SRM 7/5/2021 09:04:19'!
deposit

	^deposit ! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 18:09:32'!
initializeFor: aValue from: accountA to: accountB

	withdraw _ Withdraw register: aValue on: accountA.
	deposit _ Deposit register: aValue on: accountB.
	withdraw suContraparteEs: deposit.
	deposit suContraparteEs: withdraw.
	value _ aValue! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 16:57:59'!
value

	^value! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'SRM 7/5/2021 09:04:11'!
withdraw

	^withdraw! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: 'withdraw deposit'!

!Transfer class methodsFor: 'x' stamp: 'SRM 7/4/2021 18:57:36'!
notEnoughMoneyErrorDescription

	^'Not enough money'! !

!Transfer class methodsFor: 'x' stamp: 'SRM 7/6/2021 17:26:56'!
register: aValue from: accountA to: accountB

	aValue <= (0*peso) ifTrue: [self error: 'Valor invalido'].
	(accountA balance < aValue) ifTrue: [self error: self notEnoughMoneyErrorDescription].
	^self new initializeFor: aValue from: accountA to: accountB.! !



!classDefinition: #TransferPart category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferPart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #DepositPart category: 'ServiciosFinancieros-Ejercicio'!
TransferPart subclass: #DepositPart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositPart methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 18:27:55'!
value! !


!classDefinition: #WithdrawPart category: 'ServiciosFinancieros-Ejercicio'!
TransferPart subclass: #WithdrawPart
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawPart methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 18:27:59'!
value! !
