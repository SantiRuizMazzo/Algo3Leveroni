!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'aPortfolio anAccountAInitiallyWith50Pesos anAccountBInitiallyWith100Pesos firstDepositOfAccountA firstDepositOfAccountB'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'agg 7/8/2021 01:20:52'!
setUp

	aPortfolio _ Portfolio new.
	anAccountAInitiallyWith50Pesos _ ReceptiveAccount createWith: 50*peso.
	anAccountBInitiallyWith100Pesos _ ReceptiveAccount createWith: 100*peso.
	firstDepositOfAccountA _ anAccountAInitiallyWith50Pesos firstTransaction.
	firstDepositOfAccountB _ anAccountBInitiallyWith100Pesos firstTransaction.! !

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

!PortfolioTest methodsFor: 'tests' stamp: 'agg 7/8/2021 16:06:42'!
test06EmptyPortfolioHasNoTransactions
			
	self assertThatAnEmptyPortfolioAfter: []
	hasTransactionSize: 0
	andIncludesTheTransactions: (OrderedCollection new).! !

!PortfolioTest methodsFor: 'tests' stamp: 'agg 7/8/2021 16:05:05'!
test07PortfolioWithOnlyOneTransactionKnowsIt

	self assertThatAnEmptyPortfolioAfter: [aPortfolio add: anAccountAInitiallyWith50Pesos]
	hasTransactionSize: 1
	andIncludesTheTransactions: (OrderedCollection with: firstDepositOfAccountA).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'agg 7/8/2021 16:02:40'!
test08PortfolioWithManyTransactionsKnowsThem
	
	|  aWithdraw anotherWithdraw |
	
	aWithdraw _ Withdraw register: 5*peso on: anAccountAInitiallyWith50Pesos.
	
	anotherWithdraw _ Withdraw register: 2*peso on: anAccountBInitiallyWith100Pesos.

	self assertThatAnEmptyPortfolioAfter: [self addAccountAAndAccountBToAPortfolio.]
	hasTransactionSize: 4
	andIncludesTheTransactions: (OrderedCollection
		with: firstDepositOfAccountA
		with: aWithdraw
		with: firstDepositOfAccountB
		with: anotherWithdraw).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'SRM 7/8/2021 18:09:38'!
test09PortfolioCannotHaveSameAccountMoreThanOnce
	
	"desafio extra"
	aPortfolio add: anAccountAInitiallyWith50Pesos.
	
	self errorShouldBeRaisedWhendAdded: anAccountAInitiallyWith50Pesos
	

	! !

!PortfolioTest methodsFor: 'tests' stamp: 'SRM 7/8/2021 18:09:38'!
test10PortfolioCannotHaveAPortfolioWithAnExistingAccount
	
	"desafio extra"
	| anotherPortfolio |
	anotherPortfolio _ Portfolio new.
	anotherPortfolio add: anAccountAInitiallyWith50Pesos.
	aPortfolio add: anAccountAInitiallyWith50Pesos.
	
	self errorShouldBeRaisedWhendAdded: anotherPortfolio
	

	! !


!PortfolioTest methodsFor: 'Private' stamp: 'agg 7/8/2021 01:26:26'!
addAccountAAndAccountBToAPortfolio
			
	aPortfolio add: anAccountAInitiallyWith50Pesos.
	aPortfolio add: anAccountBInitiallyWith100Pesos.	! !

!PortfolioTest methodsFor: 'Private' stamp: 'agg 7/8/2021 00:57:42'!
assertThatAnEmptyPortfolioAfter: bloque hasBalanceOf: balanceValue
	
	bloque value.
		
	self assert: balanceValue equals: aPortfolio balance! !

!PortfolioTest methodsFor: 'Private' stamp: 'agg 7/8/2021 16:01:30'!
assertThatAnEmptyPortfolioAfter: bloque hasTransactionSize: size andIncludesTheTransactions: collectionOfTransactions
	
	bloque value.
	
	self assert: size equals: aPortfolio transactions size.
	self assert: (collectionOfTransactions allSatisfy: [:transaction | aPortfolio transactions includes: transaction]).! !

