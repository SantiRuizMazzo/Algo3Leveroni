!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'SRM 7/5/2021 21:12:57'!
test01BalanceOfEmptyPortfolioIsZero
	
	| aPortfolio |
	
	aPortfolio _ Portfolio new.
	
	self assert: 0*peso equals: aPortfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'SRM 7/5/2021 21:24:27'!
test02BalanceOfPortfolioWithOnlyOneAccountIsEqualToItsBalance
	
	| aPortfolio anAccount |
	
	anAccount _ ReceptiveAccount new.
	aPortfolio _ Portfolio new.
	
	Deposit register: 50*peso on: anAccount.
	aPortfolio add: anAccount.
	
	self assert: 50*peso equals: aPortfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'SRM 7/5/2021 21:15:35'!
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

!PortfolioTest methodsFor: 'tests' stamp: 'SRM 7/7/2021 15:04:49'!
test04PortfolioKnowsRegisteredTransactions
	
	| aPortfolio anAccount anotherAccount aDeposit anotherDeposit |
	
	anAccount _ ReceptiveAccount new.
	aDeposit _ Deposit register: 10*peso on: anAccount.
	
	anotherAccount _ ReceptiveAccount new.
	anotherDeposit _  Deposit register: 10*peso on: anotherAccount.
	
	aPortfolio _ Portfolio new.
	aPortfolio add: anAccount.
	aPortfolio add: anotherAccount.
	
	self assert: (aPortfolio hasRegistered: aDeposit).	
	self assert: (aPortfolio hasRegistered: anotherDeposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'SRM 7/6/2021 21:05:31'!
test05PortfolioDoesNotKnowNotRegisteredTransactions
	
	| aPortfolio aReceptiveAccount aDeposit |
	
	aReceptiveAccount _ ReceptiveAccount new.
	aDeposit _ Deposit for: 5*peso.
	aPortfolio _ Portfolio new.
	aPortfolio add: aReceptiveAccount.
	
	self deny: (aPortfolio hasRegistered: aDeposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'SRM 7/6/2021 21:23:31'!
test06EmptyPortfolioHasNoTransactions
	
	| aPortfolio |
	
	aPortfolio _ Portfolio new.
	
	self assert: 0 equals: aPortfolio transactions size! !

!PortfolioTest methodsFor: 'tests' stamp: 'SRM 7/7/2021 15:18:00'!
test07PortfolioWithOnlyOneTransactionKnowsIt
	
	| aPortfolio anAccount aDeposit |
	
	anAccount _ ReceptiveAccount new.
	aDeposit _ Deposit register: 50*peso on: anAccount.
	aPortfolio _ Portfolio new.
	aPortfolio add: anAccount.
	
	self assert: 1 equals: aPortfolio transactions size.
	self assert: (aPortfolio transactions includes: aDeposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'SRM 7/7/2021 15:40:03'!
test08PortfolioWithManyTransactionsKnowsThem
	
	| aPortfolio anAccount anotherAccount aDeposit anotherDeposit aWithdraw anotherWithdraw |
	
	anAccount _ ReceptiveAccount new.
	aDeposit _ Deposit register: 10*peso on: anAccount.
	aWithdraw _ Withdraw register: 5*peso on: anAccount.
	
	anotherAccount _ ReceptiveAccount new.
	anotherDeposit _  Deposit register: 10*peso on: anotherAccount.
	anotherWithdraw _ Withdraw register: 2*peso on: anotherAccount.
	
	aPortfolio _ Portfolio new.
	aPortfolio add: anAccount.
	aPortfolio add: anotherAccount.
	
	self assert: 4 equals: aPortfolio transactions size.
	self assert: (aPortfolio transactions includes: aDeposit).
	self assert: (aPortfolio transactions includes: anotherDeposit).
	self assert: (aPortfolio transactions includes: aWithdraw).
	self assert: (aPortfolio transactions includes: anotherWithdraw)
	! !


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

!TransferTest methodsFor: 'tests' stamp: 'SRM 7/6/2021 16:54:18'!
test01TransferDecreasesBalanceOnSenderAccountAndIncreasesBalanceOnReceiverAccount

	| senderAccount receiverAccount |
	
	senderAccount _ ReceptiveAccount new.
	Deposit register: 10*peso on: senderAccount.
	
	receiverAccount _ ReceptiveAccount new.
	
	Transfer register: 5*peso from: senderAccount to: receiverAccount.
	
	self assert: 5*peso equals: senderAccount balance.
	self assert: 5*peso equals: receiverAccount balance! !

!TransferTest methodsFor: 'tests' stamp: 'SRM 7/7/2021 14:27:48'!
test02TransferFromAccountWithInsufficientBalanceShouldRaiseAnError

	| senderAccount receiverAccount |
	
	senderAccount _ ReceptiveAccount new.
	receiverAccount _ ReceptiveAccount new.
	
	self should: [Transfer register: 5*peso from: senderAccount to: receiverAccount] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [			:anError | 			self assert: anError messageText = Transfer insufficientBalanceErrorDescription.
								self assert: 0*peso equals: senderAccount balance.
								self assert: 0*peso equals: receiverAccount balance]
! !

!TransferTest methodsFor: 'tests' stamp: 'SRM 7/7/2021 09:26:24'!
test03TransferKnowsItsOwnValue

	| senderAccount receiverAccount aTransfer |
	
	senderAccount _ ReceptiveAccount new.
	Deposit register: 10*peso on: senderAccount.
	
	receiverAccount _ ReceptiveAccount new.
	
	aTransfer _ Transfer register: 5*peso from: senderAccount to: receiverAccount.
	
	self assert: 5*peso equals: aTransfer value! !

!TransferTest methodsFor: 'tests' stamp: 'SRM 7/7/2021 11:43:07'!
test04TransferIsRegisteredOnSenderAndReceiverAccounts

	| senderAccount receiverAccount deposit transfer |
	
	senderAccount _ ReceptiveAccount new.
	deposit _ Deposit register: 10 * peso on: senderAccount.
	
	receiverAccount _ ReceptiveAccount new.
	
	transfer _ Transfer register: 5*peso from: senderAccount to: receiverAccount.
		
	self assert: (senderAccount hasRegistered: transfer withdrawSide).
	self assert: (receiverAccount hasRegistered: transfer depositSide).! !

!TransferTest methodsFor: 'tests' stamp: 'SRM 7/7/2021 14:30:54'!
test05TransferWithAnInvalidValueShouldRaiseAnError

	| senderAccount receiverAccount |
	
	senderAccount _ ReceptiveAccount new.
	receiverAccount _ ReceptiveAccount new.
	
	self should: [Transfer register: -5*peso from: senderAccount to: receiverAccount] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [			:anError | 			self assert: anError messageText = Transfer invalidValueErrorDescription.
								self assert: 0*peso equals: senderAccount balance.
								self assert: 0*peso equals: receiverAccount balance]! !

!TransferTest methodsFor: 'tests' stamp: 'SRM 7/7/2021 11:43:45'!
test06WithdrawSideOfTransferKnowsItsOppositeSide

	| senderAccount receiverAccount aTransfer |
	
	senderAccount _ ReceptiveAccount new.
	Deposit register: 10*peso on: senderAccount.
	
	receiverAccount _ ReceptiveAccount new.
	
	aTransfer _ Transfer register: 5*peso from: senderAccount to: receiverAccount.
	
	self assert: aTransfer withdrawSide oppositeSide equals: aTransfer depositSide! !

!TransferTest methodsFor: 'tests' stamp: 'SRM 7/7/2021 15:02:05'!
test07DepositSideOfTransferKnowsItsOppositeSide

	| senderAccount receiverAccount aTransfer |
	
	senderAccount _ ReceptiveAccount new.
	Deposit register: 10*peso on: senderAccount.
	
	receiverAccount _ ReceptiveAccount new.
	
	aTransfer _ Transfer register: 5*peso from: senderAccount to: receiverAccount.
	
	self assert: aTransfer depositSide oppositeSide equals: aTransfer withdrawSide! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value contraparte'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 10:40:52'!
effectOnBalance: aBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 10:03:27'!
initializeFor: aValue

	value _ aValue ! !

!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'SRM 7/5/2021 15:54:53'!
value 

	^value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'SRM 7/7/2021 10:02:41'!
for: aValue

	^ self new initializeFor: aValue ! !

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

!Deposit methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 10:41:25'!
effectOnBalance: aBalance

	^aBalance + self value! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 10:41:41'!
effectOnBalance: aBalance

	^aBalance - self value! !


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

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 15:38:27'!
transactions
	
	| unaColeccion |
	unaColeccion _ OrderedCollection new.
	unaColeccion _ accounts inject: (OrderedCollection new) into: [:aCollection :anAccount | aCollection addAll: anAccount transactions. 																		  																		            																		   aCollection].
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


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SRM 7/7/2021 10:43:06'!
balance

	^transactions inject: 0*peso into: [:currentBalance :aTransaction | aTransaction effectOnBalance: currentBalance]! !

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
	instanceVariableNames: 'withdrawSide depositSide value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 11:52:53'!
depositSide

	^depositSide ! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 11:52:53'!
initializeFor: aValue from: senderAccount to: receiverAccount

	value _ aValue.
	withdrawSide _ WithdrawSide beRegisteredBy: self on: senderAccount.
	depositSide _ DepositSide beRegisteredBy: self on: receiverAccount
	! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'SRM 7/6/2021 16:57:59'!
value

	^value! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 11:52:46'!
withdrawSide

	^withdrawSide! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: 'withdraw deposit'!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 14:25:59'!
insufficientBalanceErrorDescription

	^'Insufficient sender account balance'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 09:55:45'!
invalidValueErrorDescription
	
	^'Invalid value'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 14:23:41'!
register: aValue from: senderAccount to: receiverAccount

	aValue <= (0*peso) ifTrue: [self error: self invalidValueErrorDescription].
	(senderAccount balance < aValue) ifTrue: [self error: self insufficientBalanceErrorDescription].
	^self new initializeFor: aValue from: senderAccount to: receiverAccount.! !


!classDefinition: #TransferSide category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferSide
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferSide methodsFor: 'Initialization' stamp: 'SRM 7/7/2021 12:01:24'!
initializeFor: aTransfer

	transfer _ aTransfer! !


!TransferSide methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 10:43:51'!
effectOnBalance: aBalance

	self subclassResponsibility ! !

!TransferSide methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 11:43:45'!
oppositeSide

	self subclassResponsibility ! !

!TransferSide methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 10:46:40'!
value

	^transfer value

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferSide class' category: 'ServiciosFinancieros-Ejercicio'!
TransferSide class
	instanceVariableNames: ''!

!TransferSide class methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 12:03:02'!
beRegisteredBy: aTransfer on: anAccount

	| aTransferSide |

	aTransferSide _ self of: aTransfer.
	anAccount register: aTransferSide.
	^aTransferSide! !

!TransferSide class methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 12:06:09'!
of: aTransfer

	^self new initializeFor: aTransfer! !


!classDefinition: #DepositSide category: 'ServiciosFinancieros-Ejercicio'!
TransferSide subclass: #DepositSide
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositSide methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 10:44:19'!
effectOnBalance: aBalance

	^aBalance + self value! !

!DepositSide methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 11:43:45'!
oppositeSide

	^transfer withdrawSide ! !


!classDefinition: #WithdrawSide category: 'ServiciosFinancieros-Ejercicio'!
TransferSide subclass: #WithdrawSide
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawSide methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 10:44:29'!
effectOnBalance: aBalance

	^aBalance - self value! !

!WithdrawSide methodsFor: 'as yet unclassified' stamp: 'SRM 7/7/2021 11:43:45'!
oppositeSide

	^transfer depositSide ! !
