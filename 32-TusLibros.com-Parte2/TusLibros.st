!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'BA 6/8/2019 18:59:24'!
test01CantCheckoutAnEmptyCart

	| aCashier aCart aCatalog |
	
	aCatalog := Dictionary new.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.
	
	aCashier := Cashier withAPriceList: Dictionary new.
	
	self should: [aCashier checkout: aCart] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cashier cantCheckoutAnEmptyCart
	! !

!CashierTest methodsFor: 'tests' stamp: 'BA 6/8/2019 19:01:00'!
test02CantCheckoutAProductThatIsNotInThePriceList
	"REFORMULAR ESTE TEST"
	| aCashier aCart aCatalog aProduct |
	
	aProduct := 'Product 1'.
	
	aCatalog := Dictionary new.
	aCatalog add: aProduct->5.
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

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/8/2019 18:17:20'!
test01WhenCreateAnEmptyCartItIsEmpty

	| aCart aCatalog |
	
	aCatalog := Dictionary new.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.
	
	self assert:aCart isEmpty.
	self assert:aCart productsQuantity equals: 0.! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/8/2019 18:43:44'!
test02AddAValidProductToAnEmptyCartAndThenTheCartIsNotEmpty

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct->1.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.

	aCart add: aProduct.
	
	self deny: aCart isEmpty.
	self assert: aCart productsQuantity equals: 1.
	self assert: (aCart hasProduct: aProduct).! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/8/2019 18:43:37'!
test03AddAValidProductToACartAndThenTheProductIsInTheCart

	| aCart aProduct anotherProduct aCatalog|
	
	aProduct := 'Product 1'.
	anotherProduct := 'Product 2'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct->5; add: anotherProduct->10.

	aCart := ShoppingCart withAProductsCatalog: aCatalog.

	aCart add: aProduct.
	aCart add: anotherProduct.
	
	self deny: aCart isEmpty.
	self assert: aCart productsQuantity equals: 2.
	self assert: (aCart hasProduct: aProduct).! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/8/2019 18:43:13'!
test04RemoveTheOnlyProductFromTheCartAndThenIsEmpty

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct->1.
	
	aCart := ShoppingCart withAProductsCatalog: aCatalog.

	aCart add: aProduct.
	aCart remove: aProduct.
	
	self assert: aCart isEmpty.
	self deny: (aCart hasProduct: aProduct).! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/8/2019 18:33:22'!
test05RemoveAProductFromTheCartAndThenIsNotInTheCart

	| aCart aProduct anotherProduct aCatalog|
	
	aProduct := 'Product 1'.
	anotherProduct := 'Product 2'.
	
	aCatalog := Dictionary new.
	aCatalog add: aProduct->1; add: anotherProduct->1.

	aCart := ShoppingCart withAProductsCatalog: aCatalog.

	aCart add: aProduct.
	aCart add: anotherProduct.
	aCart remove: anotherProduct.
	
	self deny: aCart isEmpty.
	self deny: (aCart hasProduct: anotherProduct).
	self assert: (aCart hasProduct: aProduct).
	self assert: aCart productsQuantity equals: 1.! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/8/2019 18:34:46'!
