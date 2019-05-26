!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'aReceptiveAccountWithDepositOf100 aDepositOf100 aPortfolioWithAnAccountWithDepositOf100 aReceptiveAccountWithDepositOf200 aDepositOf200 aPortfolioWithAnAccountWithDepositOf200 aReceptiveAccountWithWithdrawOf50 aWithdrawOf50 aPortfolioWithDepositAndWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 10:46:39'!
test01EmptyPortfolioHasZeroAsBalanceAndEmptyTransactionsWhenCreated
	
	| aPortfolio |
	aPortfolio := Portfolio new.
	
	self assertThat: aPortfolio hasAsBalance: 0 withTheseTransactions: OrderedCollection new! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 10:50:20'!
test02PortfolioWithAReceptiveAccountWithDepositIncreaseBalance
	
	| aPortfolio |
	aPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100.
	
	self assertThat: aPortfolio hasAsBalance: 100  withTheseTransactions: (OrderedCollection with: aDepositOf100)! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 10:52:22'!
test03PortfolioWithTwoAccountsSumsEachAccountBalanceAsPortfolioBalance
	
	| aPortfolio |
	
	aPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100 with: aReceptiveAccountWithDepositOf200 .
	
	self assertThat: aPortfolio hasAsBalance: 300 withTheseTransactions: (OrderedCollection with: aDepositOf100 with: aDepositOf200 )! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 10:53:06'!
test04PortfolioWithAccountsHasRegisteredADepositOnOneOfHisAccounts
	
	| aPortfolio |
	
	aPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100 with: aReceptiveAccountWithDepositOf200 .
	
	self assert: (aPortfolio hasRegistered: aDepositOf100 )! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 10:53:44'!
test05PortfolioWithAccountsHasNotRegisteredADepositOnOneAccountThatNotBelongsToIt
	
	| aPortfolio anUnregisteredDeposit |
	
	anUnregisteredDeposit := Deposit for: 100.
	aPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100 with: aReceptiveAccountWithDepositOf200 .
	
	self deny: (aPortfolio hasRegistered: anUnregisteredDeposit )! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 10:55:11'!
test06PortfolioCanAddAnAccountAndIncreaseHisBalanceValue
	
	| aPortfolio |
		
	aPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100 .
	aPortfolio add: aReceptiveAccountWithDepositOf200 .
	
	self assertThat: aPortfolio hasAsBalance: 300 withTheseTransactions: (OrderedCollection with: aDepositOf100 with: aDepositOf200 )! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:01:44'!
test07PortfolioWithPortfoliosSumsEachPortfolioBalanceAndAddsEachTransaction
	
	| aPortfolio |
	
	aPortfolio := Portfolio with: aPortfolioWithAnAccountWithDepositOf200 with: aPortfolioWithDepositAndWithdraw .
		
	self assertThat: aPortfolio hasAsBalance: 250 withTheseTransactions: (OrderedCollection with: aDepositOf200 with: aDepositOf100 with: aWithdrawOf50 )! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:06:09'!
test08PortfolioHasOnePortfolioThatHasAnotherPortfolioAndIncreasesHisBalanceAndTransactions
	
	| aPortfolioThatManagesAnotherPortfolio aPortfolio   |
	
	aPortfolioThatManagesAnotherPortfolio := Portfolio with: aPortfolioWithDepositAndWithdraw.
	aPortfolio := Portfolio with: aPortfolioThatManagesAnotherPortfolio .
		
	self assertThat: aPortfolio hasAsBalance: 50 withTheseTransactions: (OrderedCollection with: aDepositOf100 with: aWithdrawOf50 ).! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:41:23'!
test09AnAccountCanBeAddedToAPortfolio
	
	| aPortfolio |
	
	aPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100 with: aReceptiveAccountWithDepositOf200 .
	
	aPortfolio add: aReceptiveAccountWithWithdrawOf50 .
	
	self assertThat: aPortfolio hasAsBalance: 250 withTheseTransactions: (OrderedCollection with: aDepositOf100 with: aDepositOf200 with: aWithdrawOf50 )  		andHasRegistered: aWithdrawOf50.! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:41:45'!
