!classDefinition: #AccountReportingTest category: #PortfolioTreePrinter!
TestCase subclass: #AccountReportingTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!AccountReportingTest methodsFor: 'tests' stamp: 'AMS 6/2/2019 11:16:43'!
test01TransferNetOnAnAccountWithDepositAndWithdrawIs0

	| receptiveAccount accountReporting |
	
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount.
	Withdraw register: 40 on: receptiveAccount.
	accountReporting := AccountReporting for: receptiveAccount .
	
	self assert: 0 equals: (accountReporting transferNet ).	
	! !

!AccountReportingTest methodsFor: 'tests' stamp: 'AMS 6/2/2019 11:19:31'!
test02TransferNetOnAnAccountWithTransfersIsTheSumOfTheTransferBalanceImpact

	| aReceptiveAccount anotherReceptiveAccount anAccountReporting anotherAccountReporting |
	
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	Transfer register: 100 from: aReceptiveAccount to: anotherReceptiveAccount.
	Transfer register: 40 from: anotherReceptiveAccount to: aReceptiveAccount.
	
	anAccountReporting := AccountReporting for: aReceptiveAccount .
	anotherAccountReporting := AccountReporting for: anotherReceptiveAccount.
	
	self assert: -60 equals: (anAccountReporting transferNet).
	self assert: 60 equals: (anotherAccountReporting transferNet).
	
	! !

!AccountReportingTest methodsFor: 'tests' stamp: 'AMS 6/2/2019 11:17:12'!
test03TransferNetOnAPortfolioWithTransfersIsTheSumOfTheTransferBalanceImpact

	| aReceptiveAccount anotherReceptiveAccount aReceptiveAccountOutsideOfThePortfolio simplePortfolio composedPortfolio accountReporting |
	
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	aReceptiveAccountOutsideOfThePortfolio := ReceptiveAccount new.
	Transfer register: 100 from: aReceptiveAccount to: anotherReceptiveAccount.
	Transfer register: 40 from: anotherReceptiveAccount to: aReceptiveAccount.
	Transfer register: 10 from: aReceptiveAccountOutsideOfThePortfolio to: aReceptiveAccount.
	
	simplePortfolio := Portfolio with: aReceptiveAccount.
	composedPortfolio := Portfolio with: anotherReceptiveAccount with: simplePortfolio.
	
	accountReporting := AccountReporting for: composedPortfolio .
	
	self assert: 10 equals: (accountReporting transferNet).	
	! !

!AccountReportingTest methodsFor: 'tests' stamp: 'AMS 6/2/2019 11:17:24'!
test04AccountSummaryOnEmptyAccountPrintsTheCorrectReport

	| aReceptiveAccount accountReporting |
	
	aReceptiveAccount := ReceptiveAccount new.
	accountReporting := AccountReporting for: aReceptiveAccount .
	
	self assert: 'Balance = 0' equals: (accountReporting accountSummary).	
	! !

!AccountReportingTest methodsFor: 'tests' stamp: 'AMS 6/2/2019 11:17:32'!
test05AccountSummaryOnAnAccountWithDepositPrintsTheCorrectReport

	| aReceptiveAccount accountReporting expectedReport |
	
	aReceptiveAccount := ReceptiveAccount new.
	Deposit register: 50 on: aReceptiveAccount.
	accountReporting := AccountReporting for: aReceptiveAccount .
	
	expectedReport := 'Depósito por 50.
Balance = 50'.
	
	self assert: expectedReport equals: (accountReporting accountSummary).	
	! !

!AccountReportingTest methodsFor: 'tests' stamp: 'AMS 6/2/2019 11:17:40'!
test06AccountSummaryOnAnAccountWithWithdrawPrintsTheCorrectReport

	| aReceptiveAccount accountReporting expectedReport |
	
	aReceptiveAccount := ReceptiveAccount new.
	Withdraw register: 50 on: aReceptiveAccount.
	accountReporting := AccountReporting for: aReceptiveAccount .
	
	expectedReport := 'Extracción por 50.
Balance = -50'.
	
	self assert: expectedReport equals: (accountReporting accountSummary).	
	! !