!PortfolioTest methodsFor: 'Private' stamp: 'SRM 7/8/2021 18:09:38'!
errorShouldBeRaisedWhendAdded: anExistingAccount

	self should: [aPortfolio add: anExistingAccount] 
		raise: Error -MessageNotUnderstood 
		withExceptionDo: [:anError | anError messageText = Portfolio alreadyExistingAccountErrorDescription.
								self assert: (aPortfolio numberOfAccountsIs: 1)]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'agg 7/7/2021 23:48:45'!
setUp

	account _ ReceptiveAccount new.
! !

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


!ReceptiveAccountTest methodsFor: 'Private' stamp: 'agg 7/7/2021 23:59:06'!
assertThatAnEmptyAccountAfterTransactions: transactionsBloque hasBalanceOf: balanceValue
	
	transactionsBloque value.
		
	self assert: balanceValue equals: account balance! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'receiverAccount senderAccounInitiallyWith10Pesos aTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'SRM 7/8/2021 17:45:36'!
setUp
	
	senderAccounInitiallyWith10Pesos _ ReceptiveAccount createWith: (10*peso).
	receiverAccount _ ReceptiveAccount new! !

!TransferTest methodsFor: 'tests' stamp: 'SRM 7/8/2021 17:43:14'!
test01TransferDecreasesBalanceOnSenderAccountAndIncreasesBalanceOnReceiverAccount
	
	self transfer5PesosAndAssertThat: [
			self assert: 5*peso equals: senderAccounInitiallyWith10Pesos balance.
			self assert: 5*peso equals: receiverAccount balance
		]! !

!TransferTest methodsFor: 'tests' stamp: 'SRM 7/8/2021 17:44:35'!
test02TransferFromAccountWithInsufficientBalanceShouldRaiseAnError
	
	self makeAnInvalidTransferOf: (20*peso) assertThatTransferIsNotDoneAndErrorDescriptionIs: Transfer insufficientBalanceErrorDescription

! !

!TransferTest methodsFor: 'tests' stamp: 'SRM 7/8/2021 17:45:06'!
test03TransferKnowsItsOwnValue
	
	self transfer5PesosAndAssertThat: [self assert: 5*peso equals: aTransfer value]! !

!TransferTest methodsFor: 'tests' stamp: 'SRM 7/8/2021 17:43:14'!
test04TransferIsRegisteredOnSenderAndReceiverAccounts
		
	self transfer5PesosAndAssertThat: [
			self assert: (senderAccounInitiallyWith10Pesos hasRegistered: aTransfer withdrawSide).
			self assert: (receiverAccount hasRegistered: aTransfer depositSide).
		]! !

!TransferTest methodsFor: 'tests' stamp: 'SRM 7/8/2021 17:44:35'!
test05TransferWithAnInvalidValueShouldRaiseAnError
	
	self makeAnInvalidTransferOf: (-5*peso) assertThatTransferIsNotDoneAndErrorDescriptionIs: Transfer invalidValueErrorDescription
! !

!TransferTest methodsFor: 'tests' stamp: 'agg 7/8/2021 15:47:16'!
test06WithdrawSideOfTransferKnowsItsOppositeSide
		
	self transferAndAssertThatSide: [aTransfer withdrawSide] knowsOppositeSide: [aTransfer depositSide] ! !

!TransferTest methodsFor: 'tests' stamp: 'agg 7/7/2021 23:19:58'!
test07DepositSideOfTransferKnowsItsOppositeSide

	self transferAndAssertThatSide: [aTransfer depositSide] knowsOppositeSide: [aTransfer withdrawSide] ! !