test10APortfolioCanBeAddedToAPortfolio
	
	|  aPortoflioToBeAdded aPortfolio |
	
	aPortoflioToBeAdded := Portfolio with: aReceptiveAccountWithWithdrawOf50.
	aPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100 with: aReceptiveAccountWithDepositOf200 .
	
	aPortfolio add: aPortoflioToBeAdded .
	
	self assertThat: aPortfolio hasAsBalance: 250  withTheseTransactions: (OrderedCollection with: aDepositOf100 with: aDepositOf200 with: aWithdrawOf50 )  		andHasRegistered: aWithdrawOf50.! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:42:12'!
test11AddAnAccountToAPortfolioAffectsParentPortfolioToo
	
	| aPortoflioToBeAdded aPortfolio |
	
	aPortoflioToBeAdded := Portfolio new.
	aPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100 with: aReceptiveAccountWithDepositOf200 .
	
	aPortfolio add: aPortoflioToBeAdded .
	aPortoflioToBeAdded add: aReceptiveAccountWithWithdrawOf50 .
	
	self assertThat: aPortoflioToBeAdded hasAsBalance: -50 withTheseTransactions: (OrderedCollection with: aWithdrawOf50) andHasRegistered: aWithdrawOf50.
	self assertThat: aPortfolio hasAsBalance: 250 withTheseTransactions: (OrderedCollection with: aDepositOf100 with: aDepositOf200 with: aWithdrawOf50 )  		andHasRegistered: aWithdrawOf50.! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:23:21'!
