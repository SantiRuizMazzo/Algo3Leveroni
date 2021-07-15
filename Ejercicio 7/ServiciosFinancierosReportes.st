!classDefinition: #AccountReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountReportTest
	instanceVariableNames: 'anAccount anotherAccount aPortfolio accountSummaryLines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountReportTest methodsFor: 'transfer net tests' stamp: 'agg 7/15/2021 18:34:20'!
test13TransferNetOfAccountWithoutAnyTransactionsMustBeZero
	
	self assertPortfolioAfterTransactions: [] andAdditionOfAccounts: (OrderedCollection new) hasAccountTransferNet: (0*peso).
! !

!AccountReportTest methodsFor: 'transfer net tests' stamp: 'agg 7/15/2021 18:37:21'!
test14TransferNetOfAccountWithOneTransferDepositLegMustBePositive

	Deposit register: 15*peso on: anotherAccount.
	Transfer amount: 10*peso from: anotherAccount to: anAccount.
	
	self assert: 10*peso equals: (TransferNet of: anAccount) obtain! !

!AccountReportTest methodsFor: 'transfer net tests' stamp: 'agg 7/15/2021 17:48:04'!
test15TransferNetOfAccountWithOneTransferWithdrawLegMustBeNegative

	Deposit register: 15*peso on: anAccount.
	Transfer amount: 10*peso from: anAccount to: anotherAccount.
	
	self assert: -10*peso equals: (TransferNet of: anAccount) obtain.! !

!AccountReportTest methodsFor: 'transfer net tests' stamp: 'agg 7/15/2021 17:38:15'!
test16TransferNetOfAccountWithManyTransferLegsMustBeOK

	Deposit register: 15*peso on: anAccount.
	Transfer amount: 10*peso from: anAccount to: anotherAccount.
	Transfer amount: 5*peso from: anotherAccount to: anAccount.
	
	self assert: -5*peso equals: (TransferNet of: anAccount) obtain! !

!AccountReportTest methodsFor: 'transfer net tests' stamp: 'agg 7/15/2021 18:38:49'!
test17TransferNetOfPortfolioWithoutAnyTransactionsMustBeZero
	
	self assertPortfolioAfterTransactions: [] andAdditionOfAccounts: (OrderedCollection with: anAccount) hasAccountTransferNet: (0*peso).
! !

!AccountReportTest methodsFor: 'transfer net tests' stamp: 'agg 7/15/2021 18:39:31'!
test18TransferNetOfPortfolioWithOneTransferDepositLegMustBePositive
	
	self assertPortfolioAfterTransactions: [
			Deposit register: 15*peso on: anotherAccount.
			Transfer amount: 10*peso from: anotherAccount to: anAccount.]
		andAdditionOfAccounts: (OrderedCollection with: anAccount)
		hasAccountTransferNet: (10*peso).
! !

!AccountReportTest methodsFor: 'transfer net tests' stamp: 'agg 7/15/2021 18:40:09'!
test19TransferNetOfPortfolioWithOneTransferWithdrawLegMustBeNegative
	
	self assertPortfolioAfterTransactions: [
			Deposit register: 15*peso on: anAccount.
			Transfer amount: 10*peso from: anAccount to: anotherAccount.]
		andAdditionOfAccounts: (OrderedCollection with: anAccount)
		hasAccountTransferNet: (-10*peso).! !

!AccountReportTest methodsFor: 'transfer net tests' stamp: 'agg 7/15/2021 18:41:03'!
test20TransferNetOfPortfolioWithManyAccountsAndManyTransferLegsMustBeOK
	
	self assertPortfolioAfterTransactions: [
			Deposit register: 15*peso on: anAccount.
			Transfer amount: 10*peso from: anAccount to: anotherAccount.
			Transfer amount: 5*peso from: anotherAccount to: anAccount.]
		andAdditionOfAccounts: (OrderedCollection with: anAccount with: anotherAccount)
		hasAccountTransferNet: (0*peso).! !


!AccountReportTest methodsFor: 'summary tests' stamp: 'agg 7/15/2021 18:32:40'!
test01SummaryOfAccountWithoutAnyTransactionsMustShowABalanceOf0Pesos

	self assertReceptiveAccountAfterTransactions: [] hasAccountSummaryLines: (OrderedCollection with: 'Balance = 0 pesos'	)
! !