test06CanNotRemoveProductsFromAnEmptyCart

	| aCart aProduct aCatalog |
	
	aProduct := 'Product 1'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct->1.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.
	
	self should: [aCart remove: aProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: ShoppingCart cantRemoveProductsThatAreNotInTheCartErrorDescription.
	
	self assert: aCart isEmpty.! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/8/2019 18:35:27'!
test07CanNotRemoveProductsThatAreNotInTheCart

	| aCart aProduct anotherProduct aCatalog |
	
	aProduct := 'Product 1'.
	anotherProduct := 'Product 2'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct->1; add: anotherProduct->1.
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

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/8/2019 18:42:53'!
test09CantPutInTheCartProductsThatAreNotInTheCatalog

	| aCart aProduct anotherProduct aCatalog |
	
	aProduct := 'Product 1'.
	anotherProduct := 'Product 2'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct->1.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.
	
	aCart add: aProduct.
	
	self should: [aCart add: anotherProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: ShoppingCart cantAddAProductThatAreNotInTheCatalogErrorDescription.
	
	self assert: (aCart hasProduct: aProduct).
	self deny: (aCart hasProduct: anotherProduct) ! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/8/2019 18:42:38'!
test10AddMoreThanOneValidProductAndTheCartRememberTheNumberOfAddedItems

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct->1.

	aCart := ShoppingCart withAProductsCatalog: aCatalog.

	aCart add: 2 of: aProduct.
	
	self deny: aCart isEmpty.
	self assert: aCart productsQuantity equals: 2.
	self assert: (aCart hasProduct: aProduct).
	self assert: (aCart quantityOf: aProduct) equals: 2.! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/8/2019 18:44:29'!
test11CanNotAddNonPositiveNumberOfItems

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 1.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.


	self should: [aCart add: 0 of: aProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: ShoppingCart cantAddNonPositiveQuantityOfProducts.
	
	
	self assert: aCart isEmpty.
	self assert: aCart productsQuantity equals: 0.
	self deny: (aCart hasProduct: aProduct).
	self assert: (aCart quantityOf: aProduct) equals: 0.! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/8/2019 18:44:43'!
test12CanNotAddNonIntegerNumberOfItems

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 1.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.


	self should: [aCart add: 1.5 of: aProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: ShoppingCart cantAddNonIntegerQuantityOfProducts.
	
	
	self assert: aCart isEmpty.
	self assert: aCart productsQuantity equals: 0.
	self deny: (aCart hasProduct: aProduct).
	self assert: (aCart quantityOf: aProduct) equals: 0.! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/8/2019 18:56:45'!
test13
	"El value de un carrito vacio es 0"
	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10.

	aCart := ShoppingCart withAProductsCatalog: aCatalog.

	self assert: (aCart value) equals: 0.! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/8/2019 18:56:58'!
test14
	"Si agrega 2 productos iguales , el value es la suma del precio de los dos productos"
	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10.

	aCart := ShoppingCart withAProductsCatalog: aCatalog.
	aCart add: 2 of: aProduct.

	self assert: (aCart quantityOf: aProduct) equals: 2.
	self assert: (aCart value) equals: 20.! !

!ShoppingCartTest methodsFor: 'tests' stamp: 'BA 6/8/2019 18:57:11'!
test15
	"Si agrega 2 productos iguales y 1 distinto, el value es la suma del precio de los tres productos"
	| aCart aProduct anotherProduct aCatalog|
	
	aProduct := 'Product 1'.
	anotherProduct := 'Product 2'.

	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10; add: anotherProduct->5.

	aCart := ShoppingCart withAProductsCatalog: aCatalog.
	aCart add: 2 of: aProduct.
	aCart add: 1 of: anotherProduct.

	self assert: (aCart quantityOf: aProduct) equals: 2.
	self assert: (aCart quantityOf: anotherProduct) equals: 1.
	self assert: (aCart value) equals: 25.! !


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


!Cashier methodsFor: 'checkout' stamp: 'BA 6/8/2019 18:58:47'!
checkout: aCart

	self isAValidCart: aCart.
	^aCart value.! !


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

!ShoppingCart methodsFor: 'accessing products' stamp: 'BA 6/8/2019 18:49:41'!
value
	| totalPriceOfProducts |

	totalPriceOfProducts _ products inject: 0 into: [:countPrice :aProduct | countPrice + catalog at: aProduct].
	
	^ totalPriceOfProducts
	! !


!ShoppingCart methodsFor: 'testing' stamp: 'BA 6/2/2019 17:43:30'!
hasProduct: aProduct 

	^ products includes: aProduct! !

!ShoppingCart methodsFor: 'testing' stamp: 'AMS 6/6/2019 01:35:08'!
isEmpty
	^ (self productsQuantity = 0)! !


!ShoppingCart methodsFor: 'initialization' stamp: 'BA 6/8/2019 18:38:58'!
initialize

	products := OrderedCollection new.
	catalog := Dictionary new.

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

!ShoppingCart methodsFor: 'assertions' stamp: 'BA 6/8/2019 18:27:02'!
assertItemIsInTheCatalog: aProduct

	(catalog keys includes: aProduct) ifFalse: [ ^self raiseCantAddAProductThatAreNotInTheCatalogException ].! !


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
