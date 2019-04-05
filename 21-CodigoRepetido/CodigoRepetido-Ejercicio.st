!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'utilities' stamp: 'AMS 4/4/2019 20:28:11'!
assertThatCustomerBook: aCustomerBook cantSuspendACustomerNamed: aNameOfCustomerThatCannotBeSuspend andMustIncludeACustomerNamed: aNameOfCustomerThatMustBeIncluded

	self checkIf: [aCustomerBook suspendCustomerNamed: aNameOfCustomerThatCannotBeSuspend.]  failsWithError: CantSuspend 
	thenAssert: 
	[ :anError | 
			self assert: aCustomerBook numberOfCustomers = 1.
			self assert: (aCustomerBook includesCustomerNamed: aNameOfCustomerThatMustBeIncluded ) ]! !

!CustomerBookTest methodsFor: 'utilities' stamp: 'AMS 4/4/2019 20:26:35'!
assertThatCustomerBook: aCustomerBook hasNumberOfSuspendedCustomers: anExpectedNumberOfSuspendedCustomers hasNumberOfCustomers: anExpectedNumberOfCustomers 

	self assert: 0 equals: aCustomerBook numberOfActiveCustomers.
	self assert: anExpectedNumberOfSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: anExpectedNumberOfCustomers equals: aCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'utilities' stamp: 'AMS 4/4/2019 21:24:14'!
assertTimeOfExecutionOf: aBlockToMeasure isLessThanMilliseconds: aLimitTimeUnit
	
	| elapsedTimeInMilliseconds |
	
	elapsedTimeInMilliseconds := Time millisecondsToRun: aBlockToMeasure value.
	
	self assert:  elapsedTimeInMilliseconds < (aLimitTimeUnit*millisecond)! !

!CustomerBookTest methodsFor: 'utilities' stamp: 'AMS 4/4/2019 19:48:15'!
checkIf: aClosureExpectedToFail  failsWithError: anErrorExpected thenAssert: assertionsOnError

	[aClosureExpectedToFail value.
	self fail ]
		on: anErrorExpected 
		do: assertionsOnError! !

!CustomerBookTest methodsFor: 'utilities' stamp: 'AMS 4/4/2019 19:38:04'!
createCustomerBookWithOneCustomer: aCustomerToBeInTheBook
	
	| customerBook |

	customerBook := CustomerBook new.	
	customerBook addCustomerNamed: aCustomerToBeInTheBook.
	
	^customerBook! !

!CustomerBookTest methodsFor: 'utilities' stamp: 'AMS 4/4/2019 19:59:21'!
createCustomerBookWithOneCustomerSuspended: aCustomerToBeSuspendedInTheBook
	
	| customerBook |

	customerBook := self createCustomerBookWithOneCustomer: aCustomerToBeSuspendedInTheBook.
	customerBook suspendCustomerNamed: aCustomerToBeSuspendedInTheBook.
	
	^customerBook! !


!CustomerBookTest methodsFor: 'testing' stamp: 'AMS 4/4/2019 19:36:36'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assertTimeOfExecutionOf: [customerBook addCustomerNamed: 'John Lennon'.] isLessThanMilliseconds: 50.
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AMS 4/4/2019 19:40:37'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWithOneCustomer: paulMcCartney.
		 	
	self assertTimeOfExecutionOf: [customerBook removeCustomerNamed: paulMcCartney.] isLessThanMilliseconds: 100
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AMS 4/4/2019 19:49:24'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self checkIf: [ customerBook addCustomerNamed: ''.] failsWithError: Error 
	thenAssert: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AMS 4/4/2019 19:54:16'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWithOneCustomer: johnLennon.
	
	self checkIf: [ customerBook removeCustomerNamed: 'Paul McCartney'.] failsWithError: NotFound thenAssert: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AMS 4/4/2019 20:13:00'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWithOneCustomerSuspended: paulMcCartney.
	
	self assertThatCustomerBook: customerBook hasNumberOfSuspendedCustomers: 1 hasNumberOfCustomers: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AMS 4/4/2019 20:12:54'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWithOneCustomerSuspended: paulMcCartney.
	
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertThatCustomerBook: customerBook hasNumberOfSuspendedCustomers: 0 hasNumberOfCustomers: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AMS 4/4/2019 20:29:06'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWithOneCustomer: johnLennon.
	
	self assertThatCustomerBook: customerBook cantSuspendACustomerNamed: 'Paul McCartney' andMustIncludeACustomerNamed: johnLennon.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AMS 4/4/2019 20:24:30'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWithOneCustomerSuspended: johnLennon.
	
	self assertThatCustomerBook: customerBook cantSuspendACustomerNamed: johnLennon andMustIncludeACustomerNamed: johnLennon.
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'AMS 4/4/2019 21:33:10'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'AMS 4/4/2019 21:17:26'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'AMS 4/4/2019 21:13:21'!
removeCustomerNamed: aName 
 
	active remove: aName ifAbsent: [suspended remove: aName ifAbsent: [^NotFound signal]].! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/3/2019 10:16:22'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/3/2019 10:16:31'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
