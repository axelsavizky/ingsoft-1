!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'AMS 6/6/2019 02:15:27'!
test01CantCheckoutAnEmptyCart

	| aCashier aCart aCatalog |
	
	aCatalog := OrderedCollection new.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.
	
	aCashier := Cashier withAPriceList: Dictionary new.
	
	self should: [aCashier checkout: aCart] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cashier cantCheckoutAnEmptyCart
	! !

!CashierTest methodsFor: 'tests' stamp: 'AMS 6/6/2019 02:21:30'!
test02CantCheckoutAProductThatIsNotInThePriceList

	| aCashier aCart aCatalog aProduct |
	
	aProduct := 'Product 1'.
	
	aCatalog := OrderedCollection with: aProduct .
	aCart := ShoppingCart withAProductsCatalog: aCatalog.
	
	aCart add: aProduct.
	
	aCashier := Cashier withAPriceList: Dictionary new.
	
	self should: [aCashier checkout: aCart] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cashier cantCheckoutAProductThatIsNotInThePriceList
	! !


!classDefinition: #ShoppingCartTest category: #TusLibros!
TestCase subclass: #ShoppingCartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ShoppingCartTest methodsFor: 'tests' stamp: 'AMS 6/6/2019 01:35:08'!
test01WhenCreateAnEmptyCartItIsEmpty

	| aCart aCatalog |
	
	aCatalog := OrderedCollection new.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.
	
	self assert:aCart isEmpty.
	self assert:aCart productsQuantity equals: 0.! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'AMS 6/6/2019 01:48:18'!
test02AddAValidProductToAnEmptyCartAndThenTheCartIsNotEmpty

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := OrderedCollection with: aProduct.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.

	aCart add: aProduct.
	
	self deny: aCart isEmpty.
	self assert: aCart productsQuantity equals: 1.
	self assert: (aCart hasProduct: aProduct).! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'AMS 6/6/2019 01:48:11'!
test03AddAValidProductToACartAndThenTheProductIsInTheCart

	| aCart aProduct anotherProduct aCatalog|
	
	aProduct := 'Product 1'.
	anotherProduct := 'Product 2'.

	aCatalog := OrderedCollection with: aProduct with: anotherProduct.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.

	aCart add: aProduct.
	aCart add: anotherProduct.
	
	self deny: aCart isEmpty.
	self assert: aCart productsQuantity equals: 2.
	self assert: (aCart hasProduct: aProduct).! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'AMS 6/6/2019 01:48:07'!
test04RemoveTheOnlyProductFromTheCartAndThenIsEmpty

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.
	aCatalog := OrderedCollection with: aProduct.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.

	aCart add: aProduct.
	aCart remove: aProduct.
	
	self assert: aCart isEmpty.
	self deny: (aCart hasProduct: aProduct).! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'AMS 6/6/2019 01:48:00'!
test05RemoveAProductFromTheCartAndThenIsNotInTheCart

	| aCart aProduct anotherProduct aCatalog|
	
	aProduct := 'Product 1'.
	anotherProduct := 'Product 2'.

	aCatalog := OrderedCollection with: aProduct with: anotherProduct.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.

	aCart add: aProduct.
	aCart add: anotherProduct.
	aCart remove: anotherProduct.
	
	self deny: aCart isEmpty.
	self deny: (aCart hasProduct: anotherProduct).
	self assert: (aCart hasProduct: aProduct).
	self assert: aCart productsQuantity equals: 1.! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/2/2019 21:29:58'!
