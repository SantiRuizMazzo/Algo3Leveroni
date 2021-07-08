!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'aPortfolio anAccountAInitiallyWith50Pesos anAccountBInitiallyWith100Pesos firstDepositOfAccountA firstDepositOfAccountB'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'agg 7/8/2021 00:59:00'!
test01BalanceOfEmptyPortfolioIsZero

	self assertThatAnEmptyPortfolioAfter: [] hasBalanceOf: (0*peso)
! !

!PortfolioTest methodsFor: 'tests' stamp: 'agg 7/8/2021 01:20:17'!
test02BalanceOfPortfolioWithOnlyOneAccountIsEqualToItsBalance
	
	self assertThatAnEmptyPortfolioAfter: [ aPortfolio add: anAccountAInitiallyWith50Pesos.] hasBalanceOf: (50*peso)
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'agg 7/8/2021 01:26:58'!
test03BalanceOfPortfolioWithMoreThanOneAccountIsTheSumOfAllAccountsBalances
	
	self assertThatAnEmptyPortfolioAfter: [ self addAccountAAndAccountBToAPortfolio ] hasBalanceOf: (150*peso)
			! !

!PortfolioTest methodsFor: 'tests' stamp: 'agg 7/8/2021 01:48:05'!
test04PortfolioKnowsRegisteredTransactions
	
	self addAccountAAndAccountBToAPortfolio.
	
	self assert: (aPortfolio hasRegistered: firstDepositOfAccountA).	
	self assert: (aPortfolio hasRegistered: firstDepositOfAccountB).! !