!TransferTest methodsFor: 'Private' stamp: 'SRM 7/8/2021 17:44:35'!
makeAnInvalidTransferOf: value assertThatTransferIsNotDoneAndErrorDescriptionIs: errorDescription

	self should: [Transfer register: value from: senderAccounInitiallyWith10Pesos to: receiverAccount] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 	self assert: anError messageText = errorDescription.
					     			self assert: 10*peso equals: senderAccounInitiallyWith10Pesos balance.
					     			self assert: 0*peso equals: receiverAccount balance]


! !

!TransferTest methodsFor: 'Private' stamp: 'SRM 7/8/2021 17:43:14'!
transfer5PesosAndAssertThat: assertionBlock

	aTransfer _ Transfer register: 5*peso from: senderAccounInitiallyWith10Pesos to: receiverAccount.
		
	assertionBlock value.! !

!TransferTest methodsFor: 'Private' stamp: 'SRM 7/8/2021 17:43:14'!
transferAndAssertThatSide: aBlockWithATransferSide knowsOppositeSide: oppositeSide
	
	aTransfer _ Transfer register: 5*peso from: senderAccounInitiallyWith10Pesos to: receiverAccount.
	
	self assert: aBlockWithATransferSide value oppositeSide equals: oppositeSide value
	
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value contraparte'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'Private' stamp: 'SRM 7/7/2021 10:40:52'!
effectOnBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'Public messages' stamp: 'SRM 7/5/2021 15:54:53'!
value 

	^value ! !


!AccountTransaction methodsFor: 'Initialization - private' stamp: 'SRM 7/7/2021 10:03:27'!
initializeFor: aValue

	value _ aValue ! !

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

!Deposit methodsFor: 'Private' stamp: 'SRM 7/7/2021 10:41:25'!
effectOnBalance: aBalance

	^aBalance + self value! !


!classDefinition: #TransferSide category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferSide
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferSide methodsFor: 'Initialization' stamp: 'SRM 7/7/2021 12:01:24'!
initializeFor: aTransfer

	transfer _ aTransfer! !


!TransferSide methodsFor: 'Private' stamp: 'SRM 7/7/2021 10:43:51'!
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

!TransferSide class methodsFor: 'Instanciation' stamp: 'SRM 7/7/2021 12:03:02'!
beRegisteredBy: aTransfer on: anAccount

	| aTransferSide |

	aTransferSide _ self of: aTransfer.
	anAccount register: aTransferSide.
	^aTransferSide! !

!TransferSide class methodsFor: 'Instanciation' stamp: 'SRM 7/7/2021 12:06:09'!
of: aTransfer

	^self new initializeFor: aTransfer! !


!classDefinition: #DepositSide category: 'ServiciosFinancieros-Ejercicio'!
TransferSide subclass: #DepositSide
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositSide methodsFor: 'Public messages' stamp: 'SRM 7/7/2021 11:43:45'!
oppositeSide

	^transfer withdrawSide ! !


!DepositSide methodsFor: 'Private' stamp: 'SRM 7/7/2021 10:44:19'!
effectOnBalance: aBalance

	^aBalance + self value! !


!classDefinition: #WithdrawSide category: 'ServiciosFinancieros-Ejercicio'!
TransferSide subclass: #WithdrawSide
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawSide methodsFor: 'Private' stamp: 'SRM 7/7/2021 10:44:29'!
effectOnBalance: aBalance

	^aBalance - self value! !


!WithdrawSide methodsFor: 'Public messages' stamp: 'SRM 7/7/2021 11:43:45'!
oppositeSide

	^transfer depositSide ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'Private' stamp: 'SRM 7/7/2021 10:41:41'!
effectOnBalance: aBalance

	^aBalance - self value! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'Initialization - private' stamp: 'SRM 7/5/2021 21:11:01'!
initialize

	accounts _ OrderedCollection new! !


!Portfolio methodsFor: 'Adding' stamp: 'SRM 7/8/2021 18:01:16'!
add: anAccount 
	
	(anAccount alreadyExistsIn: self) ifTrue: [self error: self class alreadyExistingAccountErrorDescription].
	accounts add: anAccount! !