test12PortfolioCantBeCreatedWithTwiceEqualsAccounts
	
	self should: [Portfolio with: aReceptiveAccountWithDepositOf100 with: aReceptiveAccountWithDepositOf100 ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Portfolio duplicatedAccountErrorMessage! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:23:04'!
test13PortfolioCantBeCreatedWithAnAccountAndAPortfolioWhoAlreadyHasThatAccount
		
	self should: [Portfolio with: aReceptiveAccountWithDepositOf100 with: aPortfolioWithAnAccountWithDepositOf100 .] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Portfolio duplicatedAccountErrorMessage! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:25:12'!
test14PortfolioCantBeCreatedWithTwiceEqualsPortfolios
	
	| aPortfolio |
	
	aPortfolio := Portfolio new.
	
	self should: [Portfolio with: aPortfolio with: aPortfolio .] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Portfolio duplicatedAccountErrorMessage! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:25:51'!
test15PortfolioCantBeCreatedWithTwoPortfoliosThatHandleTheSameAccount
	
	| aPortfolio |
	
	aPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100.
	
	self should: [Portfolio with: aPortfolioWithAnAccountWithDepositOf100 with: aPortfolio .] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Portfolio duplicatedAccountErrorMessage! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:27:44'!
test16PortfolioCantBeCreatedWithAPortfolioThatHandleAnAccountAndAPortfolioAndAPortfolioThatHandleAPortfolioThatHandleTheSameAccount
	
	| aManagerPortfolio aPortfolio anotherManagerPortfolio |
	
	aPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100 .
	
	aManagerPortfolio := Portfolio with: aPortfolioWithAnAccountWithDepositOf100 with: aReceptiveAccountWithDepositOf200 .
	anotherManagerPortfolio := Portfolio with: aPortfolio .
	
	self should: [Portfolio with: aManagerPortfolio with: anotherManagerPortfolio .] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Portfolio duplicatedAccountErrorMessage
! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:29:12'!
test17CantAddAnAccountToAPortfolioThatAlreadyHasThatAccount

	| aPortfolio |
	
	aPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100 with: aReceptiveAccountWithDepositOf200 .
	
	self should: [aPortfolio add: aReceptiveAccountWithDepositOf100 ]  
		raise:  Error - MessageNotUnderstood 
		withMessageText: Portfolio duplicatedAccountErrorMessage .
	
	
	self assertThat: aPortfolio hasAsBalance: 300 withTheseTransactions: (OrderedCollection with: aDepositOf100 with: aDepositOf200).! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:30:15'!
test18CantAddAPortfolioWithAnAccountToAPortfolioThatAlreadyHasThatAccout
	
	| aPortfolio anotherPortfolio |
	
	aPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100 with: aReceptiveAccountWithDepositOf200 .
	anotherPortfolio := Portfolio with: aReceptiveAccountWithDepositOf200 .
	
	self should: [aPortfolio add: anotherPortfolio ]  
		raise:  Error - MessageNotUnderstood 
		withMessageText: Portfolio duplicatedAccountErrorMessage .
	
	
	self assertThat: aPortfolio hasAsBalance: 300 withTheseTransactions: (OrderedCollection with: aDepositOf100 with: aDepositOf200 ).! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:33:00'!
test19CantAddAPortfolioIfOneOfHisPortfoliosManagesTheSameAccountOfAnyOfThePortfoliosOfTheOtherPortfolio
	
	| aManagerPortfolio anotherManagerPortfolio anotherManagedPortfolio aPortfolio |
	
	aManagerPortfolio := Portfolio with: aPortfolioWithAnAccountWithDepositOf100 with: aReceptiveAccountWithDepositOf200 .
	
	anotherManagedPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100 .	
	anotherManagerPortfolio := Portfolio with: anotherManagedPortfolio.
	
	aPortfolio := Portfolio with: aManagerPortfolio.
	
	self should: [ aPortfolio add: anotherManagerPortfolio ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Portfolio duplicatedAccountErrorMessage.
		
	self assertThat: aPortfolio hasAsBalance: 300 withTheseTransactions: (OrderedCollection with: aDepositOf100 with: aDepositOf200 ).! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:33:51'!
test20CantAddTheSamePortfolio
	
	| aPortfolio |
	
	aPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100 with: aReceptiveAccountWithDepositOf200 .
		
	self should: [aPortfolio add: aPortfolio ]  
		raise:  Error - MessageNotUnderstood 
		withMessageText: Portfolio duplicatedAccountErrorMessage .
	
	
	self assertThat: aPortfolio hasAsBalance: 300 withTheseTransactions: (OrderedCollection with: aDepositOf100 with: aDepositOf200 ).! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/25/2019 20:36:51'!
test21CantAddTheSamePortfolioEvenIfItDoesntHasAccounts
	
	| aPortfolio anotherPortfolio |
	
	aPortfolio := Portfolio new.
	anotherPortfolio := Portfolio with: aPortfolio.
		
	self should: [anotherPortfolio add: aPortfolio ]  
		raise:  Error - MessageNotUnderstood 
		withMessageText: Portfolio duplicatedAccountErrorMessage! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/25/2019 20:37:27'!
test22IfTheParentOfThePortfolioHasAPortfolioThenCantAddThatPortfolio
	
	| aParentPortfolio aChildPortfolio anotherChildPortfolio |
	
	aChildPortfolio := Portfolio new.
	anotherChildPortfolio := Portfolio new.
		
	aParentPortfolio := Portfolio with: aChildPortfolio with: anotherChildPortfolio.
	
	self should: [aChildPortfolio add: anotherChildPortfolio ]  
		raise:  Error - MessageNotUnderstood 
		withMessageText: Portfolio duplicatedAccountErrorMessage! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:36:08'!
test23CantAddAnAccountIfThePortfolioBelongsToAPortfolioThatManagesThatAccount
	
	| aParentPortfolio aChildPortfolio |
	
	aChildPortfolio := Portfolio new .
	aParentPortfolio := Portfolio with: aChildPortfolio with: aReceptiveAccountWithDepositOf100 .
	
	self should: [aChildPortfolio add: aReceptiveAccountWithDepositOf100 ]  
		raise:  Error - MessageNotUnderstood 
		withMessageText: Portfolio duplicatedAccountErrorMessage.
		
	self assertThat: aParentPortfolio hasAsBalance: 100 withTheseTransactions: (OrderedCollection with: aDepositOf100 ).
	self assertThat: aChildPortfolio hasAsBalance: 0 withTheseTransactions: OrderedCollection new.! !

!PortfolioTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 11:39:28'!
test24CantAddAPortfolioThatManagesAnAccountIfThePortfolioManagesAPortfolioThatManagesThatAccount
	
	| aParentPortfolio aChildPortfolio anotherChildPortfolio |
	
	aChildPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100 .
	anotherChildPortfolio := Portfolio with: aReceptiveAccountWithDepositOf100 .

	aParentPortfolio := Portfolio with: aChildPortfolio .
	
	self should: [aParentPortfolio add: anotherChildPortfolio ]  
		raise:  Error - MessageNotUnderstood 
		withMessageText: Portfolio duplicatedAccountErrorMessage.
		
	self assertThat: aParentPortfolio hasAsBalance: 100 withTheseTransactions: (OrderedCollection with: aDepositOf100 ).
	self assertThat: aChildPortfolio hasAsBalance: 100 withTheseTransactions: (OrderedCollection with: aDepositOf100 ).
	self assertThat: anotherChildPortfolio hasAsBalance: 100 withTheseTransactions: (OrderedCollection with: aDepositOf100).
! !


!PortfolioTest methodsFor: 'setup' stamp: 'AMS 5/26/2019 11:04:23'!
setUp

	aReceptiveAccountWithDepositOf100  := ReceptiveAccount new.
	aDepositOf100 := Deposit register: 100 on: aReceptiveAccountWithDepositOf100.
	aPortfolioWithAnAccountWithDepositOf100 := Portfolio with: aReceptiveAccountWithDepositOf100.
	
	aReceptiveAccountWithDepositOf200 := ReceptiveAccount new.
	aDepositOf200 := Deposit register: 200 on: aReceptiveAccountWithDepositOf200.
	aPortfolioWithAnAccountWithDepositOf200 := Portfolio with: aReceptiveAccountWithDepositOf200.
	
	aReceptiveAccountWithWithdrawOf50 := ReceptiveAccount new.
	aWithdrawOf50 := Withdraw register: 50 on: aReceptiveAccountWithWithdrawOf50.
	aPortfolioWithDepositAndWithdraw := Portfolio with: aReceptiveAccountWithDepositOf100 with: aReceptiveAccountWithWithdrawOf50.! !


!PortfolioTest methodsFor: 'asserting' stamp: 'AMS 5/26/2019 10:45:22'!
assertThat: aPortfolio hasAsBalance: expectedBalanceValue withTheseTransactions: expectedTransactions

	self assert: expectedBalanceValue equals: aPortfolio balance.
	self assert: expectedTransactions equals: aPortfolio transactions.! !

!PortfolioTest methodsFor: 'asserting' stamp: 'AMS 5/26/2019 11:40:48'!
assertThat: aPortfolio hasAsBalance: expectedBalanceValue withTheseTransactions: expectedTransactions andHasRegistered: aTransaction

	self assertThat: aPortfolio hasAsBalance: expectedBalanceValue withTheseTransactions: expectedTransactions.
	self assert: (aPortfolio hasRegistered: aTransaction).! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

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


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'AMS 5/23/2019 21:03:44'!
affectBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'AMS 5/23/2019 21:04:10'!
affectBalance: aBalance

	^aBalance + value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'AMS 5/23/2019 20:22:01'!
value

	^value! !


!Withdraw methodsFor: 'balance' stamp: 'AMS 5/23/2019 21:04:27'!
affectBalance: aBalance

	^aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #FinancialService category: #'Portfolio-Ejercicio'!
Object subclass: #FinancialService
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!FinancialService methodsFor: 'testing' stamp: 'AMS 5/24/2019 00:26:26'!
hasRegistered

	self subclassResponsibility ! !


!FinancialService methodsFor: 'balance' stamp: 'AMS 5/24/2019 00:26:08'!
balance

	self subclassResponsibility ! !


!FinancialService methodsFor: 'transactions' stamp: 'AMS 5/24/2019 00:26:44'!
transactions

	self subclassResponsibility ! !


!FinancialService methodsFor: 'exceptions' stamp: 'AMS 5/24/2019 18:36:05'!
raiseIDuplicatedAccountErrorMessage

	^self class duplicatedAccountErrorMessage ! !


!FinancialService methodsFor: 'private' stamp: 'AMS 5/25/2019 19:41:23'!
belongsTo: aFinancialService

	self subclassResponsibility ! !

!FinancialService methodsFor: 'private' stamp: 'AMS 5/25/2019 19:12:34'!
managedFinancialServices

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FinancialService class' category: #'Portfolio-Ejercicio'!
FinancialService class
	instanceVariableNames: ''!

!FinancialService class methodsFor: 'exceptions' stamp: 'AMS 5/24/2019 18:35:33'!
duplicatedAccountErrorMessage

	^'duplicated account'! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
FinancialService subclass: #Portfolio
	instanceVariableNames: 'financialServices belongsTo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'AMS 5/23/2019 23:49:06'!
balance

	^financialServices sum: [:financialService | financialService balance] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'initializing' stamp: 'AMS 5/25/2019 19:37:17'!
initialize

	financialServices := OrderedCollection new.
	belongsTo := OrderedCollection new.! !

!Portfolio methodsFor: 'initializing' stamp: 'AMS 5/25/2019 19:55:02'!
initializeWith: theFinancialServices
	
	theFinancialServices do: [:aFinancialService | aFinancialService belongsTo: self].
	
	financialServices := theFinancialServices.
	belongsTo := OrderedCollection new.! !


!Portfolio methodsFor: 'testing' stamp: 'AMS 5/23/2019 23:48:37'!
hasRegistered: aTransaction 
	
	^financialServices anySatisfy: [:financialService | financialService hasRegistered: aTransaction ]! !


!Portfolio methodsFor: 'transactions' stamp: 'AMS 5/23/2019 23:48:51'!
transactions

	| transactions |
	
	transactions := OrderedCollection new.
		
	financialServices do: [:financialService | transactions addAll: financialService transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'adding' stamp: 'AMS 5/26/2019 11:44:11'!
add: aFinancialService 
	
	self checkIfCanBeAdded: aFinancialService.
	
	aFinancialService belongsTo: self.
	financialServices add: aFinancialService ! !

!Portfolio methodsFor: 'adding' stamp: 'AMS 5/25/2019 19:41:11'!
belongsTo: aFinancialService

	belongsTo add: aFinancialService ! !


!Portfolio methodsFor: 'private - checking' stamp: 'AMS 5/26/2019 11:46:48'!
checkIfCanBeAdded: aFinancialService

	| currentManagedAccounts |
	
	currentManagedAccounts := self class managedFinancialServicesOf: financialServices .
	belongsTo do: [:aFinancialServiceWhoBelongs | currentManagedAccounts addAll: (aFinancialServiceWhoBelongs managedFinancialServices)].
	
	aFinancialService managedFinancialServices do: [:anAccount | currentManagedAccounts add: anAccount ].
	
	((aFinancialService = self) or: [self class hasDuplicated: currentManagedAccounts]) ifTrue: [^ self error: Portfolio duplicatedAccountErrorMessage ].! !


!Portfolio methodsFor: 'private' stamp: 'AMS 5/25/2019 19:46:10'!
managedFinancialServices

	| setOfFinancialServices |
	
	setOfFinancialServices := Set new.
	
	financialServices do: [:aFinancialService | setOfFinancialServices addAll: aFinancialService managedFinancialServices ].
		 
	setOfFinancialServices add: self.
	^setOfFinancialServices ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'AMS 5/25/2019 16:15:16'!
with: aFinancialService

	^self withAll: (OrderedCollection with: aFinancialService)! !

!Portfolio class methodsFor: 'instance creation' stamp: 'AMS 5/25/2019 16:15:32'!
with: aFinancialService with: anotherFinancialService

	^self withAll: (OrderedCollection with: aFinancialService with: anotherFinancialService )! !

!Portfolio class methodsFor: 'instance creation' stamp: 'AMS 5/25/2019 19:13:40'!
withAll: financialServices 
	
	
	| managedAccounts |
	managedAccounts := self managedFinancialServicesOf: financialServices.
	(self hasDuplicated: managedAccounts) ifTrue: [^ self error: Portfolio duplicatedAccountErrorMessage ] .
	
	^self new initializeWith: financialServices ! !


!Portfolio class methodsFor: 'private' stamp: 'AMS 5/25/2019 18:49:39'!
hasDuplicated: managedAccounts

	^(managedAccounts allSatisfy: [:anAccount | (managedAccounts occurrencesOf: anAccount) = 1 ]) not.! !

!Portfolio class methodsFor: 'private' stamp: 'AMS 5/25/2019 19:53:44'!
managedFinancialServicesOf: financialServices

	| managedFinancialServices |
		
	managedFinancialServices := Bag new.
	financialServices do: [:aFinancialService | managedFinancialServices addAll: aFinancialService managedFinancialServices ].
	
	^managedFinancialServices ! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
FinancialService subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'AMS 5/23/2019 21:03:24'!
balance

	^transactions inject: 0 into: [:currentBalance :aTransaction | aTransaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !


!ReceptiveAccount methodsFor: 'private' stamp: 'AMS 5/25/2019 19:41:18'!
belongsTo: aFinancialService

	! !

!ReceptiveAccount methodsFor: 'private' stamp: 'AMS 5/25/2019 19:12:34'!
managedFinancialServices

	^Set with: self.! !