!AccountReportingTest methodsFor: 'tests' stamp: 'AMS 6/2/2019 11:17:53'!
test07AccountSummaryOnAnAccountWithDepositByTransferPrintsTheCorrectReport

	| aReceptiveAccount anotherReceptiveAccount accountReporting expectedReport |
	
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	Transfer register: 50 from: anotherReceptiveAccount to: aReceptiveAccount .
	accountReporting := AccountReporting for: aReceptiveAccount .
	
	expectedReport := 'Entrada por transferencia de 50.
Balance = 50'.
	
	self assert: expectedReport equals: (accountReporting accountSummary).	
	! !

!AccountReportingTest methodsFor: 'tests' stamp: 'AMS 6/2/2019 11:18:04'!
test08AccountSummaryOnAnAccountWithWithdrawByTransferPrintsTheCorrectReport

	| aReceptiveAccount anotherReceptiveAccount accountReporting expectedReport |
	
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	Transfer register: 50 from: aReceptiveAccount to: anotherReceptiveAccount .
	accountReporting := AccountReporting for: aReceptiveAccount .
	
	expectedReport := 'Salida por transferencia de 50.
Balance = -50'.
	
	self assert: expectedReport equals: (accountReporting accountSummary).	
	! !

!AccountReportingTest methodsFor: 'tests' stamp: 'AMS 6/2/2019 11:18:15'!
test09AccountSummaryOnAnAccountWithMoreThanOneTransactionsPrintsTheCorrectReport

	| aReceptiveAccount anotherReceptiveAccount accountReporting expectedReport |
	
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100 on: aReceptiveAccount.
	Withdraw register: 50 on: aReceptiveAccount.
	Transfer register: 20 from: aReceptiveAccount to: anotherReceptiveAccount.
	Transfer register: 30 from: anotherReceptiveAccount to: aReceptiveAccount .
	
	accountReporting := AccountReporting for: aReceptiveAccount .
	
	expectedReport := 'Depósito por 100.
Extracción por 50.
Salida por transferencia de 20.
Entrada por transferencia de 30.
Balance = 60'.
	
	self assert: expectedReport equals: (accountReporting accountSummary).	
	! !

!AccountReportingTest methodsFor: 'tests' stamp: 'AMS 6/2/2019 11:18:30'!
test10AccountSummaryOnAPortfolioWithAccountsAndPortfoliosPrintsTheCorrectReport

	| aReceptiveAccount anotherReceptiveAccount simplePortfolio composedPortfolio accountReporting expectedReport |
	
	aReceptiveAccount := ReceptiveAccount new.
	anotherReceptiveAccount := ReceptiveAccount new.
	
	Deposit register: 100 on: aReceptiveAccount.
	Withdraw register: 50 on: aReceptiveAccount.
	Transfer register: 20 from: aReceptiveAccount to: anotherReceptiveAccount.
	Transfer register: 30 from: anotherReceptiveAccount to: aReceptiveAccount .
	
	simplePortfolio := Portfolio with: aReceptiveAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: anotherReceptiveAccount.
	
	accountReporting := AccountReporting for: composedPortfolio .
	
	expectedReport := 'Depósito por 100.
Extracción por 50.
Salida por transferencia de 20.
Entrada por transferencia de 30.
Entrada por transferencia de 20.
Salida por transferencia de 30.
Balance = 50'.
	
	self assert: expectedReport equals: (accountReporting accountSummary).	
	! !


!classDefinition: #PortfolioTest category: #PortfolioTreePrinter!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:17:51'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:15'!
test08PortfolioTransasctionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: #PortfolioTreePrinter!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AMS 5/31/2019 23:03:12'!
test08DepositedAccountByTransferIncreasesBalanceOnTransactionValue

	| originReceptiveAccount destinationReceptiveAccount |
	
	originReceptiveAccount := ReceptiveAccount  new.
	destinationReceptiveAccount := ReceptiveAccount new.
	Transfer register: 100 from: originReceptiveAccount to: destinationReceptiveAccount .
		
	self assert: 100 equals: destinationReceptiveAccount balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AMS 5/31/2019 23:04:23'!
