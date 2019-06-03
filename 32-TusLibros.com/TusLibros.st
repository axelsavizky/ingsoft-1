!classDefinition: #ShoppingCartTests category: #TusLibros!
TestCase subclass: #ShoppingCartTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ShoppingCartTests methodsFor: 'tests' stamp: 'BA 6/2/2019 21:20:39'!
test01WhenCreateAnEmptyCartItIsEmpty

	| aCart aCatalog |
	
	aCatalog := OrderedCollection new.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.
	
	self assert:aCart isEmpty.
	self assert:aCart productsAmount equals: 0.! !

!ShoppingCartTests methodsFor: 'tests' stamp: 'BA 6/2/2019 21:26:08'!
test02AddAValidProductToAnEmptyCartAndThenTheCartIsNotEmpty

	| aCart aProduct aCatalog|
	
	aProduct := 'Product 1'.

	aCatalog := OrderedCollection with: aProduct.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.

	aCart add: aProduct.
	
	self deny: aCart isEmpty.
	self assert: aCart productsAmount equals: 1.
	self assert: (aCart hasProduct: aProduct).! !

!ShoppingCartTests methodsFor: 'tests' stamp: 'BA 6/2/2019 21:26:02'!
test03AddAValidProductToACartAndThenTheProductIsInTheCart

	| aCart aProduct anotherProduct aCatalog|
	
	aProduct := 'Product 1'.
	anotherProduct := 'Product 2'.

	aCatalog := OrderedCollection with: aProduct with: anotherProduct.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.

	aCart add: aProduct.
	aCart add: anotherProduct.
	
	self deny: aCart isEmpty.
	self assert: aCart productsAmount equals: 2.
	self assert: (aCart hasProduct: aProduct).! !

!ShoppingCartTests methodsFor: 'tests' stamp: 'BA 6/2/2019 21:27:49'!
test04RemoveTheOnlyProductFromTheCartAndThenIsEmpty

	| aCart aProduct anotherProduct aCatalog|
	
	aProduct := 'Product 1'.
	aCatalog := OrderedCollection with: aProduct.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.

	aCart add: aProduct.
	aCart remove: aProduct.
	
	self assert: aCart isEmpty.
	self deny: (aCart hasProduct: aProduct).! !

!ShoppingCartTests methodsFor: 'tests' stamp: 'BA 6/2/2019 21:28:59'!
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
	self assert: aCart productsAmount equals: 1.! !

!ShoppingCartTests methodsFor: 'tests' stamp: 'BA 6/2/2019 21:29:58'!
test06CanNotRemoveProductsFromAnEmptyCart

	| aCart aProduct aCatalog |
	
	aProduct := 'Product 1'.

	aCatalog := OrderedCollection with: aProduct.
	aCart := ShoppingCart withAProductsCatalog: aCatalog.
	
	self should: [aCart remove: aProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: ShoppingCart cantRemoveProductsThatAreNotInTheCartErrorDescription.
	
	self assert: aCart isEmpty.! !

!ShoppingCartTests methodsFor: 'tests' stamp: 'BA 6/2/2019 21:36:00'!
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
	self assert: aCart productsAmount equals: 1.! !

!ShoppingCartTests methodsFor: 'tests' stamp: 'BA 6/2/2019 21:41:23'!
test08CantPutsProductsInACartWithEmptyCatalog

	| aCart aProduct |
	
	aProduct := 'Product 1'.

	aCart := ShoppingCart new.
	
	self should: [aCart add: aProduct.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: ShoppingCart cantAddAProductThatAreNotInTheCatalogErrorDescription.
	
	self assert: aCart isEmpty.
	self deny: (aCart hasProduct: aProduct).! !

!ShoppingCartTests methodsFor: 'tests' stamp: 'BA 6/2/2019 21:43:11'!
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
	
	self assert: aCart productsAmount equals: 1.
	self assert: (aCart hasProduct: aProduct).
	self deny: (aCart hasProduct: anotherProduct) ! !


!classDefinition: #ShoppingCart category: #TusLibros!
Object subclass: #ShoppingCart
	instanceVariableNames: 'products catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ShoppingCart methodsFor: 'accesing' stamp: 'BA 6/2/2019 17:43:30'!
hasProduct: aProduct 

	^ products includes: aProduct! !

!ShoppingCart methodsFor: 'accesing' stamp: 'BA 6/2/2019 18:05:07'!
isEmpty
	^ (self productsAmount = 0)! !

!ShoppingCart methodsFor: 'accesing' stamp: 'BA 6/2/2019 18:05:45'!
productsAmount

	^ products size
	
		! !


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


!ShoppingCart methodsFor: 'exceptions' stamp: 'BA 6/2/2019 19:07:30'!
raiseCantAddAProductThatAreNotInTheCatalogException

	^self error: self class cantAddAProductThatAreNotInTheCatalogErrorDescription 
! !

!ShoppingCart methodsFor: 'exceptions' stamp: 'BA 6/2/2019 18:51:55'!
raiseCantRemoveProductsThatAreNotInTheCartException

	^self error: self class cantRemoveProductsThatAreNotInTheCartErrorDescription 
! !


!ShoppingCart methodsFor: 'actions' stamp: 'BA 6/2/2019 21:46:16'!
add: aProduct
	
	| aCatalogProduct |

	aCatalogProduct := catalog detect: [:aCataloguedProduct | aCataloguedProduct = aProduct] ifNone: [ ^self raiseCantAddAProductThatAreNotInTheCatalogException ].
	products add: aCatalogProduct.! !

!ShoppingCart methodsFor: 'actions' stamp: 'BA 6/2/2019 21:46:08'!
remove: aProduct

	products remove: aProduct ifAbsent: [ ^self raiseCantRemoveProductsThatAreNotInTheCartException ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ShoppingCart class' category: #TusLibros!
ShoppingCart class
	instanceVariableNames: ''!

!ShoppingCart class methodsFor: 'exceptions messages' stamp: 'BA 6/2/2019 19:00:08'!
cantAddAProductThatAreNotInTheCatalogErrorDescription
	^ 'You cant add a product in the cart that are not in the catalog'! !

!ShoppingCart class methodsFor: 'exceptions messages' stamp: 'BA 6/2/2019 18:51:02'!
cantRemoveProductsThatAreNotInTheCartErrorDescription
	^'You cant remove products that are not in the cart'! !


!ShoppingCart class methodsFor: 'instance creation' stamp: 'BA 6/2/2019 21:18:33'!
withAProductsCatalog: aCatalog
	^ self new initializeWithACatalog: aCatalog! !
