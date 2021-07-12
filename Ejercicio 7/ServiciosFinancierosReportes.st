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


!classDefinition: #ReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 09:48:53'!
test01SummaryOfAccountWithoutTransactionsMustShowABalanceOf0Pesos

	| anAccount |

	anAccount _ ReceptiveAccount new.
	
	self assert: (OrderedCollection with: 'Balance = 0 pesos') equals: anAccount summary! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/10/2021 16:44:51'!
test02SummaryOfAccountWithOneDepositMustShowItAndAPositiveBalance

	| anAccount accountSummaryLines |

	anAccount _ ReceptiveAccount new.
	Deposit register: 100*peso on: anAccount.
	accountSummaryLines _ OrderedCollection with: 'Depósito por 100 pesos' with: 'Balance = 100 pesos'.	
	
	self assert: accountSummaryLines equals: anAccount summary! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 08:44:03'!
test03SummaryOfAccountWithOneWithdrawMustShowItAndANegativeBalance

	| anAccount accountSummaryLines |

	anAccount _ ReceptiveAccount new.
	Withdraw register: 50*peso on: anAccount.
	accountSummaryLines _ OrderedCollection with: 'Extracción por 50 pesos' with: 'Balance = -50 pesos'.	
	
	self assert: accountSummaryLines equals: anAccount summary! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 08:44:11'!
test04SummaryOfAccountWithOneTransferWithdrawLegMustShowItAndANegativeBalance

	| anAccount anotherAccount accountSummaryLines |

	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	Transfer amount: 10*peso from: anAccount to: anotherAccount.
	
	accountSummaryLines _ OrderedCollection with: 'Salida por transferencia de 10 pesos' with: 'Balance = -10 pesos'.	
	
	self assert: accountSummaryLines equals: anAccount summary! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 08:44:20'!
test05SummaryOfAccountWithOneTransferDepositLegMustShowItAndAPositiveBalance

	| anAccount anotherAccount accountSummaryLines |

	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	Transfer amount: 10*peso from: anotherAccount to: anAccount.
	
	accountSummaryLines _ OrderedCollection with: 'Entrada por transferencia de 10 pesos' with: 'Balance = 10 pesos'.	
	
	self assert: accountSummaryLines equals: anAccount summary! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 08:44:28'!
test06SummaryOfAccountWithManyTransactionsMustShowThemAndItsRespectiveBalance

	| anAccount anotherAccount accountSummaryLines |

	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	
	Deposit register: 100*peso on: anAccount.
	Withdraw register: 50*peso on: anAccount.
	Transfer amount: 20*peso from: anAccount to: anotherAccount.
	Transfer amount: 30*peso from: anotherAccount to: anAccount.
	
	accountSummaryLines _ OrderedCollection with: 'Depósito por 100 pesos' with: 'Extracción por 50 pesos' with: 'Salida por transferencia de 20 pesos' with: 'Entrada por transferencia de 30 pesos' with: 'Balance = 60 pesos'.	
	
	self assert: accountSummaryLines equals: anAccount summary! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 09:20:25'!
test07SummaryOfPortfolioWithoutTransactionsMustShowABalanceOf0Pesos

	| aPortfolio |

	aPortfolio _ Portfolio new.
	
	self assert: (OrderedCollection with: 'Balance = 0 pesos') equals: aPortfolio summary! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 09:23:56'!
test08SummaryOfPortfolioWithOneDepositMustShowItAndAPositiveBalance

	| aPortfolio anAccount accountSummaryLines |

	anAccount _ ReceptiveAccount new.
	Deposit register: 100*peso on: anAccount.
	aPortfolio _ Portfolio new.
	aPortfolio add: anAccount.
	
	accountSummaryLines _ OrderedCollection with: 'Depósito por 100 pesos' with: 'Balance = 100 pesos'.	
	
	self assert: accountSummaryLines equals: aPortfolio summary! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 09:27:29'!