!AccountReportTest methodsFor: 'summary tests' stamp: 'agg 7/15/2021 18:32:40'!
test02SummaryOfAccountWithOneDepositMustShowItAndAPositiveBalance

	self assertReceptiveAccountAfterTransactions: [Deposit register: 100*peso on: anAccount.]
		hasAccountSummaryLines: (OrderedCollection with: 'Depósito por 100 pesos' with: 'Balance = 100 pesos')
! !

!AccountReportTest methodsFor: 'summary tests' stamp: 'agg 7/15/2021 18:32:40'!
test03SummaryOfAccountWithOneWithdrawMustShowItAndANegativeBalance

	self assertReceptiveAccountAfterTransactions: [Withdraw register: 50*peso on: anAccount.]
		hasAccountSummaryLines: (OrderedCollection with: 'Extracción por 50 pesos' with: 'Balance = -50 pesos')! !

!AccountReportTest methodsFor: 'summary tests' stamp: 'agg 7/15/2021 18:32:40'!
test04SummaryOfAccountWithOneTransferWithdrawLegMustShowItAndANegativeBalance

	self assertReceptiveAccountAfterTransactions: [Transfer amount: 10*peso from: anAccount to: anotherAccount.]
		hasAccountSummaryLines: (OrderedCollection with: 'Salida por transferencia de 10 pesos' with: 'Balance = -10 pesos')! !

!AccountReportTest methodsFor: 'summary tests' stamp: 'agg 7/15/2021 18:32:40'!
test05SummaryOfAccountWithOneTransferDepositLegMustShowItAndAPositiveBalance

	self assertReceptiveAccountAfterTransactions: [Transfer amount: 10*peso from: anotherAccount to: anAccount.]
		hasAccountSummaryLines: (OrderedCollection with: 'Entrada por transferencia de 10 pesos' with: 'Balance = 10 pesos')! !

!AccountReportTest methodsFor: 'summary tests' stamp: 'agg 7/15/2021 18:32:40'!
test06SummaryOfAccountWithManyTransactionsMustShowThemAndItsRespectiveBalance

	self assertReceptiveAccountAfterTransactions: [
			Deposit register: 100*peso on: anAccount.
			Withdraw register: 50*peso on: anAccount.
			Transfer amount: 20*peso from: anAccount to: anotherAccount.
			Transfer amount: 30*peso from: anotherAccount to: anAccount.]
		hasAccountSummaryLines: (OrderedCollection
			with: 'Depósito por 100 pesos' with: 'Extracción por 50 pesos' with: 'Salida por transferencia de 20 pesos'
			with: 'Entrada por transferencia de 30 pesos' with: 'Balance = 60 pesos')! !

!AccountReportTest methodsFor: 'summary tests' stamp: 'agg 7/15/2021 18:29:55'!
test07SummaryOfPortfolioWithoutAnyTransactionsMustShowABalanceOf0Pesos
	
	self assertPortfolioAfterTransactions: [] andAdditionOfAccounts: (OrderedCollection new) hasAccountSummaryLines: (OrderedCollection with: 'Balance = 0 pesos')! !

!AccountReportTest methodsFor: 'summary tests' stamp: 'agg 7/15/2021 18:25:20'!
test08SummaryOfPortfolioWithOneDepositMustShowItAndAPositiveBalance

	self assertPortfolioAfterTransactions: [	Deposit register: 100*peso on: anAccount.]
		andAdditionOfAccounts: (OrderedCollection with: anAccount)
		hasAccountSummaryLines: (OrderedCollection with: 'Depósito por 100 pesos' with: 'Balance = 100 pesos')
	! !

!AccountReportTest methodsFor: 'summary tests' stamp: 'agg 7/15/2021 18:30:17'!
test09SummaryOfPortfolioWithOneWithdrawMustShowItAndANegativeBalance

	self assertPortfolioAfterTransactions: [Withdraw register: 50*peso on: anAccount.]
		andAdditionOfAccounts: (OrderedCollection with: anAccount)
		hasAccountSummaryLines: (OrderedCollection with: 'Extracción por 50 pesos' with: 'Balance = -50 pesos')! !

!AccountReportTest methodsFor: 'summary tests' stamp: 'agg 7/15/2021 18:30:25'!
test10SummaryOfPortfolioWithOneTransferWithdrawLegMustShowItAndANegativeBalance

	self assertPortfolioAfterTransactions: [Transfer amount: 10*peso from: anAccount to: anotherAccount.]
		andAdditionOfAccounts: (OrderedCollection with: anAccount)
		hasAccountSummaryLines: (OrderedCollection with: 'Salida por transferencia de 10 pesos' with: 'Balance = -10 pesos')! !