!Portfolio methodsFor: 'Private' stamp: 'SRM 7/8/2021 18:01:41'!
addTo: aCollectionOfTransactions allTransactionsOfAccount: anAccount

	aCollectionOfTransactions addAll: (anAccount transactions). 																		  																		        ^aCollectionOfTransactions! !

!Portfolio methodsFor: 'Private' stamp: 'SRM 7/8/2021 18:00:56'!
alreadyExistsIn: aPortfolio

	^accounts anySatisfy: [:anAccount | self includes: anAccount]
	! !


!Portfolio methodsFor: 'Public messages' stamp: 'SRM 7/5/2021 21:25:33'!
balance
	
	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [^0*peso]! !

!Portfolio methodsFor: 'Public messages' stamp: 'SRM 7/6/2021 20:51:42'!
hasRegistered: aTransaction

	^accounts anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction]
	! !

!Portfolio methodsFor: 'Public messages' stamp: 'SRM 7/8/2021 17:23:31'!
includes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'Public messages' stamp: 'SRM 7/8/2021 16:53:23'!
numberOfAccountsIs: aNumberOfAccounts

	^accounts size = aNumberOfAccounts! !

!Portfolio methodsFor: 'Public messages' stamp: 'agg 7/8/2021 15:52:33'!
transactions
	
	^accounts inject: (OrderedCollection new)
				into: [:aCollection :anAccount | self addTo: aCollection allTransactionsOfAccount: anAccount].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'Error description' stamp: 'SRM 7/8/2021 16:57:45'!
alreadyExistingAccountErrorDescription

	^'Account already exists'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'agg 7/7/2021 23:40:45'!
initializeWith: value

	Deposit register: value on: self.
! !


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


!ReceptiveAccount methodsFor: 'Private' stamp: 'SRM 7/8/2021 18:00:56'!
alreadyExistsIn: aPortfolio

	^aPortfolio includes: self! !

!ReceptiveAccount methodsFor: 'Private' stamp: 'SRM 7/8/2021 17:47:35'!
firstTransaction

	^transactions first! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Ejercicio'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'Instanciation' stamp: 'agg 7/7/2021 23:38:47'!
createWith: value

	^self new initializeWith: value! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'withdrawSide depositSide value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'Accessing' stamp: 'SRM 7/7/2021 11:52:53'!
depositSide

	^depositSide ! !

!Transfer methodsFor: 'Accessing' stamp: 'SRM 7/6/2021 16:57:59'!
value

	^value! !

!Transfer methodsFor: 'Accessing' stamp: 'SRM 7/7/2021 11:52:46'!
withdrawSide

	^withdrawSide! !


!Transfer methodsFor: 'Initialization - private' stamp: 'SRM 7/7/2021 11:52:53'!
initializeFor: aValue from: senderAccount to: receiverAccount

	value _ aValue.
	withdrawSide _ WithdrawSide beRegisteredBy: self on: senderAccount.
	depositSide _ DepositSide beRegisteredBy: self on: receiverAccount
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: 'withdraw deposit'!

!Transfer class methodsFor: 'Instanciation' stamp: 'SRM 7/7/2021 14:23:41'!
register: aValue from: senderAccount to: receiverAccount

	aValue <= (0*peso) ifTrue: [self error: self invalidValueErrorDescription].
	(senderAccount balance < aValue) ifTrue: [self error: self insufficientBalanceErrorDescription].
	^self new initializeFor: aValue from: senderAccount to: receiverAccount.! !


!Transfer class methodsFor: 'Error description' stamp: 'SRM 7/7/2021 14:25:59'!
insufficientBalanceErrorDescription

	^'Insufficient sender account balance'! !

!Transfer class methodsFor: 'Error description' stamp: 'SRM 7/7/2021 09:55:45'!
invalidValueErrorDescription
	
	^'Invalid value'! !