test09SummaryOfPortfolioWithOneWithdrawMustShowItAndANegativeBalance

	| aPortfolio anAccount accountSummaryLines |

	anAccount _ ReceptiveAccount new.
	Withdraw register: 50*peso on: anAccount.
	aPortfolio _ Portfolio new.
	aPortfolio add: anAccount.
	accountSummaryLines _ OrderedCollection with: 'Extracción por 50 pesos' with: 'Balance = -50 pesos'.	
	
	self assert: accountSummaryLines equals: aPortfolio summary! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 09:33:09'!
test10SummaryOfPortfolioWithOneTransferWithdrawLegMustShowItAndANegativeBalance

	| aPortfolio anAccount anotherAccount accountSummaryLines |

	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	Transfer amount: 10*peso from: anAccount to: anotherAccount.
	aPortfolio _ Portfolio new.
	aPortfolio add: anAccount.
	
	accountSummaryLines _ OrderedCollection with: 'Salida por transferencia de 10 pesos' with: 'Balance = -10 pesos'.	
	
	self assert: accountSummaryLines equals: aPortfolio summary! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 09:35:59'!
test11SummaryOfPortfolioWithOneTransferDepositLegMustShowItAndAPositiveBalance

	| aPortfolio anAccount anotherAccount accountSummaryLines |

	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	Transfer amount: 10*peso from: anotherAccount to: anAccount.
	aPortfolio _ Portfolio new.
	aPortfolio add: anAccount.
	
	accountSummaryLines _ OrderedCollection with: 'Entrada por transferencia de 10 pesos' with: 'Balance = 10 pesos'.	
	
	self assert: accountSummaryLines equals: aPortfolio summary! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 09:45:51'!
test12SummaryOfPortfolioWithManyAccountsAndManyTransactionsMustShowThemAndItsRespectiveBalance

	| aPortfolio anAccount anotherAccount accountSummaryLines |

	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	
	Deposit register: 100*peso on: anAccount.
	Withdraw register: 50*peso on: anAccount.
	Transfer amount: 20*peso from: anAccount to: anotherAccount.
	Transfer amount: 30*peso from: anotherAccount to: anAccount.
	
	aPortfolio _ Portfolio new.
	aPortfolio add: anAccount.
	aPortfolio add: anotherAccount.
	
	accountSummaryLines _ OrderedCollection with: 'Depósito por 100 pesos' with: 'Extracción por 50 pesos' with: 'Salida por transferencia de 20 pesos' with: 'Entrada por transferencia de 30 pesos' with: 'Entrada por transferencia de 20 pesos' with: 'Salida por transferencia de 30 pesos'.
	accountSummaryLines add: 'Balance = 50 pesos'.	
	
	self assert: accountSummaryLines equals: aPortfolio summary! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 10:07:34'!
test13TransferNetOfAccountWithoutTransactionsMustBeZero

	| anAccount |
	
	anAccount _ ReceptiveAccount new.
	
	self assert: 0*peso equals: anAccount transferNet! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 10:08:14'!
test14TransferNetOfAccountWithOneTransferDepositLegMustBePositive

	| anAccount anotherAccount |
	
	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	Deposit register: 15*peso on: anotherAccount.
	Transfer amount: 10*peso from: anotherAccount to: anAccount.
	
	self assert: 10*peso equals: anAccount transferNet! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 10:08:54'!
test15TransferNetOfAccountWithOneTransferWithdrawLegMustBeNegative

	| anAccount anotherAccount |
	
	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	Deposit register: 15*peso on: anAccount.
	Transfer amount: 10*peso from: anAccount to: anotherAccount.
	
	self assert: -10*peso equals: anAccount transferNet! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 10:13:58'!
test16TransferNetOfAccountWithManyTransferLegsMustBeOK

	| anAccount anotherAccount |
	
	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	Deposit register: 15*peso on: anAccount.
	Transfer amount: 10*peso from: anAccount to: anotherAccount.
	Transfer amount: 5*peso from: anotherAccount to: anAccount.
	
	self assert: -5*peso equals: anAccount transferNet! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 10:15:05'!
test17TransferNetOfPortfolioWithoutTransactionsMustBeZero

	| anAccount aPortfolio |
	
	anAccount _ ReceptiveAccount new.
	aPortfolio _ Portfolio new.
	aPortfolio add: anAccount.
	
	self assert: 0*peso equals: aPortfolio transferNet! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 10:16:47'!