!AccountReportTest methodsFor: 'summary tests' stamp: 'agg 7/15/2021 18:30:33'!
test11SummaryOfPortfolioWithOneTransferDepositLegMustShowItAndAPositiveBalance

	self assertPortfolioAfterTransactions: [Transfer amount: 10*peso from: anotherAccount to: anAccount.]
		andAdditionOfAccounts:(OrderedCollection with: anAccount)
		hasAccountSummaryLines: (OrderedCollection with: 'Entrada por transferencia de 10 pesos' with: 'Balance = 10 pesos')! !

!AccountReportTest methodsFor: 'summary tests' stamp: 'agg 7/15/2021 18:29:27'!
test12SummaryOfPortfolioWithManyAccountsAndManyTransactionsMustShowThemAndItsRespectiveBalance		
	
	accountSummaryLines _ OrderedCollection with: 'Depósito por 100 pesos' with: 'Extracción por 50 pesos' with: 'Salida por transferencia de 20 pesos' with: 'Entrada por transferencia de 30 pesos' with: 'Entrada por transferencia de 20 pesos' with: 'Salida por transferencia de 30 pesos'.
	accountSummaryLines add: 'Balance = 50 pesos'.
	
	self assertPortfolioAfterTransactions: [	
			Deposit register: 100*peso on: anAccount.
			Withdraw register: 50*peso on: anAccount.
			Transfer amount: 20*peso from: anAccount to: anotherAccount.
			Transfer amount: 30*peso from: anotherAccount to: anAccount.]
		andAdditionOfAccounts: (OrderedCollection with: anAccount with: anotherAccount)
		hasAccountSummaryLines: accountSummaryLines.! !


!AccountReportTest methodsFor: 'private' stamp: 'agg 7/15/2021 18:38:16'!
assertPortfolioAfterTransactions: transactionsOnAccounts andAdditionOfAccounts: accountsToAdd hasAccountSummaryLines: summaryLines
	
	transactionsOnAccounts value.
	accountsToAdd do: [:account | aPortfolio add: account].
		
	self assert: summaryLines equals: (Summary of: aPortfolio) obtain.! !

!AccountReportTest methodsFor: 'private' stamp: 'agg 7/15/2021 18:33:42'!
assertPortfolioAfterTransactions: transactionsOnAccounts andAdditionOfAccounts: accountsToAdd hasAccountTransferNet: transferNet
	
	transactionsOnAccounts value.
	accountsToAdd do: [:account | aPortfolio add: account].
			
	self assert: transferNet equals: (TransferNet of: aPortfolio) obtain! !

!AccountReportTest methodsFor: 'private' stamp: 'agg 7/15/2021 18:32:40'!
assertReceptiveAccountAfterTransactions: transactions hasAccountSummaryLines: summaryLines
	
	transactions value.
	self assert: summaryLines equals: (Summary of: anAccount) obtain! !

!AccountReportTest methodsFor: 'private' stamp: 'agg 7/15/2021 17:44:20'!
setUp
	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	aPortfolio _ Portfolio new.! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'as yet unclassified' stamp: 'SRM 7/15/2021 17:03:14'!
initializeWithName: anAccountName

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'as yet unclassified' stamp: 'SRM 7/15/2021 17:01:21'!
named: anAccountName

	^self new initializeWithName: anAccountName! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'SRM 7/15/2021 17:00:26'!
initialize

	accounts _ OrderedCollection new.
	name _ 'Unnamed account'! !


!Portfolio methodsFor: 'main protocol' stamp: 'SRM 7/12/2021 10:25:37'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0*peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'LL 7/1/2021 03:21:12'!
add: accountToAdd
	
	accounts add: accountToAdd.
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'SRM 7/10/2021 15:41:34'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'SRM 7/15/2021 17:00:49'!
initialize

	super initialize.
	transactions _ OrderedCollection new.
	name _ 'Unnamed account'! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SRM 7/12/2021 10:25:45'!
balance

	^transactions 
		inject: 0*peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!classDefinition: #AccountReport category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountReport methodsFor: 'main protocol' stamp: 'SRM 7/14/2021 20:23:33'!
obtain

	self subclassResponsibility! !


!AccountReport methodsFor: 'initialization' stamp: 'SRM 7/14/2021 10:57:08'!
initializeFor: anAccount

	self subclassResponsibility! !


!AccountReport methodsFor: 'visiting - private' stamp: 'SRM 7/14/2021 18:35:31'!
visitADeposit: aDeposit
	
	self subclassResponsibility! !