test09AccountWithdrawnByTransferDecreasesBalanceOnTransactionValue

	| originReceptiveAccount destinationReceptiveAccount |
	
	originReceptiveAccount := ReceptiveAccount  new.
	destinationReceptiveAccount := ReceptiveAccount new.
	Transfer register: 100 from: originReceptiveAccount to: destinationReceptiveAccount .
		
	self assert: -100 equals: originReceptiveAccount balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AMS 5/31/2019 23:17:34'!
test10TransferKnowsHisLegs

	| originReceptiveAccount destinationReceptiveAccount transfer |
	
	originReceptiveAccount := ReceptiveAccount  new.
	destinationReceptiveAccount := ReceptiveAccount new.
	transfer := Transfer register: 100 from: originReceptiveAccount to: destinationReceptiveAccount .
	
	self assert: transfer depositLeg equals: destinationReceptiveAccount transactions first.
	self assert: transfer withdrawLeg equals: originReceptiveAccount transactions first.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AMS 5/31/2019 23:18:32'!
test11DepositByTransferKnowsTheTransferWhoGeneratedIt

	| originReceptiveAccount destinationReceptiveAccount transfer |
	
	originReceptiveAccount := ReceptiveAccount  new.
	destinationReceptiveAccount := ReceptiveAccount new.
	transfer := Transfer register: 100 from: originReceptiveAccount to: destinationReceptiveAccount .
	
	self assert: transfer depositLeg transfer equals: transfer.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AMS 5/31/2019 23:18:44'!
test12WithdrawByTransferKnowsTheTransferWhoGeneratedIt

	| originReceptiveAccount destinationReceptiveAccount transfer |
	
	originReceptiveAccount := ReceptiveAccount  new.
	destinationReceptiveAccount := ReceptiveAccount new.
	transfer := Transfer register: 100 from: originReceptiveAccount to: destinationReceptiveAccount .
	
	self assert: transfer withdrawLeg transfer equals: transfer.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AMS 5/31/2019 23:19:40'!
test13WithdrawByTransferMustBePositive

	| originReceptiveAccount destinationReceptiveAccount transfer transferValue |
	
	originReceptiveAccount := ReceptiveAccount  new.
	destinationReceptiveAccount := ReceptiveAccount new.
	transferValue := 100.
	transfer := Transfer register: transferValue from: originReceptiveAccount to: destinationReceptiveAccount .
	
	self assert: transfer withdrawLeg value equals: transferValue.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AMS 5/31/2019 23:22:16'!
