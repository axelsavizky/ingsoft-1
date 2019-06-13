!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 17:12:34'!
test01WhenCreateAnEmptyCartItIsEmpty

	| aCart aCatalog |
	
	aCatalog := Dictionary new.
	aCart := Cart withAProductsCatalog: aCatalog.
	
	self assert:aCart isEmpty.
	self assert:aCart productsQuantity equals: 0.! !

!CartTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 17:12:34'!
test02AddAValidProductToAnEmptyCartAndThenTheCartIsNotEmpty

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct->1.
	aCart := Cart withAProductsCatalog: aCatalog.

	aCart add: aProduct.
	
	self deny: aCart isEmpty.
	self assert: aCart productsQuantity equals: 1.
	self assert: (aCart hasProduct: aProduct).! !

!CartTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 17:12:34'!
test03AddAValidProductToACartAndThenTheProductIsInTheCart

	| aCart aProduct anotherProduct aCatalog|
	
	aProduct := 'Product 1'.
	anotherProduct := 'Product 2'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct->5; add: anotherProduct->10.

	aCart := Cart withAProductsCatalog: aCatalog.

	aCart add: aProduct.
	aCart add: anotherProduct.
	
	self deny: aCart isEmpty.
	self assert: aCart productsQuantity equals: 2.
	self assert: (aCart hasProduct: aProduct).! !

!CartTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 17:53:31'!
test04CantPutsProductsInACartWithEmptyCatalog

	| aCart aProduct |
	
	aProduct := 'Product 1'.

	aCart := Cart withAProductsCatalog: Dictionary new.
	
	self should: [aCart add: aProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cart cantAddAProductThatAreNotInTheCatalogErrorDescription.
	
	self assert: aCart isEmpty.
	self deny: (aCart hasProduct: aProduct).! !

!CartTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 17:53:37'!
test05CantPutInTheCartProductsThatAreNotInTheCatalog

	| aCart aProduct anotherProduct aCatalog |
	
	aProduct := 'Product 1'.
	anotherProduct := 'Product 2'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct->1.
	aCart := Cart withAProductsCatalog: aCatalog.
	
	aCart add: aProduct.
	
	self should: [aCart add: anotherProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cart cantAddAProductThatAreNotInTheCatalogErrorDescription.
	
	self assert: (aCart hasProduct: aProduct).
	self deny: (aCart hasProduct: anotherProduct) ! !

!CartTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 17:53:42'!
test06AddMoreThanOneValidProductAndTheCartRememberTheNumberOfAddedItems

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct->1.

	aCart := Cart withAProductsCatalog: aCatalog.
	aCart add: 2 of: aProduct.
	
	self deny: aCart isEmpty.
	self assert: aCart productsQuantity equals: 2.
	self assert: (aCart hasProduct: aProduct).
	self assert: (aCart quantityOf: aProduct) equals: 2.! !

!CartTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 17:53:47'!
test07CanNotAddNonPositiveNumberOfItems

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 1.
	aCart := Cart withAProductsCatalog: aCatalog.


	self should: [aCart add: 0 of: aProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cart cantAddNonPositiveQuantityOfProducts.
	
	
	self assert: aCart isEmpty.
	self assert: aCart productsQuantity equals: 0.
	self deny: (aCart hasProduct: aProduct).
	self assert: (aCart quantityOf: aProduct) equals: 0.! !

!CartTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 17:54:00'!
test08CanNotAddNonIntegerNumberOfItems

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 1.
	aCart := Cart withAProductsCatalog: aCatalog.


	self should: [aCart add: 1.5 of: aProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cart cantAddNonIntegerQuantityOfProducts.
	
	
	self assert: aCart isEmpty.
	self assert: aCart productsQuantity equals: 0.
	self deny: (aCart hasProduct: aProduct).
	self assert: (aCart quantityOf: aProduct) equals: 0.! !

!CartTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 17:54:05'!
test09ValueOfEmptyCartIs0

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10.

	aCart := Cart withAProductsCatalog: aCatalog.

	self assert: (aCart value) equals: 0.! !

!CartTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 17:54:10'!
test10ValueOfACartWithOneProductIsThePriceOfThatProduct
	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10.

	aCart := Cart withAProductsCatalog: aCatalog.
	aCart add: aProduct.

	self assert: (aCart quantityOf: aProduct) equals: 1.
	self assert: (aCart value) equals: 10.! !

!CartTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 17:54:15'!
test11ValueOfACartWithTwoEqualsProductsIsTheSumOfThePriceOfThatProduct
	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10.

	aCart := Cart withAProductsCatalog: aCatalog.
	aCart add: 2 of: aProduct.

	self assert: (aCart quantityOf: aProduct) equals: 2.
	self assert: (aCart value) equals: 20.! !

!CartTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 17:54:19'!
test12ValueOfACartWithManyDifferentProductsIsTheSumeOfThePriceOfEachProduct

	| aCart aProduct anotherProduct aCatalog|
	
	aProduct := 'Product 1'.
	anotherProduct := 'Product 2'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10; add: anotherProduct->5.

	aCart := Cart withAProductsCatalog: aCatalog.
	aCart add: 2 of: aProduct.
	aCart add: 1 of: anotherProduct.

	self assert: (aCart quantityOf: aProduct) equals: 2.
	self assert: (aCart quantityOf: anotherProduct) equals: 1.
	self assert: (aCart value) equals: 25.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'defaultCartWithOneProduct expiredCreditCard nonExpiredCreditCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'clock' stamp: 'AMS 6/9/2019 03:57:37'!
current

	^June of: 2019! !


!CashierTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 17:12:34'!
test01CantCreateACashierWithAnEmptyCart

	self should: [Cashier for: Cart new payedBy: CreditCard new using: MerchantProcessorInterfaceSimulator new andAClock: self] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cashier cantCreateACashierWithAnEmptyCart 
	! !

!CashierTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 18:05:12'!
test02CantCreateACashierWithAnExpiredCreditCard

	self should: [Cashier for: defaultCartWithOneProduct payedBy: expiredCreditCard using: MerchantProcessorInterfaceSimulator new andAClock: self.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cashier cantCreateACashierWithAnExpiredCreditCard 
	! !

!CashierTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 18:06:04'!
test03CanCheckoutANonEmptyCart

	| aCashier merchantProcessorSimulator |
		
	merchantProcessorSimulator := MerchantProcessorInterfaceSimulator whenHasToDebit: 5 from: nonExpiredCreditCard thenResponse: [5].
	
	aCashier := Cashier for: defaultCartWithOneProduct payedBy: nonExpiredCreditCard using: merchantProcessorSimulator andAClock: self.

	self assert: aCashier checkout equals: defaultCartWithOneProduct value.
	! !

!CashierTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 18:06:17'!
test04RaiseAnInvalidCardExeptionWhenMerchantProcessorRaiseIt

	| aCashier merchantProcessorSimulator |
		
	merchantProcessorSimulator := MerchantProcessorInterfaceSimulator whenHasToDebit: 5 from: nonExpiredCreditCard thenResponse: [MerchantProcessorInterfaceSimulator simulateInvalidCardException ].
	
	aCashier := Cashier for: defaultCartWithOneProduct payedBy: nonExpiredCreditCard using: merchantProcessorSimulator andAClock: self.

	self should: [aCashier checkout]
		raise: Error - MessageNotUnderstood 
		withMessageText: MerchantProcessorInterfaceSimulator invalidCardExceptionMessage .
	! !

!CashierTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 18:06:34'!
test05RaiseAnErrorWhenMerchantProcessorRaisesAnError

	"Este test es el mismo que el test04 solo que con otro dato de prueba. Dejamos los 2 tests para mostrar 'la historia' de tdd"
	| aCashier merchantProcessorSimulator |
		
	merchantProcessorSimulator := MerchantProcessorInterfaceSimulator whenHasToDebit: 5 from: nonExpiredCreditCard thenResponse: [MerchantProcessorInterfaceSimulator simulateNotEnoughLimitException ].
	
	aCashier := Cashier for: defaultCartWithOneProduct payedBy: nonExpiredCreditCard using: merchantProcessorSimulator andAClock: self.

	self should: [aCashier checkout]
		raise: Error - MessageNotUnderstood 
		withMessageText: MerchantProcessorInterfaceSimulator notEnoughLimitExceptionmessage .
	! !


!CashierTest methodsFor: 'setup' stamp: 'AMS 6/9/2019 18:05:43'!
setUp

	| aCatalog aProduct |
	
	aProduct := 'Product 1'.
	
	aCatalog := Dictionary new.
	aCatalog add: aProduct->5.
	defaultCartWithOneProduct := Cart withAProductsCatalog: aCatalog.
	defaultCartWithOneProduct add: aProduct.

	expiredCreditCard := CreditCard withNumber: '1234567890123456' ownedBy: 'aPerson' expiringOn: (January of: 2019).
	nonExpiredCreditCard := CreditCard withNumber: '1234567890123456' ownedBy: 'aPerson' expiringOn: (July of: 2019).! !


!classDefinition: #CreditCardTest category: #TusLibros!
TestCase subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 15:44:21'!
test01CanNotCreateACardWithAnEmptyName

	self should: [CreditCard withNumber: '1234567890123456' ownedBy: '' expiringOn: (June of: 2019) ]
		raise: Error - MessageNotUnderstood
		withMessageText: CreditCard canNotCreateACreditCardWithEmptyName 
	! !

!CreditCardTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 15:47:31'!
test02CanNotCreateACardWithANumbersLengthLessThan16

	self should: [CreditCard withNumber: '1' ownedBy: 'aPerson surname' expiringOn: (June of: 2019) ]
		raise: Error - MessageNotUnderstood
		withMessageText: CreditCard canNotCreateACreditCardWithANumbersLengthDifferentThan16 
	! !

!CreditCardTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 15:48:18'!
test03CanNotCreateACardWithACreditCardNumberWithLengthDifferentThan16

	"este test es otro dato de prueba del test02. lo dejamos simplemente para mostrar la 'historia' que hicimos al hacer TDD"
	
	self should: [CreditCard withNumber: '12345678901234567' ownedBy: 'aPerson surname' expiringOn: (June of: 2019) ]
		raise: Error - MessageNotUnderstood
		withMessageText: CreditCard canNotCreateACreditCardWithANumbersLengthDifferentThan16 
	! !

!CreditCardTest methodsFor: 'tests' stamp: 'AMS 6/9/2019 15:51:24'!
test04CanCreateACard

	| aCreditCardNumber aCreditCardOwner aCreditCardExpiringDate aCreditCard |

	aCreditCardNumber := '1234567890123456'.
	aCreditCardOwner := 'aPerson surname'.
	aCreditCardExpiringDate := (June of: 2019).
	
	aCreditCard := CreditCard withNumber: aCreditCardNumber ownedBy: aCreditCardOwner expiringOn: aCreditCardExpiringDate.
	
	self assert: aCreditCard number equals: aCreditCardNumber.
	self assert: aCreditCard owner equals: aCreditCardOwner.
	self assert: aCreditCard expiringDate equals: aCreditCardExpiringDate.! !


!classDefinition: #StoreTest category: #TusLibros!
TestCase subclass: #StoreTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/12/2019 23:30:30'!
test01CanNotCreateCartWhenClientAuthenticationFails

	| aStore |
	
	aStore := Store withClients: Dictionary new andCatalog: Dictionary new.

	self should: [ aStore createCartForClient: 'a client' andPassword: 'a password' ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Store clientDoesNotExist.! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/12/2019 23:30:44'!
test02AuthenticatedClientCanCreateACart

	| aStore clients clientID clientPassword cartID |
	
	clientID := 'a clientID'.
	clientPassword := 'a client password'.
	
	clients := Dictionary new.
	clients add: clientID -> clientPassword.
	
	aStore := Store withClients: clients andCatalog: Dictionary new.

	cartID := aStore createCartForClient: clientID andPassword: clientPassword.
	
	self assert: (aStore listCart: cartID) isEmpty! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/12/2019 23:58:09'!
test03CanNotCreateACartForAClientWhoAlreadyHaveACart

	| aStore clients clientID clientPassword cartID |
	
	clientID := 'a clientID'.
	clientPassword := 'a client password'.
	
	clients := Dictionary new.
	clients add: clientID -> clientPassword.
	
	aStore := Store withClients: clients andCatalog: Dictionary new.

	cartID := aStore createCartForClient: clientID andPassword: clientPassword.
	
	self should: [ aStore createCartForClient: clientID andPassword: clientPassword ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Store clientAlreadyHasACart .
	
	self assert: (aStore listCart: cartID) isEmpty! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/12/2019 23:58:14'!
test04CanNotListAnInexistentCart

	| aStore |
	
	aStore := Store withClients: Dictionary new andCatalog: Dictionary new.

	self should: [aStore listCart: 0] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Store cartDoesNotExist! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/13/2019 00:04:24'!
test05CanNotAddAProductToAnInexistentCart

	| aStore cartID |

	aStore := Store withClients: Dictionary new andCatalog: Dictionary new.
	cartID := 5.
	
	self should: [aStore add: 1 of: 'a book' to: cartID]
		raise: Error - MessageNotUnderstood 
		withMessageText: Store cartDoesNotExist ! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/13/2019 00:08:00'!
test06CanAddAProductOfTheCatalogToAnExistentCart

	| aStore clients clientID clientPassword cartID aCatalog aProduct |
	
	clientID := 'a clientID'.
	clientPassword := 'a client password'.
	
	clients := Dictionary new.
	clients add: clientID -> clientPassword.
	
	aProduct := 'a product'.
	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10.
	
	aStore := Store withClients: clients andCatalog: aCatalog .

	cartID := aStore createCartForClient: clientID andPassword: clientPassword.
	
	aStore add: 2 of: aProduct to: cartID.
	
	self assert: (aStore listCart: cartID) size equals: 2.
	self assert: ((aStore listCart: cartID) occurrencesOf: aProduct ) equals: 2.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'state catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'evaluating' stamp: 'AMS 6/9/2019 17:47:46'!
value

	^state valueWith: catalog 
	! !


!Cart methodsFor: 'products' stamp: 'AMS 6/9/2019 17:36:19'!
products

	^state products! !

!Cart methodsFor: 'products' stamp: 'AMS 6/9/2019 17:37:20'!
productsQuantity

	^state productsQuantity
		! !

!Cart methodsFor: 'products' stamp: 'AMS 6/9/2019 17:37:57'!
quantityOf: aProduct

	^state quantityOf: aProduct 
	
		! !


!Cart methodsFor: 'testing' stamp: 'AMS 6/9/2019 17:40:35'!
hasProduct: aProduct 

	^state hasProduct: aProduct! !

!Cart methodsFor: 'testing' stamp: 'AMS 6/6/2019 01:35:08'!
isEmpty
	^ (self productsQuantity = 0)! !


!Cart methodsFor: 'initialization' stamp: 'AMS 6/9/2019 17:47:21'!
initialize

	state := EmptyCartState new.! !

!Cart methodsFor: 'initialization' stamp: 'AMS 6/9/2019 17:46:59'!
initializeWithACatalog: aCatalog

	self initialize.
	"we make a copy of the catalog in order to prevent removing or adding element from the reference.
	i.e.:
	aCatalog := Dictionary new.
	aCatalog add: 'aProduct' -> 10.
	aCart withAProductsCatalog: aCatalog.
	aCatalog removeKey: 'aProduct'
	"
	catalog := aCatalog copy.

! !


!Cart methodsFor: 'exceptions' stamp: 'AMS 6/6/2019 02:03:01'!
raiseCantAddANonIntegerQuantityOfProducts

	^self error: self class cantAddNonIntegerQuantityOfProducts 
! !

!Cart methodsFor: 'exceptions' stamp: 'AMS 6/6/2019 02:01:57'!
raiseCantAddANonPositiveQuantityOfProducts

	^self error: self class cantAddNonPositiveQuantityOfProducts 
! !

!Cart methodsFor: 'exceptions' stamp: 'BA 6/2/2019 19:07:30'!
raiseCantAddAProductThatAreNotInTheCatalogException

	^self error: self class cantAddAProductThatAreNotInTheCatalogErrorDescription 
! !

!Cart methodsFor: 'exceptions' stamp: 'BA 6/2/2019 18:51:55'!
raiseCantRemoveProductsThatAreNotInTheCartException

	^self error: self class cantRemoveProductsThatAreNotInTheCartErrorDescription 
! !


!Cart methodsFor: 'assertions' stamp: 'AMS 6/6/2019 02:02:10'!
assertIsAPositiveQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [self raiseCantAddANonPositiveQuantityOfProducts ]! !

!Cart methodsFor: 'assertions' stamp: 'AMS 6/6/2019 02:05:33'!
assertIsAnIntegerQuantity: aQuantity

	aQuantity isInteger ifFalse: [self raiseCantAddANonIntegerQuantityOfProducts ]! !

!Cart methodsFor: 'assertions' stamp: 'AMS 6/6/2019 02:03:19'!
assertIsValidQuantity: aQuantity

	self assertIsAPositiveQuantity: aQuantity.
	self assertIsAnIntegerQuantity: aQuantity ! !

!Cart methodsFor: 'assertions' stamp: 'BA 6/8/2019 18:27:02'!
assertItemIsInTheCatalog: aProduct

	(catalog keys includes: aProduct) ifFalse: [ ^self raiseCantAddAProductThatAreNotInTheCatalogException ].! !


!Cart methodsFor: 'adding' stamp: 'AMS 6/6/2019 01:42:22'!
add: aProduct
	
	^self add: 1 of: aProduct ! !

!Cart methodsFor: 'adding' stamp: 'AMS 6/9/2019 17:51:13'!
add: aQuantity of: aProduct

	self assertItemIsInTheCatalog: aProduct.
	self assertIsValidQuantity: aQuantity.
	
	aQuantity timesRepeat: [state := state add: aProduct ].! !


!Cart methodsFor: 'checkout' stamp: 'AMS 6/9/2019 23:33:35'!
beCheckoutedBy: cashier

	^state beCheckoutedBy: cashier! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'exceptions messages' stamp: 'BA 6/2/2019 19:00:08'!
cantAddAProductThatAreNotInTheCatalogErrorDescription
	^ 'You cant add a product in the cart that are not in the catalog'! !

!Cart class methodsFor: 'exceptions messages' stamp: 'AMS 6/6/2019 02:02:48'!
cantAddNonIntegerQuantityOfProducts
	^ 'You cant add a non integer quantity of products to the cart'! !

!Cart class methodsFor: 'exceptions messages' stamp: 'AMS 6/6/2019 01:55:15'!
cantAddNonPositiveQuantityOfProducts
	^ 'You cant add a non positive quantity of products to the cart'! !

!Cart class methodsFor: 'exceptions messages' stamp: 'BA 6/2/2019 18:51:02'!
cantRemoveProductsThatAreNotInTheCartErrorDescription
	^'You cant remove products that are not in the cart'! !


!Cart class methodsFor: 'instance creation' stamp: 'BA 6/2/2019 21:18:33'!
withAProductsCatalog: aCatalog
	^ self new initializeWithACatalog: aCatalog! !


!classDefinition: #CartState category: #TusLibros!
Object subclass: #CartState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartState methodsFor: 'evaluating' stamp: 'AMS 6/9/2019 17:29:54'!
valueWith: aCatalog
	
	self subclassResponsibility ! !


!CartState methodsFor: 'testing' stamp: 'AMS 6/9/2019 17:40:55'!
hasProduct: aProduct

	self subclassResponsibility ! !

!CartState methodsFor: 'testing' stamp: 'AMS 6/9/2019 17:40:58'!
isEmpty

	self subclassResponsibility ! !


!CartState methodsFor: 'products' stamp: 'AMS 6/9/2019 17:36:54'!
products

	self subclassResponsibility ! !

!CartState methodsFor: 'products' stamp: 'AMS 6/9/2019 17:37:31'!
productsQuantity

	self subclassResponsibility ! !

!CartState methodsFor: 'products' stamp: 'AMS 6/9/2019 17:38:33'!
quantityOf: aProduct

	self subclassResponsibility ! !


!CartState methodsFor: 'adding' stamp: 'AMS 6/9/2019 17:51:24'!
add: aProduct

	self subclassResponsibility ! !


!CartState methodsFor: 'checkout' stamp: 'AMS 6/9/2019 23:33:53'!
beCheckoutedBy: cashier

	self subclassResponsibility ! !


!classDefinition: #EmptyCartState category: #TusLibros!
CartState subclass: #EmptyCartState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!EmptyCartState methodsFor: 'evaluating' stamp: 'AMS 6/9/2019 17:47:59'!
valueWith: aCatalog

	^0! !


!EmptyCartState methodsFor: 'products' stamp: 'AMS 6/9/2019 17:37:01'!
products

	^Set new! !

!EmptyCartState methodsFor: 'products' stamp: 'AMS 6/9/2019 17:37:39'!
productsQuantity

	^0! !

!EmptyCartState methodsFor: 'products' stamp: 'AMS 6/9/2019 17:38:43'!
quantityOf: aProduct

	^0! !


!EmptyCartState methodsFor: 'testing' stamp: 'AMS 6/9/2019 17:41:16'!
hasProduct: aProduct

	^false! !

!EmptyCartState methodsFor: 'testing' stamp: 'AMS 6/9/2019 17:41:21'!
isEmpty

	^true! !


!EmptyCartState methodsFor: 'adding' stamp: 'AMS 6/9/2019 17:52:02'!
add: aProduct

	| newState|
	
	newState := NonEmptyCartState new.
	newState add: aProduct.
	
	^newState ! !


!EmptyCartState methodsFor: 'checkout' stamp: 'AMS 6/9/2019 23:35:01'!
beCheckoutedBy: cashier

	^cashier validateEmptyCart! !


!classDefinition: #NonEmptyCartState category: #TusLibros!
CartState subclass: #NonEmptyCartState
	instanceVariableNames: 'products'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!NonEmptyCartState methodsFor: 'evaluating' stamp: 'AMS 6/9/2019 17:52:48'!
valueWith: aCatalog

	^products sum: [:aProduct | aCatalog at: aProduct ]! !


!NonEmptyCartState methodsFor: 'products' stamp: 'AMS 6/9/2019 17:37:09'!
products

	^products ! !

!NonEmptyCartState methodsFor: 'products' stamp: 'AMS 6/9/2019 17:37:47'!
productsQuantity

	^products size! !

!NonEmptyCartState methodsFor: 'products' stamp: 'AMS 6/9/2019 17:40:18'!
quantityOf: aProduct

	^products occurrencesOf: aProduct ! !


!NonEmptyCartState methodsFor: 'testing' stamp: 'AMS 6/9/2019 17:41:43'!
hasProduct: aProduct
	
	^products includes: aProduct! !

!NonEmptyCartState methodsFor: 'testing' stamp: 'AMS 6/9/2019 17:41:36'!
isEmpty
	
	^false! !


!NonEmptyCartState methodsFor: 'initializing' stamp: 'AMS 6/9/2019 17:49:17'!
initialize

	products := OrderedCollection new.! !


!NonEmptyCartState methodsFor: 'adding' stamp: 'AMS 6/9/2019 17:42:56'!
add: aProduct

	products add: aProduct ! !


!NonEmptyCartState methodsFor: 'checkout' stamp: 'AMS 6/9/2019 23:35:08'!
beCheckoutedBy: cashier

	^cashier validateNonEmptyCart! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart creditCard clock merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialization' stamp: 'AMS 6/9/2019 16:24:13'!
initializeFor: aCart payedBy: aCreditCard using: aMerchantProcessor andAClock: aClock

	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	clock:= aClock! !



!Cashier methodsFor: 'checkout' stamp: 'AMS 6/9/2019 16:43:48'!
checkout

	^merchantProcessor debit: cart value from: creditCard.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: 'clock'!

!Cashier class methodsFor: 'exceptions messages' stamp: 'AMS 6/9/2019 15:28:25'!
cantCreateACashierWithAnEmptyCart

	^'You cant create a cashier with an empty cart'! !

!Cashier class methodsFor: 'exceptions messages' stamp: 'AMS 6/9/2019 03:48:55'!
cantCreateACashierWithAnExpiredCreditCard

	^'You cant create a cashier with an expired credit card'! !


!Cashier class methodsFor: 'instance creation' stamp: 'AMS 6/9/2019 23:32:57'!
for: aCart payedBy: aCreditCard using: aMerchantProcessor andAClock: aClock

	aCart beCheckoutedBy: self.
	(aCreditCard hasExpiredOn: aClock current) ifTrue: [self error: self cantCreateACashierWithAnExpiredCreditCard ].

	^self new initializeFor: aCart payedBy: aCreditCard using: aMerchantProcessor andAClock: aClock ! !


!Cashier class methodsFor: 'validations' stamp: 'AMS 6/10/2019 08:43:50'!
validateEmptyCart

	^self error: self cantCreateACashierWithAnEmptyCart ! !

!Cashier class methodsFor: 'validations' stamp: 'AMS 6/10/2019 08:44:18'!
validateNonEmptyCart

	"this message remains empty because there is no validations to do on a non empty cart"! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'number owner expiringDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'AMS 6/9/2019 15:46:25'!
initializeWithNumber: creditCardNumber ownedBy: aPersonName expiringOn: anExpirationDate

	number := creditCardNumber.
	owner := aPersonName.
	expiringDate := anExpirationDate.! !


!CreditCard methodsFor: 'testing' stamp: 'AMS 6/9/2019 04:01:30'!
hasExpiredOn: aDate 
	
	^expiringDate < aDate ! !


!CreditCard methodsFor: 'accessing' stamp: 'AMS 6/9/2019 15:45:42'!
expiringDate

	^expiringDate ! !

!CreditCard methodsFor: 'accessing' stamp: 'AMS 6/9/2019 15:45:30'!
number

	^number! !

!CreditCard methodsFor: 'accessing' stamp: 'AMS 6/9/2019 15:45:35'!
owner

	^owner ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'exception messages' stamp: 'AMS 6/9/2019 15:42:53'!
canNotCreateACreditCardWithANumbersLengthDifferentThan16

	^'Can not create a credit card with a number length different than 16'! !

!CreditCard class methodsFor: 'exception messages' stamp: 'AMS 6/9/2019 15:38:37'!
canNotCreateACreditCardWithEmptyName

	^'Can not create a credit card with empty name'! !


!CreditCard class methodsFor: 'instance creation' stamp: 'AMS 6/9/2019 15:45:04'!
withNumber: creditCardNumber ownedBy: aPersonName expiringOn: anExpirationDate

	aPersonName isEmpty ifTrue: [self error: self canNotCreateACreditCardWithEmptyName].
	(creditCardNumber size = 16) ifFalse: [self error: self canNotCreateACreditCardWithANumbersLengthDifferentThan16 ].

	^self new initializeWithNumber: creditCardNumber ownedBy: aPersonName expiringOn: anExpirationDate.! !


!classDefinition: #MerchantProcessorInterfaceSimulator category: #TusLibros!
Object subclass: #MerchantProcessorInterfaceSimulator
	instanceVariableNames: 'simulatedResponses'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorInterfaceSimulator methodsFor: 'key generator - private' stamp: 'AMS 6/9/2019 16:39:18'!
generateRequestKeyFor: anAmount and: aCreditCard

	^anAmount printString,'-',aCreditCard number printString,'-',aCreditCard owner printString,'-',aCreditCard expiringDate printString! !


!MerchantProcessorInterfaceSimulator methodsFor: 'debiting' stamp: 'AMS 6/9/2019 16:45:45'!
debit: anAmount from: aCreditCard

	| simulatedResponse |
	simulatedResponse := simulatedResponses at: (self generateRequestKeyFor: anAmount and: aCreditCard) ifAbsent: [MessageNotUnderstood new signal].
	
	^simulatedResponse value! !


!MerchantProcessorInterfaceSimulator methodsFor: 'initialization' stamp: 'AMS 6/9/2019 16:34:22'!
initialize

	simulatedResponses := Dictionary new.! !

!MerchantProcessorInterfaceSimulator methodsFor: 'initialization' stamp: 'AMS 6/9/2019 16:39:42'!
initializeSimulating: aSimualtedResponse whenDebit: anAmount from: aCreditCard

	self initialize.
	
	simulatedResponses at: (self generateRequestKeyFor: anAmount and: aCreditCard) put: aSimualtedResponse ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorInterfaceSimulator class' category: #TusLibros!
MerchantProcessorInterfaceSimulator class
	instanceVariableNames: ''!

!MerchantProcessorInterfaceSimulator class methodsFor: 'instance creation' stamp: 'AMS 6/9/2019 16:33:35'!
whenHasToDebit: anAmount from: aCreditCard thenResponse: aSimualtedResponse

	^self new initializeSimulating: aSimualtedResponse whenDebit: anAmount from: aCreditCard ! !


!MerchantProcessorInterfaceSimulator class methodsFor: 'exception messages' stamp: 'AMS 6/9/2019 16:49:30'!
invalidCardExceptionMessage

	^'Invalid card'! !

!MerchantProcessorInterfaceSimulator class methodsFor: 'exception messages' stamp: 'AMS 6/9/2019 16:54:29'!
notEnoughLimitExceptionmessage

	^'Not enough limit'! !


!MerchantProcessorInterfaceSimulator class methodsFor: 'simulated exceptions' stamp: 'AMS 6/9/2019 16:49:46'!
simulateInvalidCardException

	^self error: self invalidCardExceptionMessage ! !

!MerchantProcessorInterfaceSimulator class methodsFor: 'simulated exceptions' stamp: 'AMS 6/9/2019 16:54:29'!
simulateNotEnoughLimitException

	^self error: self notEnoughLimitExceptionmessage ! !


!classDefinition: #Store category: #TusLibros!
Object subclass: #Store
	instanceVariableNames: 'clients carts cartByClientID catalog nextCartID'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Store methodsFor: 'authentication' stamp: 'AMS 6/12/2019 23:15:14'!
authenticateClient: clientID withPassword: clientPassword

	| passwordForClientID |

	passwordForClientID := clients at: clientID ifAbsent: [^self error: self class clientDoesNotExist ].
	passwordForClientID = clientPassword ifFalse: [^self error: self class clientDoesNotExist ]! !


!Store methodsFor: 'id generator - private' stamp: 'AMS 6/12/2019 23:25:09'!
generateCartID

	| id |
	
	id := nextCartID.
	nextCartID := nextCartID + 1.
	
	^id! !


!Store methodsFor: 'creating carts' stamp: 'AMS 6/12/2019 23:28:25'!
createCart

	^Cart withAProductsCatalog: catalog.! !

!Store methodsFor: 'creating carts' stamp: 'AMS 6/12/2019 23:58:53'!
createCartForClient: clientID andPassword: clientPassword

	| aCart cartID |

	self authenticateClient: clientID withPassword: clientPassword.
	self assertThatClientHasNoCarts: clientID.
	
	aCart := self createCart .
	cartID := self saveCart: aCart for: clientID .

	^cartID! !

!Store methodsFor: 'creating carts' stamp: 'AMS 6/12/2019 23:59:13'!
saveCart: aCart for: clientID
	
	| cartID |

	cartID := self generateCartID.
	carts at: cartID put: aCart.
	cartByClientID at: clientID put: aCart.
	
	^cartID! !


!Store methodsFor: 'initialization' stamp: 'AMS 6/12/2019 23:56:43'!
initialize
	
	carts := Dictionary new.
	cartByClientID := Dictionary new.
	nextCartID := 0! !

!Store methodsFor: 'initialization' stamp: 'AMS 6/12/2019 23:17:39'!
initializeWithClients: existentClients andCatalog: aCatalog

	self initialize.
	clients := existentClients.
	catalog := aCatalog.! !


!Store methodsFor: 'assertions' stamp: 'AMS 6/12/2019 23:57:52'!
assertThatClientHasNoCarts: clientID

	(cartByClientID includesKey: clientID) ifTrue: [^self error: self class clientAlreadyHasACart ]! !


!Store methodsFor: 'listing carts' stamp: 'AMS 6/12/2019 23:35:08'!
listCart: cartID
	
	| aCart |

	aCart := carts at: cartID ifAbsent: [self error: self class cartDoesNotExist].
	
	^aCart products! !


!Store methodsFor: 'adding to cart' stamp: 'AMS 6/13/2019 00:09:56'!
add: aQuantity of: aProduct to: aCartID

	| aCart |

	aCart := carts at: aCartID ifAbsent: [self error: self class cartDoesNotExist].
	
	aCart add: aQuantity of: aProduct.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Store class' category: #TusLibros!
Store class
	instanceVariableNames: ''!

!Store class methodsFor: 'instance creation' stamp: 'AMS 6/12/2019 23:17:03'!
withClients: clients andCatalog: aCatalog

	^self new initializeWithClients: clients andCatalog: aCatalog! !


!Store class methodsFor: 'exception messages' stamp: 'AMS 6/12/2019 23:35:16'!
cartDoesNotExist

	^'cart does not exist'! !

!Store class methodsFor: 'exception messages' stamp: 'AMS 6/12/2019 23:37:07'!
clientAlreadyHasACart

	^'client already has a cart'! !

!Store class methodsFor: 'exception messages' stamp: 'AMS 6/12/2019 23:02:38'!
clientDoesNotExist

	^'client does not exist'! !