!AccountReport methodsFor: 'visiting - private' stamp: 'SRM 7/14/2021 18:36:14'!
visitATransferDepositLeg: aTransferDepositLeg
	
	self subclassResponsibility! !

!AccountReport methodsFor: 'visiting - private' stamp: 'SRM 7/14/2021 18:36:00'!
visitATransferWithdrawLeg: aTransferWithdrawLeg
	
	self subclassResponsibility! !

!AccountReport methodsFor: 'visiting - private' stamp: 'SRM 7/14/2021 18:35:44'!
visitAWithdraw: aWithdraw
	
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReport class' category: 'ServiciosFinancieros-Solucion'!
AccountReport class
	instanceVariableNames: ''!

!AccountReport class methodsFor: 'instance creation' stamp: 'SRM 7/14/2021 10:56:32'!
of: anAccount

	^self new initializeFor: anAccount! !


!classDefinition: #Summary category: 'ServiciosFinancieros-Solucion'!
AccountReport subclass: #Summary
	instanceVariableNames: 'account summaryLines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Summary methodsFor: 'main protocol' stamp: 'SRM 7/14/2021 20:23:33'!
obtain

	"asSummaryLineFor: --> accept:"
	summaryLines _ account transactions collect: [:aTransaction | aTransaction accept: self].
	summaryLines add: 'Balance = ',account balance asString.
	^summaryLines! !


!Summary methodsFor: 'initialization' stamp: 'SRM 7/14/2021 10:37:37'!
initializeFor: anAccount

	account _ anAccount.
	summaryLines _ OrderedCollection new! !


!Summary methodsFor: 'visiting - private' stamp: 'SRM 7/14/2021 18:38:11'!
visitADeposit: aDeposit
	
	^'Depósito por ',aDeposit value asString! !

!Summary methodsFor: 'visiting - private' stamp: 'SRM 7/14/2021 18:38:20'!
visitATransferDepositLeg: aTransferDepositLeg
	
	^'Entrada por transferencia de ',aTransferDepositLeg value asString! !

!Summary methodsFor: 'visiting - private' stamp: 'SRM 7/14/2021 18:38:34'!
visitATransferWithdrawLeg: aTransferWithdrawLeg
	
	^'Salida por transferencia de ',aTransferWithdrawLeg value asString! !

!Summary methodsFor: 'visiting - private' stamp: 'SRM 7/14/2021 18:38:46'!
visitAWithdraw: aWithdraw
	
	^'Extracción por ',aWithdraw value asString! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Solucion'!
AccountReport subclass: #TransferNet
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNet methodsFor: 'initialization' stamp: 'SRM 7/14/2021 10:57:51'!
initializeFor: anAccount

	account _ anAccount! !


!TransferNet methodsFor: 'main protocol' stamp: 'SRM 7/15/2021 16:16:54'!
obtain
	
	"asValueFor: --> accept:"
	^account transactions sum: [:aTransaction | aTransaction accept: self] ifEmpty: [0*peso]! !


!TransferNet methodsFor: 'visiting - private' stamp: 'SRM 7/14/2021 18:40:04'!
visitADeposit: aDeposit

	^0! !

!TransferNet methodsFor: 'visiting - private' stamp: 'SRM 7/14/2021 18:40:33'!
visitATransferDepositLeg: aTransferDepositLeg

	^aTransferDepositLeg value! !

!TransferNet methodsFor: 'visiting - private' stamp: 'SRM 7/14/2021 18:40:44'!
visitATransferWithdrawLeg: aTransferWithdrawLeg

	^aTransferWithdrawLeg value negated! !

!TransferNet methodsFor: 'visiting - private' stamp: 'SRM 7/14/2021 18:40:16'!
visitAWithdraw: aWithdraw

	^0! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'visiting' stamp: 'SRM 7/14/2021 18:32:19'!
accept: aVisitor

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'visiting' stamp: 'SRM 7/14/2021 18:33:03'!
accept: aVisitor

	^aVisitor visitADeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !


!TransferLeg methodsFor: 'visiting' stamp: 'SRM 7/14/2021 18:41:13'!
accept: aVisitor

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'visiting' stamp: 'SRM 7/14/2021 18:33:43'!
accept: aVisitor

	^aVisitor visitATransferDepositLeg: self! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'visiting' stamp: 'SRM 7/14/2021 18:33:56'!
accept: aVisitor

	^aVisitor visitATransferWithdrawLeg: self! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'visiting' stamp: 'SRM 7/14/2021 18:33:19'!
accept: aVisitor

	^aVisitor visitAWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'SRM 7/10/2021 16:38:15'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destination cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