test14CanNotTransferFromAnAccountToTheSameAccount

	| receptiveAccount |
	
	receptiveAccount := ReceptiveAccount  new.
	self should: [Transfer register: 100 from: receptiveAccount to: receptiveAccount ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Transfer canNotTransferToTheSameAccountErrorMessage
	! !


!classDefinition: #Account category: #PortfolioTreePrinter!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #PortfolioTreePrinter!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #PortfolioTreePrinter!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
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


!classDefinition: #ReceptiveAccount category: #PortfolioTreePrinter!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!classDefinition: #AccountReporting category: #PortfolioTreePrinter!
Object subclass: #AccountReporting
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!AccountReporting methodsFor: 'reporting' stamp: 'AMS 6/2/2019 12:04:08'!
accountSummary
	
	| accountSummaryVisitor |
	
	accountSummaryVisitor := AccountSummaryVisitor new.
	
	^String streamContents: [:stream |
		account transactions do: [:aTransaction |
			stream nextPutAll: (aTransaction accept: accountSummaryVisitor).
			stream newLine.
		].
		stream nextPutAll: 'Balance = ', account balance printString 
	]! !

!AccountReporting methodsFor: 'reporting' stamp: 'AMS 6/2/2019 12:00:03'!
transferNet
	
	| transferNetVisitor |
	transferNetVisitor := TransferNetVisitor new.
		
	^account transactions inject: 0 into: [:currentTransferNet :aTransaction | currentTransferNet + (aTransaction accept: transferNetVisitor) ].! !


!AccountReporting methodsFor: 'initialization' stamp: 'AMS 6/2/2019 11:13:01'!
initializeFor: anAccount

	account := anAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountReporting class' category: #PortfolioTreePrinter!
AccountReporting class
	instanceVariableNames: ''!

!AccountReporting class methodsFor: 'instance creation' stamp: 'AMS 6/2/2019 11:12:17'!
for: anAccount

	^self new initializeFor: anAccount ! !


!classDefinition: #AccountTransaction category: #PortfolioTreePrinter!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'testing' stamp: 'AMS 6/2/2019 11:44:46'!
accept: aVisitor

	^self subclassResponsibility ! !


!classDefinition: #Deposit category: #PortfolioTreePrinter!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'AMS 6/1/2019 18:45:00'!
affectBalance: aBalance

	^aBalance + self value ! !


!Deposit methodsFor: 'testing' stamp: 'AMS 6/2/2019 11:45:17'!
accept: aVisitor

	^aVisitor visitDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #PortfolioTreePrinter!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'AMS 6/3/2019 00:30:48'!
register: aValue on: account

	| deposit |
	
	deposit := self for: aValue.
	account register: deposit.
		
	^ deposit! !


!classDefinition: #TransferTransaction category: #PortfolioTreePrinter!
AccountTransaction subclass: #TransferTransaction
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!TransferTransaction methodsFor: 'value' stamp: 'AMS 6/1/2019 18:46:16'!
value

	^transfer value! !


!TransferTransaction methodsFor: 'transfer' stamp: 'AMS 6/1/2019 18:47:16'!
transfer

	^transfer ! !


!TransferTransaction methodsFor: 'initialization' stamp: 'AMS 6/1/2019 18:46:53'!
initializeFor: aTransfer

	transfer := aTransfer ! !


!classDefinition: #DepositByTransfer category: #PortfolioTreePrinter!
TransferTransaction subclass: #DepositByTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!DepositByTransfer methodsFor: 'balance' stamp: 'AMS 6/1/2019 18:45:14'!
affectBalance: aBalance

	^aBalance + self value ! !


!DepositByTransfer methodsFor: 'testing' stamp: 'AMS 6/2/2019 11:45:42'!
accept: aVisitor

	^aVisitor visitDepositByTransfer: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositByTransfer class' category: #PortfolioTreePrinter!
DepositByTransfer class
	instanceVariableNames: ''!

!DepositByTransfer class methodsFor: 'instance creation' stamp: 'AMS 5/31/2019 22:50:34'!
for: aTransfer

	^self new initializeFor: aTransfer! !


!classDefinition: #WithdrawByTransfer category: #PortfolioTreePrinter!
TransferTransaction subclass: #WithdrawByTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!WithdrawByTransfer methodsFor: 'balance' stamp: 'AMS 6/1/2019 18:45:20'!
affectBalance: aBalance

	^aBalance - self value ! !


!WithdrawByTransfer methodsFor: 'testing' stamp: 'AMS 6/2/2019 11:46:03'!
accept: aVisitor

	^aVisitor visitWithdrawByTransfer: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawByTransfer class' category: #PortfolioTreePrinter!
WithdrawByTransfer class
	instanceVariableNames: 'transfer'!

!WithdrawByTransfer class methodsFor: 'instance creation' stamp: 'AMS 5/31/2019 23:08:00'!
for: aTransfer

	^self new initializeFor: aTransfer! !


!classDefinition: #Withdraw category: #PortfolioTreePrinter!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'AMS 6/1/2019 18:44:32'!
affectBalance: aBalance

	^aBalance - self value! !


!Withdraw methodsFor: 'testing' stamp: 'AMS 6/2/2019 11:46:25'!
accept: aVisitor

	^aVisitor visitWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #PortfolioTreePrinter!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'AMS 6/3/2019 00:30:53'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #AccountTransactionVisitor category: #PortfolioTreePrinter!
Object subclass: #AccountTransactionVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!AccountTransactionVisitor methodsFor: 'visiting' stamp: 'AMS 6/2/2019 11:47:24'!
visitDeposit: aDeposit

	^self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'visiting' stamp: 'AMS 6/2/2019 11:47:42'!
visitDepositByTransfer: aDepositByTransfer

	^self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'visiting' stamp: 'AMS 6/2/2019 11:47:32'!
visitWithdraw: aWithdraw

	^self subclassResponsibility ! !

!AccountTransactionVisitor methodsFor: 'visiting' stamp: 'AMS 6/2/2019 11:47:51'!
visitWithdrawByTransfer: aWithdrawByTransfer

	^self subclassResponsibility ! !


!classDefinition: #AccountSummaryVisitor category: #PortfolioTreePrinter!
AccountTransactionVisitor subclass: #AccountSummaryVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!AccountSummaryVisitor methodsFor: 'visiting' stamp: 'AMS 6/2/2019 12:01:45'!
visitDeposit: aDeposit

	^'Depósito por ', aDeposit value printString, '.'! !

!AccountSummaryVisitor methodsFor: 'visiting' stamp: 'AMS 6/2/2019 12:02:09'!
visitDepositByTransfer: aDepositByTransfer

	^'Entrada por transferencia de ', aDepositByTransfer value printString, '.'! !

!AccountSummaryVisitor methodsFor: 'visiting' stamp: 'AMS 6/2/2019 12:01:26'!
visitWithdraw: aWithdraw

	^'Extracción por ', aWithdraw value printString, '.'! !

!AccountSummaryVisitor methodsFor: 'visiting' stamp: 'AMS 6/2/2019 12:02:33'!
visitWithdrawByTransfer: aWithdrawByTransfer

	^'Salida por transferencia de ', aWithdrawByTransfer value printString, '.'! !


!classDefinition: #TransferNetVisitor category: #PortfolioTreePrinter!
AccountTransactionVisitor subclass: #TransferNetVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!TransferNetVisitor methodsFor: 'visiting' stamp: 'AMS 6/2/2019 11:50:09'!
visitDeposit: aDeposit

	^0! !

!TransferNetVisitor methodsFor: 'visiting' stamp: 'AMS 6/2/2019 11:56:52'!
visitDepositByTransfer: aDepositByTransfer

	^aDepositByTransfer value ! !

!TransferNetVisitor methodsFor: 'visiting' stamp: 'AMS 6/2/2019 11:50:17'!
visitWithdraw: aWithdraw

	^0! !

!TransferNetVisitor methodsFor: 'visiting' stamp: 'AMS 6/2/2019 11:57:09'!
visitWithdrawByTransfer: aWithdrawByTransfer

	^aWithdrawByTransfer value negated! !


!classDefinition: #Transfer category: #PortfolioTreePrinter!
Object subclass: #Transfer
	instanceVariableNames: 'value depositLeg withdrawLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter'!

!Transfer methodsFor: 'initialization' stamp: 'AMS 5/31/2019 22:48:54'!
initializeFor: anAmount

	value := anAmount.
	depositLeg := DepositByTransfer for: self.
	withdrawLeg := WithdrawByTransfer for: self.! !


!Transfer methodsFor: 'transfer legs' stamp: 'AMS 5/31/2019 22:49:57'!
depositLeg

	^depositLeg ! !

!Transfer methodsFor: 'transfer legs' stamp: 'AMS 5/31/2019 22:50:03'!
withdrawLeg

	^withdrawLeg ! !


!Transfer methodsFor: 'value' stamp: 'AMS 5/31/2019 22:57:26'!
value

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #PortfolioTreePrinter!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'AMS 5/31/2019 22:48:05'!
for: anAmount

	^self new initializeFor: anAmount! !

!Transfer class methodsFor: 'instance creation' stamp: 'AMS 5/31/2019 23:30:25'!
register: anAmount from: fromAccount to: toAccount
	
	| transfer |
	
	(fromAccount = toAccount) ifTrue: [^self error: self canNotTransferToTheSameAccountErrorMessage ].
	
	transfer := self for: anAmount.
	fromAccount register: transfer withdrawLeg.
	toAccount register: transfer depositLeg.
	^transfer! !


!Transfer class methodsFor: 'exceptions' stamp: 'AMS 5/31/2019 23:22:58'!
canNotTransferToTheSameAccountErrorMessage

	^'Can not transfer to the same account'! !