test18TransferNetOfPortfolioWithOneTransferDepositLegMustBePositive

	| aPortfolio anAccount anotherAccount |
	
	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	Deposit register: 15*peso on: anotherAccount.
	Transfer amount: 10*peso from: anotherAccount to: anAccount.
	aPortfolio _ Portfolio new.
	aPortfolio add: anAccount.
	
	self assert: 10*peso equals: aPortfolio transferNet! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 10:19:03'!
test19TransferNetOfPortfolioWithOneTransferWithdrawLegMustBeNegative

	| aPortfolio anAccount anotherAccount |
	
	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	Deposit register: 15*peso on: anAccount.
	Transfer amount: 10*peso from: anAccount to: anotherAccount.
	aPortfolio _ Portfolio new.
	aPortfolio add: anAccount.
	
	self assert: -10*peso equals: aPortfolio transferNet! !

!ReportTest methodsFor: 'tests' stamp: 'SRM 7/12/2021 10:22:17'!
test20TransferNetOfPortfolioWithManyAccountsAndManyTransferLegsMustBeOK

	| aPortfolio anAccount anotherAccount |
	
	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	Deposit register: 15*peso on: anAccount.
	Transfer amount: 10*peso from: anAccount to: anotherAccount.
	Transfer amount: 5*peso from: anotherAccount to: anAccount.
	aPortfolio _ Portfolio new.
	aPortfolio add: anAccount.
	aPortfolio add: anotherAccount.
	
	self assert: 0*peso equals: aPortfolio transferNet! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
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

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
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

!Account methodsFor: 'main protocol' stamp: 'SRM 7/12/2021 11:17:25'!
summary
	
	| summaryLines |
	summaryLines _ OrderedCollection new.
	
	self transactions do: [:aTransaction | summaryLines add: aTransaction asSummaryLine].
	summaryLines add: 'Balance = ',self balance asString.
	^summaryLines! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'SRM 7/12/2021 11:23:39'!
transferNet

	^self transactions inject: 0*peso into: [:currentTransferNet :aTransaction | aTransaction affectTransferNet: currentTransferNet]! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'LL 7/1/2021 03:21:03'!
initialize

	accounts := OrderedCollection new.! !


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

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'SRM 7/10/2021 15:41:34'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


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


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'SRM 7/12/2021 11:24:08'!
affectTransferNet: aTransferNet

	self subclassResponsibility 

	! !

!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'SRM 7/12/2021 10:37:35'!
asSummaryLine

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


!Deposit methodsFor: 'as yet unclassified' stamp: 'SRM 7/12/2021 11:24:15'!
affectTransferNet: aTransferNet

	^aTransferNet! !

!Deposit methodsFor: 'as yet unclassified' stamp: 'SRM 7/12/2021 10:37:35'!
asSummaryLine

	^'Depósito por ',value asString! !

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


!TransferLeg methodsFor: 'as yet unclassified' stamp: 'SRM 7/12/2021 11:24:21'!
affectTransferNet: aTransferNet

	self subclassResponsibility! !

!TransferLeg methodsFor: 'as yet unclassified' stamp: 'SRM 7/12/2021 10:37:35'!
asSummaryLine

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
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


!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'SRM 7/12/2021 11:24:33'!
affectTransferNet: aTransferNet

	^aTransferNet + self value! !

!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'SRM 7/12/2021 10:37:35'!
asSummaryLine

	^'Entrada por transferencia de ',self value asString! !


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


!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'SRM 7/12/2021 11:24:38'!
affectTransferNet: aTransferNet

	^aTransferNet - self value! !

!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'SRM 7/12/2021 10:37:35'!
asSummaryLine

	^'Salida por transferencia de ',self value asString! !


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


!Withdraw methodsFor: 'as yet unclassified' stamp: 'SRM 7/12/2021 11:24:26'!
affectTransferNet: aTransferNet

	^aTransferNet! !

!Withdraw methodsFor: 'as yet unclassified' stamp: 'SRM 7/12/2021 10:37:35'!
asSummaryLine

	^'Extracción por ',value asString! !

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