test06CanNotRemoveProductsFromAnEmptyCart

	| aCart aProduct aCatalog |
	
	aProduct := 'Product 1'.

	aCatalog := OrderedCollection with: aProduct.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.
	
	self should: [aCart remove: aProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: ShoppingCart cantRemoveProductsThatAreNotInTheCartErrorDescription.
	
	self assert: aCart isEmpty.! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'AMS 6/6/2019 01:47:51'!
test07CanNotRemoveProductsThatAreNotInTheCart

	| aCart aProduct anotherProduct aCatalog |
	
	aProduct := 'Product 1'.
	anotherProduct := 'Product 2'.

	aCatalog := OrderedCollection with: aProduct with: anotherProduct.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.

	aCart add: aProduct.
	
	self should: [aCart remove: anotherProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: ShoppingCart cantRemoveProductsThatAreNotInTheCartErrorDescription.
	
	self deny: aCart isEmpty.
	self deny: (aCart hasProduct: anotherProduct).
	self assert: (aCart hasProduct: aProduct).
	self assert: aCart productsQuantity equals: 1.! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/2/2019 21:41:23'!
test08CantPutsProductsInACartWithEmptyCatalog

	| aCart aProduct |
	
	aProduct := 'Product 1'.

	aCart := ShoppingCart new.
	
	self should: [aCart add: aProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: ShoppingCart cantAddAProductThatAreNotInTheCatalogErrorDescription.
	
	self assert: aCart isEmpty.
	self deny: (aCart hasProduct: aProduct).! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'AMS 6/6/2019 01:47:45'!
test09CantPutInTheCartProductsThatAreNotInTheCatalog

	| aCart aProduct anotherProduct aCatalog |
	
	aProduct := 'Product 1'.
	anotherProduct := 'Product 2'.

	aCatalog := OrderedCollection with: aProduct.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.
	
	aCart add: aProduct.
	
	self should: [aCart add: anotherProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: ShoppingCart cantAddAProductThatAreNotInTheCatalogErrorDescription.
	
	self assert: (aCart hasProduct: aProduct).
	self deny: (aCart hasProduct: anotherProduct) ! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'AMS 6/6/2019 01:49:54'!
test10AddMoreThanOneValidProductAndTheCartRememberTheNumberOfAddedItems

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := OrderedCollection with: aProduct.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.

	aCart add: 2 of: aProduct.
	
	self deny: aCart isEmpty.
	self assert: aCart productsQuantity equals: 2.
	self assert: (aCart hasProduct: aProduct).
	self assert: (aCart quantityOf: aProduct) equals: 2.! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'AMS 6/6/2019 01:53:00'!
test11CanNotAddNonPositiveNumberOfItems

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := OrderedCollection with: aProduct.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.


	self should: [aCart add: 0 of: aProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: ShoppingCart cantAddNonPositiveQuantityOfProducts.
	
	
	self assert: aCart isEmpty.
	self assert: aCart productsQuantity equals: 0.
	self deny: (aCart hasProduct: aProduct).
	self assert: (aCart quantityOf: aProduct) equals: 0.! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'AMS 6/6/2019 02:02:33'!
test12CanNotAddNonIntegerNumberOfItems

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := OrderedCollection with: aProduct.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.


	self should: [aCart add: 1.5 of: aProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: ShoppingCart cantAddNonIntegerQuantityOfProducts.
	
	
	self assert: aCart isEmpty.
	self assert: aCart productsQuantity equals: 0.
	self deny: (aCart hasProduct: aProduct).
	self assert: (aCart quantityOf: aProduct) equals: 0.! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'priceList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialization' stamp: 'AMS 6/6/2019 02:16:41'!
initializeWithAPriceList: aPriceList

	priceList := aPriceList ! !


!Cashier methodsFor: 'assertions' stamp: 'AMS 6/6/2019 02:19:04'!
isAValidCart: aCart

	aCart isEmpty ifTrue: [self raiseCantCheckoutAnEmptyCart ] ! !


!Cashier methodsFor: 'checkout' stamp: 'AMS 6/6/2019 02:25:49'!
checkout: aCart

	self isAValidCart: aCart.
	
	aCart products do: [:aProduct |
		priceList at: aProduct ifAbsent: [self raiseCantCheckoutAProductThatIsNotInThePriceList ].
	]! !


!Cashier methodsFor: 'exceptions' stamp: 'AMS 6/6/2019 02:25:44'!
raiseCantCheckoutAProductThatIsNotInThePriceList

	^self error: self class cantCheckoutAProductThatIsNotInThePriceList ! !

!Cashier methodsFor: 'exceptions' stamp: 'AMS 6/6/2019 02:17:48'!
raiseCantCheckoutAnEmptyCart

	^self error: self class cantCheckoutAnEmptyCart ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'exceptions messages' stamp: 'AMS 6/6/2019 02:20:17'!
cantCheckoutAProductThatIsNotInThePriceList

	^'You cant checkout a product that is not in the price list'! !

!Cashier class methodsFor: 'exceptions messages' stamp: 'AMS 6/6/2019 02:17:27'!
cantCheckoutAnEmptyCart

	^'You cant checkout an empty cart'! !


!Cashier class methodsFor: 'instance creation' stamp: 'AMS 6/6/2019 02:16:13'!
withAPriceList: aPriceList

	^self new initializeWithAPriceList: aPriceList ! !


!classDefinition: #ShoppingCart category: #TusLibros!
Object subclass: #ShoppingCart
	instanceVariableNames: 'products catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ShoppingCart methodsFor: 'accessing products' stamp: 'AMS 6/6/2019 02:24:14'!
products

	^products asSet ! !

!ShoppingCart methodsFor: 'accessing products' stamp: 'AMS 6/6/2019 01:35:08'!
productsQuantity

	^ products size
	
		! !

!ShoppingCart methodsFor: 'accessing products' stamp: 'AMS 6/6/2019 01:36:03'!
quantityOf: aProduct

	^ products occurrencesOf: aProduct 
	
		! !


!ShoppingCart methodsFor: 'testing' stamp: 'BA 6/2/2019 17:43:30'!
hasProduct: aProduct 

	^ products includes: aProduct! !

!ShoppingCart methodsFor: 'testing' stamp: 'AMS 6/6/2019 01:35:08'!
isEmpty
	^ (self productsQuantity = 0)! !


!ShoppingCart methodsFor: 'initialization' stamp: 'BA 6/2/2019 19:08:05'!
initialize

	products := OrderedCollection new.
	catalog := OrderedCollection new.

! !

!ShoppingCart methodsFor: 'initialization' stamp: 'BA 6/2/2019 21:19:03'!
initializeWithACatalog: aCatalog

	products := OrderedCollection new.
	catalog := aCatalog.

! !


!ShoppingCart methodsFor: 'exceptions' stamp: 'AMS 6/6/2019 02:03:01'!
raiseCantAddANonIntegerQuantityOfProducts

	^self error: self class cantAddNonIntegerQuantityOfProducts 
! !

!ShoppingCart methodsFor: 'exceptions' stamp: 'AMS 6/6/2019 02:01:57'!
raiseCantAddANonPositiveQuantityOfProducts

	^self error: self class cantAddNonPositiveQuantityOfProducts 
! !

!ShoppingCart methodsFor: 'exceptions' stamp: 'BA 6/2/2019 19:07:30'!
raiseCantAddAProductThatAreNotInTheCatalogException

	^self error: self class cantAddAProductThatAreNotInTheCatalogErrorDescription 
! !

!ShoppingCart methodsFor: 'exceptions' stamp: 'BA 6/2/2019 18:51:55'!
raiseCantRemoveProductsThatAreNotInTheCartException

	^self error: self class cantRemoveProductsThatAreNotInTheCartErrorDescription 
! !


!ShoppingCart methodsFor: 'removing' stamp: 'BA 6/2/2019 21:46:08'!
remove: aProduct

	products remove: aProduct ifAbsent: [ ^self raiseCantRemoveProductsThatAreNotInTheCartException ].! !


!ShoppingCart methodsFor: 'assertions' stamp: 'AMS 6/6/2019 02:02:10'!
assertIsAPositiveQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [self raiseCantAddANonPositiveQuantityOfProducts ]! !

!ShoppingCart methodsFor: 'assertions' stamp: 'AMS 6/6/2019 02:05:33'!
assertIsAnIntegerQuantity: aQuantity

	aQuantity isInteger ifFalse: [self raiseCantAddANonIntegerQuantityOfProducts ]! !

!ShoppingCart methodsFor: 'assertions' stamp: 'AMS 6/6/2019 02:03:19'!
assertIsValidQuantity: aQuantity

	self assertIsAPositiveQuantity: aQuantity.
	self assertIsAnIntegerQuantity: aQuantity ! !

!ShoppingCart methodsFor: 'assertions' stamp: 'AMS 6/6/2019 01:44:47'!
assertItemIsInTheCatalog: aProduct

	(catalog includes: aProduct) ifFalse: [ ^self raiseCantAddAProductThatAreNotInTheCatalogException ].! !


!ShoppingCart methodsFor: 'adding' stamp: 'AMS 6/6/2019 01:42:22'!
add: aProduct
	
	^self add: 1 of: aProduct ! !

!ShoppingCart methodsFor: 'adding' stamp: 'AMS 6/6/2019 01:57:02'!
add: aQuantity of: aProduct

	self assertItemIsInTheCatalog: aProduct.
	self assertIsValidQuantity: aQuantity.
	aQuantity timesRepeat: [products add: aProduct ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ShoppingCart class' category: #TusLibros!
ShoppingCart class
	instanceVariableNames: ''!

!ShoppingCart class methodsFor: 'exceptions messages' stamp: 'BA 6/2/2019 19:00:08'!
cantAddAProductThatAreNotInTheCatalogErrorDescription
	^ 'You cant add a product in the cart that are not in the catalog'! !

!ShoppingCart class methodsFor: 'exceptions messages' stamp: 'AMS 6/6/2019 02:02:48'!
cantAddNonIntegerQuantityOfProducts
	^ 'You cant add a non integer quantity of products to the cart'! !

!ShoppingCart class methodsFor: 'exceptions messages' stamp: 'AMS 6/6/2019 01:55:15'!
cantAddNonPositiveQuantityOfProducts
	^ 'You cant add a non positive quantity of products to the cart'! !

!ShoppingCart class methodsFor: 'exceptions messages' stamp: 'BA 6/2/2019 18:51:02'!
cantRemoveProductsThatAreNotInTheCartErrorDescription
	^'You cant remove products that are not in the cart'! !


!ShoppingCart class methodsFor: 'instance creation' stamp: 'BA 6/2/2019 21:18:33'!
withAProductsCatalog: aCatalog
	^ self new initializeWithACatalog: aCatalog! !