!PortfolioTest methodsFor: 'tests' stamp: 'agg 7/8/2021 01:09:13'!
test05PortfolioDoesNotKnowNotRegisteredTransactions
	
	aPortfolio add: (ReceptiveAccount new).
	
	self deny: (aPortfolio hasRegistered: (Deposit for: 5*peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'agg 7/8/2021 01:53:20'!
test06EmptyPortfolioHasNoTransactions
			
	self assert: 0 equals: aPortfolio transactions size
	
	"self assertThatAnEmptyPortfolioAfter: []
	hasTransactionSize: 0
	andIncludesTheTransactions: #()"! !

!PortfolioTest methodsFor: 'tests' stamp: 'agg 7/8/2021 01:53:24'!
test07PortfolioWithOnlyOneTransactionKnowsIt

	aPortfolio add: anAccountAInitiallyWith50Pesos.
	
	self assert: 1 equals: aPortfolio transactions size.
	self assert: (aPortfolio transactions includes: firstDepositOfAccountA)
	
	"self assertThatAnEmptyPortfolioAfter: [aPortfolio add: anAccountAInitiallyWith50Pesos.]
	hasTransactionSize: 1
	andIncludesTheTransactions: #(firstDepositOfAccountA)"! !

!PortfolioTest methodsFor: 'tests' stamp: 'agg 7/8/2021 01:53:37'!
test08PortfolioWithManyTransactionsKnowsThem
	
	|  aWithdraw anotherWithdraw |
	
	aWithdraw _ Withdraw register: 5*peso on: anAccountAInitiallyWith50Pesos.
	
	anotherWithdraw _ Withdraw register: 2*peso on: anAccountBInitiallyWith100Pesos.
	
	self addAccountAAndAccountBToAPortfolio.
	
	self assert: 4 equals: aPortfolio transactions size.
	self assert: (aPortfolio transactions includes: firstDepositOfAccountA).
	self assert: (aPortfolio transactions includes: aWithdraw).
	self assert: (aPortfolio transactions includes: firstDepositOfAccountB).
	self assert: (aPortfolio transactions includes: anotherWithdraw)
	
	"self assertThatAnEmptyPortfolioAfter: [self addAccountAAndAccountBToAPortfolio.]
	hasTransactionSize: 4
	andIncludesTheTransactions: #(firstDepositOfAccountA, aWithdraw, firstDepositOfAccountB,anotherWithdraw)"
	! !


!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'agg 7/8/2021 01:26:26'!
addAccountAAndAccountBToAPortfolio
			
	aPortfolio add: anAccountAInitiallyWith50Pesos.
	aPortfolio add: anAccountBInitiallyWith100Pesos.	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'agg 7/8/2021 00:57:42'!
assertThatAnEmptyPortfolioAfter: bloque hasBalanceOf: balanceValue
	
	bloque value.
		
	self assert: balanceValue equals: aPortfolio balance! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'agg 7/8/2021 01:41:04'!
assertThatAnEmptyPortfolioAfter: bloque hasTransactionSize: size andIncludesTheTransactions: collectionOfTransactions
	
	bloque value.
	
	self assert: size equals: aPortfolio transactions size.
	"self assert: (collectionOfTransactions allSatisfy: [:transaction | aPortfolio transactions includes: transaction])."! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'agg 7/8/2021 01:20:52'!
setUp

	aPortfolio _ Portfolio new.
	anAccountAInitiallyWith50Pesos _ ReceptiveAccount createWith: 50*peso.
	anAccountBInitiallyWith100Pesos _ ReceptiveAccount createWith: 100*peso.
	firstDepositOfAccountA _ anAccountAInitiallyWith50Pesos firstTransaction.
	firstDepositOfAccountB _ anAccountBInitiallyWith100Pesos firstTransaction.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'agg 7/8/2021 00:02:09'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated
	
	self assertThatAnEmptyAccountAfterTransactions: [] hasBalanceOf: (0*peso)
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'agg 7/8/2021 00:01:37'!
test02DepositIncreasesBalanceOnTransactionValue 
		
	self assertThatAnEmptyAccountAfterTransactions: [Deposit register: 100 * peso on: account.]
	 	hasBalanceOf: (100*peso)
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'agg 7/8/2021 00:01:00'!
test03WithdrawDecreasesBalanceOnTransactionValue 
	
	self assertThatAnEmptyAccountAfterTransactions: [
			Deposit register: 100 * peso on: account.
			Withdraw register: 50 * peso on: account.
		]
	 		hasBalanceOf: (50*peso)! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'agg 7/7/2021 23:52:14'!
test04WithdrawValueMustBePositive 

	| withdrawValue |
	
	withdrawValue _ 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'agg 7/7/2021 23:52:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| deposit withdraw |
	
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'agg 7/7/2021 23:52:26'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw |
	
	deposit _  Deposit for: 100 * peso.
	withdraw _ Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'agg 7/7/2021 23:48:45'!
test07AccountKnowsItsTransactions 

	| deposit |
		
	deposit _ Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!ReceptiveAccountTest methodsFor: 'as yet unclassified' stamp: 'agg 7/7/2021 23:59:06'!
assertThatAnEmptyAccountAfterTransactions: transactionsBloque hasBalanceOf: balanceValue
	
	transactionsBloque value.
		
	self assert: balanceValue equals: account balance! !

!ReceptiveAccountTest methodsFor: 'as yet unclassified' stamp: 'agg 7/7/2021 23:48:45'!
setUp

	account _ ReceptiveAccount new.
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'receiverAccount senderAccountwith10pesos aTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'agg 7/7/2021 23:41:36'!
setUp
	senderAccountwith10pesos _ ReceptiveAccount createWith: (10*peso).
	receiverAccount _ ReceptiveAccount new! !

!TransferTest methodsFor: 'tests' stamp: 'agg 7/7/2021 23:27:03'!
test01TransferDecreasesBalanceOnSenderAccountAndIncreasesBalanceOnReceiverAccount
	
	self transfer5pesosAndAssertThat: [
			self assert: 5*peso equals: senderAccountwith10pesos balance.
			self assert: 5*peso equals: receiverAccount balance
		]! !

!TransferTest methodsFor: 'tests' stamp: 'agg 7/7/2021 23:34:20'!
test02TransferFromAccountWithInsufficientBalanceShouldRaiseAnError
	
	self doAInvalidTransferenceOf: (20*peso) assertTransferenceIsNotDoneAndThatErrorDescriptionIs: Transfer insufficientBalanceErrorDescription

! !

!TransferTest methodsFor: 'tests' stamp: 'agg 7/7/2021 23:26:11'!
test03TransferKnowsItsOwnValue
	
	self transfer5pesosAndAssertThat: [ self assert: 5*peso equals: aTransfer value]! !

!TransferTest methodsFor: 'tests' stamp: 'agg 7/7/2021 23:27:22'!
test04TransferIsRegisteredOnSenderAndReceiverAccounts
		
	self transfer5pesosAndAssertThat: [
			self assert: (senderAccountwith10pesos hasRegistered: aTransfer withdrawSide).
			self assert: (receiverAccount hasRegistered: aTransfer depositSide).
		]! !

!TransferTest methodsFor: 'tests' stamp: 'agg 7/7/2021 23:34:51'!
test05TransferWithAnInvalidValueShouldRaiseAnError
	
	self doAInvalidTransferenceOf: (-5*peso) assertTransferenceIsNotDoneAndThatErrorDescriptionIs: Transfer invalidValueErrorDescription
! !

!TransferTest methodsFor: 'tests' stamp: 'agg 7/7/2021 23:20:19'!
test06WithdrawSideOfTransferKnowsItsOppositeSide
		
	self transferAndAssertThatSide: [aTransfer withdrawSide] knowsOppositeSide: [aTransfer depositSide] ! !

!TransferTest methodsFor: 'tests' stamp: 'agg 7/7/2021 23:19:58'!
test07DepositSideOfTransferKnowsItsOppositeSide

	self transferAndAssertThatSide: [aTransfer depositSide] knowsOppositeSide: [aTransfer withdrawSide] ! !


!TransferTest methodsFor: 'private' stamp: 'agg 7/7/2021 23:34:07'!
doAInvalidTransferenceOf: value assertTransferenceIsNotDoneAndThatErrorDescriptionIs: errorDescription

	self should: [Transfer register: value from: senderAccountwith10pesos to: receiverAccount] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 	self assert: anError messageText = errorDescription.
					     			self assert: 10*peso equals: senderAccountwith10pesos balance.
					     			self assert: 0*peso equals: receiverAccount balance]


! !

!TransferTest methodsFor: 'private' stamp: 'agg 7/7/2021 23:25:11'!
transfer5pesosAndAssertThat: assertionBlock

	aTransfer _ Transfer register: 5*peso from: senderAccountwith10pesos to: receiverAccount.
		
	assertionBlock value.! !

!TransferTest methodsFor: 'private' stamp: 'agg 7/7/2021 23:20:27'!
transferAndAssertThatSide: aSide knowsOppositeSide: oppositeSide
	
	aTransfer _ Transfer register: 5*peso from: senderAccountwith10pesos to: receiverAccount.
	
	self assert: aSide value oppositeSide equals: oppositeSide value
	
! !


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

!Portfolio methodsFor: 'as yet unclassified' stamp: 'agg 7/8/2021 00:13:04'!
addTo: aCollection allTransactionsWithAccount: anAccount

	aCollection addAll: (anAccount transactions). 																		  																		        ^aCollection! !

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

!Portfolio methodsFor: 'as yet unclassified' stamp: 'agg 7/8/2021 00:13:50'!
transactions
	
	^accounts inject: (OrderedCollection new)
				into: [:aCollection :anAccount | self addTo: aCollection allTransactionsWithAccount: anAccount].
	! !


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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'agg 7/8/2021 01:01:28'!
firstTransaction
	^transactions first! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'agg 7/7/2021 23:40:45'!
initializeWith: value

	Deposit register: value on: self.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Ejercicio'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'agg 7/7/2021 23:38:47'!
createWith: value

	^self new initializeWith: value! !


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


!TransferSide methodsFor: 'Public messages' stamp: 'SRM 7/7/2021 10:43:51'!
effectOnBalance: aBalance

	self subclassResponsibility ! !

!TransferSide methodsFor: 'Public messages' stamp: 'SRM 7/7/2021 11:43:45'!
oppositeSide

	self subclassResponsibility ! !

!TransferSide methodsFor: 'Public messages' stamp: 'SRM 7/7/2021 10:46:40'!
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
