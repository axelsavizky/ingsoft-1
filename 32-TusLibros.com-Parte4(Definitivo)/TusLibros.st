!classDefinition: #TusLibrosClientWindow category: #TusLibros!
Panel subclass: #TusLibrosClientWindow
	instanceVariableNames: 'clientIdTextBox passwordTextBox bookQuantityTextBox catalogProductsList cartProductsList creditCardNumberTextBox creditCardExpiredDateTextBox creditCardOwnerTextBox'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosClientWindow methodsFor: 'initialization' stamp: 'Ba 7/9/2019 17:13:16'!
defaultExtent

	^ 800@600
	! !

!TusLibrosClientWindow methodsFor: 'initialization' stamp: 'ba 7/11/2019 00:45:11'!
initializeCatalogWindowWith: aCartId

	self titleMorph showButtonsNamed: #( close collapse ).
	self setLabel: 'TusLibros Store - Catalog'.
	self model: (TusLibrosClientWindowModel new).
	self morphExtent: (self defaultExtent).
	self buildMorphicCatalogWindow: aCartId.
	self openInWorld.
	self yourself.

	self model when: #newSubstringsArrived send: #refreshCartProductsList to: self.! !

!TusLibrosClientWindow methodsFor: 'initialization' stamp: 'ba 7/11/2019 02:26:31'!
initializePurchasesWindowWith: purchasesList

	self titleMorph showButtonsNamed: #( close collapse ).
	self setLabel: 'TusLibros Store - Purchases'.
	self model: (TusLibrosClientWindowModel new).
	self morphExtent: (self defaultExtent).
	self buildMorphicPurchasesWindow.
	self openInWorld.
	self yourself.
	self model setPurchasesList: purchasesList.! !

!TusLibrosClientWindow methodsFor: 'initialization' stamp: 'ba 7/11/2019 01:37:18'!
initializeWith: aTitle

	self titleMorph showButtonsNamed: #( close collapse ).
	self setLabel: aTitle.
	self model: (TusLibrosClientWindowModel new).
	self morphExtent: (self defaultExtent).
	self buildMorphicStartWindow.
	self openInWorld.
	self yourself.
! !

!TusLibrosClientWindow methodsFor: 'initialization' stamp: 'ba 7/11/2019 00:38:38'!
refreshCartProductsList
	cartProductsList updateList.
	cartProductsList setSelectionIndex: 0.! !


!TusLibrosClientWindow methodsFor: 'GUI build - catalog' stamp: 'ba 7/11/2019 01:33:01'!
buildCatalogButtonsRowWith: aCartId
	| addToCartButton secondRowLayout firstColumnLayoutOfSecondRow |

	model setCartId: aCartId.
	addToCartButton := PluggableButtonMorph model: self model stateGetter: nil  action: #sendAddToCart  label: 'Add to cart'.

	bookQuantityTextBox := TextModelMorph textProvider: self model textGetter: #getBookQuantity textSetter: #setBookQuantity:. 
	bookQuantityTextBox textMorph setProperty: #keyStroke: toValue: [ :key | bookQuantityTextBox textMorph acceptContents ] .
	bookQuantityTextBox  borderWidth: 1; borderColor: Color skyBlue.
	
	secondRowLayout := LayoutMorph newRow.
	secondRowLayout separation: 25;
	padding: #left.

	firstColumnLayoutOfSecondRow := LayoutMorph newColumn.
	firstColumnLayoutOfSecondRow separation: 5;
	padding: #left;
	addMorph: bookQuantityTextBox.

	secondRowLayout addMorph: (StringMorph contents:'Quantity:');
	separation: 25;
	padding: #left;
	addMorph: firstColumnLayoutOfSecondRow;
	addMorph: addToCartButton.

	^secondRowLayout.! !

!TusLibrosClientWindow methodsFor: 'GUI build - catalog' stamp: 'ba 7/11/2019 02:17:55'!
buildCatalogRowWith: aCartId
	| rowLayout |
	
	model setCartId: aCartId.
	
	catalogProductsList := PluggableListMorph model: self model listGetter: #getListFromCatalog indexGetter: #getCatalogBookSelectedIndex indexSetter: #setCatalogBookSelectedIndex:.
	catalogProductsList  borderColor: Color skyBlue.
	catalogProductsList  borderWidth: 1.
	
	cartProductsList := PluggableListMorph model: self model listGetter: #getListBooksFromCart indexGetter: nil indexSetter: nil.
	cartProductsList  borderColor: Color skyBlue.
	cartProductsList  borderWidth: 1.
	
	rowLayout := LayoutMorph newRow.
	rowLayout separation: 25;
	padding: #left;
	addMorph: (StringMorph contents:'Catalog:');
	addMorph: catalogProductsList;
	addMorph: (StringMorph contents:'Cart Products:');
	addMorph: cartProductsList.

	^rowLayout.! !

!TusLibrosClientWindow methodsFor: 'GUI build - catalog' stamp: 'ba 7/11/2019 01:30:27'!
buildMorphicCatalogWindow: aCartId
	
	self layoutMorph beColumn;
	separation: 15;
	padding: #left;
	addMorph: (self buildCatalogRowWith: aCartId);
	addMorph: (self buildCatalogButtonsRowWith: aCartId);
	addMorph: (self buildCheckOutButtonsRow1With: aCartId);
	addMorph: (self buildCheckOutButtonsRow2With: aCartId).! !


!TusLibrosClientWindow methodsFor: 'GUI build - checkout' stamp: 'ba 7/11/2019 01:40:44'!
buildCheckOutButtonsRow1With: aCartId
	| forthRowLayout firstColumnLayoutOfSecondRow secondColumnLayoutOfSecondRow |

	model setCartId: aCartId.

	creditCardNumberTextBox := TextModelMorph textProvider: self model textGetter: #getCCN textSetter: #setCCN:. 
	creditCardNumberTextBox textMorph setProperty: #keyStroke: toValue: [ :key | creditCardNumberTextBox textMorph acceptContents ] .
	creditCardNumberTextBox  borderWidth: 1; borderColor: Color skyBlue.
	
	creditCardExpiredDateTextBox := TextModelMorph textProvider: self model textGetter: #getCCED textSetter: #setCCED:. 
	creditCardExpiredDateTextBox textMorph setProperty: #keyStroke: toValue: [ :key | creditCardExpiredDateTextBox textMorph acceptContents ] .
	creditCardExpiredDateTextBox  borderWidth: 1; borderColor: Color skyBlue.
	
	forthRowLayout := LayoutMorph newRow.
	forthRowLayout separation: 25;
	padding: #left.

	firstColumnLayoutOfSecondRow := LayoutMorph newColumn.
	firstColumnLayoutOfSecondRow separation: 5;
	padding: #left;
	addMorph: creditCardNumberTextBox.
	
	secondColumnLayoutOfSecondRow := LayoutMorph newColumn.
	secondColumnLayoutOfSecondRow separation: 5;
	padding: #left;
	addMorph: creditCardExpiredDateTextBox.
	
	forthRowLayout addMorph: (StringMorph contents:'ccn:');
	addMorph: firstColumnLayoutOfSecondRow;
	addMorph: (StringMorph contents:'cced:');
	addMorph: secondColumnLayoutOfSecondRow.

	^forthRowLayout.! !

!TusLibrosClientWindow methodsFor: 'GUI build - checkout' stamp: 'ba 7/11/2019 01:40:55'!
buildCheckOutButtonsRow2With: aCartId
	| checkOutButton thirdRowLayout thirdColumnLayoutOfSecondRow |

	model setCartId: aCartId.
	checkOutButton := PluggableButtonMorph model: self model stateGetter: nil  action: #sendCheckOutCart  label: 'CheckOut cart'.
	
	creditCardOwnerTextBox := TextModelMorph textProvider: self model textGetter: #getCCO textSetter: #setCCO:. 
	creditCardOwnerTextBox textMorph setProperty: #keyStroke: toValue: [ :key | creditCardOwnerTextBox textMorph acceptContents ] .
	creditCardOwnerTextBox  borderWidth: 1; borderColor: Color skyBlue.
	
	thirdRowLayout := LayoutMorph newRow.
	thirdRowLayout separation: 25;
	padding: #left.
	
	thirdColumnLayoutOfSecondRow := LayoutMorph newColumn.
	thirdColumnLayoutOfSecondRow separation: 5;
	padding: #left;
	addMorph: creditCardOwnerTextBox.
	
	thirdRowLayout addMorph: (StringMorph contents:'cco:');
	addMorph: thirdColumnLayoutOfSecondRow.
	thirdRowLayout addMorph: checkOutButton.

	^thirdRowLayout.! !


!TusLibrosClientWindow methodsFor: 'GUI build - start' stamp: 'Ba 7/10/2019 02:06:05'!
buildMorphicStartWindow
		
	self layoutMorph beColumn;
	separation: 15;
	padding: #left;
	addMorph: self buildStartRow.! !

!TusLibrosClientWindow methodsFor: 'GUI build - start' stamp: 'Ba 7/10/2019 03:29:31'!
buildStartRow
	| createCartButton firstRowLayout |
	
	createCartButton := PluggableButtonMorph model: self model stateGetter: nil  action: #sendCreateCart  label: 'Create cart'.

	clientIdTextBox := TextModelMorph textProvider: self model textGetter: #clientIdText textSetter: #clientIdText:. 
	clientIdTextBox textMorph setProperty: #keyStroke: toValue: [ :key | clientIdTextBox textMorph acceptContents ] .
	clientIdTextBox  borderWidth: 1; borderColor: Color skyBlue.
	
	passwordTextBox := TextModelMorph textProvider: self model textGetter: #passwordText textSetter: #passwordText:. 
	passwordTextBox textMorph setProperty: #keyStroke: toValue: [ :key | passwordTextBox textMorph acceptContents ] .
	passwordTextBox  borderWidth: 1; borderColor: Color skyBlue.
		
	firstRowLayout := LayoutMorph newRow.
	firstRowLayout separation: 25;
	padding: #left;
	addMorph: (StringMorph contents:'Client ID:');
	addMorph: clientIdTextBox;
	addMorph: (StringMorph contents:'Password:');
	addMorph: passwordTextBox;
 	addMorph: createCartButton.
	
	^firstRowLayout.! !


!TusLibrosClientWindow methodsFor: 'GUI build - purchases' stamp: 'ba 7/11/2019 02:07:25'!
buildMorphicPurchasesWindow
		
	self layoutMorph beColumn;
	separation: 15;
	padding: #left;
	addMorph: self buildPurchasesRow.! !

!TusLibrosClientWindow methodsFor: 'GUI build - purchases' stamp: 'ba 7/11/2019 02:50:53'!
buildPurchasesRow
	| rowLayout purchasesList |
	"Falto mostrar los datos de la compra correspondientes en el TextModelMorph"
	purchasesList := TextModelMorph textProvider: self model textGetter: #getPurchasesList textSetter: nil. 
	purchasesList textMorph setProperty: #keyStroke: toValue: [ :key | creditCardNumberTextBox textMorph acceptContents ] .
	purchasesList  borderWidth: 1; borderColor: Color skyBlue.
	
	rowLayout := LayoutMorph newRow.
	rowLayout separation: 25;
	padding: #left;
	addMorph: (StringMorph contents:'Purchases:');
	addMorph: purchasesList.

	^rowLayout.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientWindow class' category: #TusLibros!
TusLibrosClientWindow class
	instanceVariableNames: ''!

!TusLibrosClientWindow class methodsFor: 'instance creation' stamp: 'Ba 7/9/2019 17:14:00'!
open
	
	^self new initializeWith: 'TusLibros Store'.! !

!TusLibrosClientWindow class methodsFor: 'instance creation' stamp: 'Ba 7/10/2019 02:13:37'!
openCatalogWith: aCartId
	
	^self new initializeCatalogWindowWith: aCartId.! !

!TusLibrosClientWindow class methodsFor: 'instance creation' stamp: 'ba 7/11/2019 02:21:15'!
openPurchasesWith: purchasesList
	
	^self new initializePurchasesWindowWith: purchasesList.! !


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
	instanceVariableNames: 'defaultCartWithOneProduct expiredCreditCard nonExpiredCreditCard defaultProduct defaultProductPrice'
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

!CashierTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:16:35'!
test03CanCheckoutANonEmptyCart

	| aCashier merchantProcessorSimulator |
		
	merchantProcessorSimulator := MerchantProcessorInterfaceSimulator whenHasToDebit: 5 from: nonExpiredCreditCard thenResponse: [5].
	
	aCashier := Cashier for: defaultCartWithOneProduct payedBy: nonExpiredCreditCard using: merchantProcessorSimulator andAClock: self.

	self assert: aCashier checkout equals: defaultProductPrice .! !

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


!CashierTest methodsFor: 'setup' stamp: 'AMS 6/22/2019 18:53:05'!
setUp

	| aCatalog |
	
	defaultProduct := 'Product 1'.
	defaultProductPrice := 5.
	
	aCatalog := Dictionary new.
	aCatalog add: defaultProduct->defaultProductPrice .
	defaultCartWithOneProduct := Cart withAProductsCatalog: aCatalog.
	defaultCartWithOneProduct add: defaultProduct.

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
	instanceVariableNames: 'clock nonExpiredCreditCard validMerchantProcessor expiredCreditCard invalidClientAuthenticator validClientAuthenticator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTest methodsFor: 'set up' stamp: 'AMS 6/22/2019 19:30:55'!
setUp

	invalidClientAuthenticator := AuthenticatorSimulator withBehavior: [self error: 'client does not exist'].
	validClientAuthenticator := AuthenticatorSimulator withBehavior: [].

	clock := ManualClock now: DateAndTime now.
	nonExpiredCreditCard := CreditCard withNumber: '1234567890123456' ownedBy: 'aPerson' expiringOn: clock current.
	validMerchantProcessor := MerchantProcessorInterfaceSimulator whenHasToDebit: 20 from: nonExpiredCreditCard thenResponse: [20].
	
	clock backTime: 60 days.
	expiredCreditCard := CreditCard withNumber: '1234567890123456' ownedBy: 'aPerson' expiringOn: clock current.
	clock advanceTime: 60 days.! !


!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:31:53'!
test01CanNotCreateCartWhenClientAuthenticationFails

	| aStore |
	
	aStore := Store withAuthenticator: invalidClientAuthenticator catalog: Dictionary new andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock.

	self should: [ aStore createCartForClient: 'a client' andPassword: 'a password' ] 
		raise: Error - MessageNotUnderstood! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:32:09'!
test02AuthenticatedClientCanCreateACart

	| aStore clientID clientPassword cartID |
	
	clientID := 'a clientID'.
	clientPassword := 'a client password'.
	
	aStore := Store withAuthenticator: validClientAuthenticator catalog: Dictionary new andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock.

	cartID := aStore createCartForClient: clientID andPassword: clientPassword.
	
	self assert: (aStore listCart: cartID) isEmpty! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:26:39'!
test03CanNotListAnInexistentCart

	| aStore |
	
	aStore := Store withAuthenticator: nil catalog: Dictionary new andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock.

	self should: [aStore listCart: 0] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Store cartDoesNotExist! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:32:32'!
test04CanNotListAnUnusedCartFor30Minutes

	| aStore clientID clientPassword cartID |
	
	clientID := 'a clientID'.
	clientPassword := 'a client password'.
	
	aStore := Store withAuthenticator: validClientAuthenticator catalog: Dictionary new andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock.

	cartID := aStore createCartForClient: clientID andPassword: clientPassword.
	clock advanceTime: 30 minutes.
	
	self should: [aStore listCart: cartID] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Store unusedCart ! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:26:39'!
test05CanNotAddAProductToAnInexistentCart

	| aStore cartID |

	aStore := Store withAuthenticator: nil catalog: Dictionary new andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock.
	cartID := 5.
	
	self should: [aStore add: 1 of: 'a book' to: cartID]
		raise: Error - MessageNotUnderstood 
		withMessageText: Store cartDoesNotExist ! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:32:50'!
test06CanNotAddAnProductThatIsNotInTheCatalog

	| aStore clientID clientPassword cartID aProduct |
	
	clientID := 'a clientID'.
	clientPassword := 'a client password'.
	
	aProduct := 'a product'.
	
	aStore := Store withAuthenticator: validClientAuthenticator catalog: Dictionary new andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock .

	cartID := aStore createCartForClient: clientID andPassword: clientPassword.
	
	self should: [aStore add: 2 of: aProduct to: cartID]
		raise: Error - MessageNotUnderstood 
		withMessageText: Cart cantAddAProductThatAreNotInTheCatalogErrorDescription.
	
	self assert: (aStore listCart: cartID) isEmpty.! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:33:05'!
test07CanAddAProductOfTheCatalogToAnExistentCart

	| aStore clientID clientPassword cartID aCatalog aProduct |
	
	clientID := 'a clientID'.
	clientPassword := 'a client password'.

	aProduct := 'a product'.
	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10.
	
	aStore := Store withAuthenticator: validClientAuthenticator catalog: aCatalog andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock .

	cartID := aStore createCartForClient: clientID andPassword: clientPassword.
	
	aStore add: 2 of: aProduct to: cartID.
	
	self assert: (aStore listCart: cartID) size equals: 2.
	self assert: ((aStore listCart: cartID) occurrencesOf: aProduct ) equals: 2.! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:33:22'!
test08CanNotAddAProductToAnUnusedCartFor30Minutes

	| aStore clientID clientPassword cartID aCatalog aProduct |
	
	clientID := 'a clientID'.
	clientPassword := 'a client password'.

	aProduct := 'a product'.
	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10.
	
	aStore := Store withAuthenticator: validClientAuthenticator catalog: aCatalog andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock .

	cartID := aStore createCartForClient: clientID andPassword: clientPassword.
	clock advanceTime: 30 minutes.
	
	self should: [aStore add: 2 of: aProduct to: cartID]
		raise: Error - MessageNotUnderstood 
		withMessageText: Store unusedCart .! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:33:30'!
test09AddingAProductResetsTheLastTimeUsed

	| aStore clientID clientPassword cartID aCatalog aProduct |
	
	clientID := 'a clientID'.
	clientPassword := 'a client password'.
	
	aProduct := 'a product'.
	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10.
	
	aStore := Store withAuthenticator: validClientAuthenticator catalog: aCatalog andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock .

	cartID := aStore createCartForClient: clientID andPassword: clientPassword.
	clock advanceTime: 29 minutes.
	
	aStore add: 2 of: aProduct to: cartID.
	
	clock advanceTime: 29 minutes.
	
	self assert: (aStore listCart: cartID) size equals: 2.
	self assert: ((aStore listCart: cartID) occurrencesOf: aProduct ) equals: 2.! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:26:39'!
test10CanNotCheckoutAnInexistentCart

	| aStore |
	
	aStore := Store withAuthenticator: nil catalog: Dictionary new andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock.

	self should: [aStore checkout: 0 payingWithCreditCardNumber: 123234567890123456 ownedBy: 'an owner' expiringOn: clock current ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Store cartDoesNotExist! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:33:50'!
test11CanNotCheckoutAnEmptyCart

	| aStore clientID clientPassword cartID |
	
	clientID := 'a clientID'.
	clientPassword := 'a client password'.
	
	aStore := Store withAuthenticator: validClientAuthenticator catalog: Dictionary new andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock.

	cartID := aStore createCartForClient: clientID andPassword: clientPassword.

	self should: [aStore checkout: cartID payingWithCreditCardNumber: nonExpiredCreditCard number ownedBy: nonExpiredCreditCard owner expiringOn: nonExpiredCreditCard expiringDate ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cashier cantCreateACashierWithAnEmptyCart ! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:34:00'!
test12CanNotCheckoutWithAnExpiredCC

	| aStore clientID clientPassword cartID aCatalog aProduct |
	
	clientID := 'a clientID'.
	clientPassword := 'a client password'.
	
	aProduct := 'a product'.
	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10.
	
	aStore := Store withAuthenticator: validClientAuthenticator catalog: aCatalog andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock .

	cartID := aStore createCartForClient: clientID andPassword: clientPassword.
	
	aStore add: 2 of: aProduct to: cartID.

	self should: [aStore checkout: cartID payingWithCreditCardNumber: expiredCreditCard number ownedBy: expiredCreditCard owner expiringOn: expiredCreditCard expiringDate ]
		raise: Error - MessageNotUnderstood 
		withMessageText: Cashier cantCreateACashierWithAnExpiredCreditCard ! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:34:11'!
test13CanNotCheckoutAnUnusedCartFor30Minutes

	| aStore clientID clientPassword cartID aCatalog aProduct |
	
	clientID := 'a clientID'.
	clientPassword := 'a client password'.
	
	aProduct := 'a product'.
	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10.
	
	aStore := Store withAuthenticator: validClientAuthenticator catalog: aCatalog andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock .

	cartID := aStore createCartForClient: clientID andPassword: clientPassword.
	aStore add: 2 of: aProduct to: cartID.
	
	clock advanceTime: 30 minutes.
	
	self should: [aStore checkout: cartID payingWithCreditCardNumber: nonExpiredCreditCard number ownedBy: nonExpiredCreditCard owner expiringOn: nonExpiredCreditCard expiringDate ]
		raise: Error - MessageNotUnderstood 
		withMessageText: Store unusedCart .! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:34:23'!
test14CanCheckoutACart

	| aStore clientID clientPassword cartID aCatalog aProduct |
	
	clientID := 'a clientID'.
	clientPassword := 'a client password'.
	
	aProduct := 'a product'.
	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10.
	
	aStore := Store withAuthenticator: validClientAuthenticator catalog: aCatalog andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock .

	cartID := aStore createCartForClient: clientID andPassword: clientPassword.
	aStore add: 2 of: aProduct to: cartID.
		
	aStore checkout: cartID payingWithCreditCardNumber: nonExpiredCreditCard number ownedBy: nonExpiredCreditCard owner expiringOn: nonExpiredCreditCard expiringDate.
		
	self assert: ((aStore listPurchasesForClient: clientID andPassword: clientPassword) size) equals: 2.
	self assert: ((aStore listPurchasesForClient: clientID andPassword: clientPassword) occurrencesOf: aProduct) equals: 2.! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:34:32'!
test15CanNotListCheckoutedCarts

	| aStore clientID clientPassword cartID aCatalog aProduct |
	
	clientID := 'a clientID'.
	clientPassword := 'a client password'.
	
	aProduct := 'a product'.
	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10.
	
	aStore := Store withAuthenticator: validClientAuthenticator catalog: aCatalog andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock .

	cartID := aStore createCartForClient: clientID andPassword: clientPassword.
	aStore add: 2 of: aProduct to: cartID.
		
	aStore checkout: cartID payingWithCreditCardNumber: nonExpiredCreditCard number ownedBy: nonExpiredCreditCard owner expiringOn: nonExpiredCreditCard expiringDate.
		
	self should: [aStore listCart: cartID]
		raise: Error - MessageNotUnderstood
		withMessageText: Store cartHasBeenCheckouted! !

!StoreTest methodsFor: 'tests' stamp: 'AMS 6/22/2019 19:36:25'!
test16CanNotListPurchasesWhenAuthenticationFails

	| aStore clientID clientPassword aCatalog aProduct |
	
	clientID := 'a clientID'.
	clientPassword := 'a client password'.
	
	aProduct := 'a product'.
	aCatalog := Dictionary new.
	aCatalog add: aProduct -> 10.
	
	aStore := Store withAuthenticator: invalidClientAuthenticator catalog: aCatalog andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock .
		
	self should: [aStore listPurchasesForClient: clientID andPassword: clientPassword]
		raise: Error - MessageNotUnderstood ! !


!classDefinition: #AuthenticatorSimulator category: #TusLibros!
Object subclass: #AuthenticatorSimulator
	instanceVariableNames: 'authenticateBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!AuthenticatorSimulator methodsFor: 'initialization' stamp: 'AMS 6/22/2019 19:24:19'!
initializeWithBehavior: anAuthenticateBehavior

	authenticateBehavior := anAuthenticateBehavior ! !


!AuthenticatorSimulator methodsFor: 'authenticator protocol' stamp: 'AMS 6/22/2019 19:23:51'!
authenticate: clientID withPassword: clientPassword

	^authenticateBehavior value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AuthenticatorSimulator class' category: #TusLibros!
AuthenticatorSimulator class
	instanceVariableNames: ''!

!AuthenticatorSimulator class methodsFor: 'instance creation' stamp: 'AMS 6/22/2019 19:24:46'!
withBehavior: authenticateBehavior

	^self new initializeWithBehavior: authenticateBehavior ! !


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


!Cashier methodsFor: 'checkout' stamp: 'AMS 6/22/2019 19:16:13'!
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


!classDefinition: #Clock category: #TusLibros!
Object subclass: #Clock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Clock methodsFor: 'time' stamp: 'AMS 6/17/2019 19:24:29'!
current

	self subclassResponsibility ! !

!Clock methodsFor: 'time' stamp: 'AMS 6/17/2019 16:39:15'!
now

	self subclassResponsibility ! !


!classDefinition: #ManualClock category: #TusLibros!
Clock subclass: #ManualClock
	instanceVariableNames: 'now'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ManualClock methodsFor: 'initialization' stamp: 'AMS 6/17/2019 16:40:14'!
initializeNow: aTime

	now := aTime ! !


!ManualClock methodsFor: 'time alter' stamp: 'AMS 6/17/2019 16:46:31'!
advanceTime: aDuration

	now := now + aDuration ! !

!ManualClock methodsFor: 'time alter' stamp: 'AMS 6/17/2019 16:46:35'!
backTime: aDuration

	now := now - aDuration ! !


!ManualClock methodsFor: 'time' stamp: 'AMS 6/17/2019 20:16:17'!
current

	^GregorianMonthOfYear year: (GregorianYear number: now yearNumber) month: (GregorianMonth named: now month monthName)! !

!ManualClock methodsFor: 'time' stamp: 'AMS 6/17/2019 17:18:31'!
now

	^now! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ManualClock class' category: #TusLibros!
ManualClock class
	instanceVariableNames: ''!

!ManualClock class methodsFor: 'instance creation' stamp: 'AMS 6/17/2019 16:39:49'!
now: aTime

	^self new initializeNow: aTime! !


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


!MerchantProcessorInterfaceSimulator methodsFor: 'debiting' stamp: 'BA 7/7/2019 20:20:48'!
debit: anAmount from: aCreditCard

	| simulatedResponse |
	
	simulatedResponse := simulatedResponses at: (self generateRequestKeyFor: anAmount and: aCreditCard) ifAbsent: [^self class simulateInvalidCardException].
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
	instanceVariableNames: 'clientAuthenticator carts catalog nextCartID lastTimeUsed clock merchantProcessor checkoutedCarts clientByCartID purchasedItemsByClient'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Store methodsFor: 'authentication' stamp: 'AMS 6/22/2019 19:29:22'!
authenticateClient: clientID withPassword: clientPassword

	clientAuthenticator authenticate: clientID withPassword: clientPassword ! !


!Store methodsFor: 'id generator - private' stamp: 'AMS 6/12/2019 23:25:09'!
generateCartID

	| id |
	
	id := nextCartID.
	nextCartID := nextCartID + 1.
	
	^id! !


!Store methodsFor: 'carts' stamp: 'AMS 6/12/2019 23:28:25'!
createCart

	^Cart withAProductsCatalog: catalog.! !

!Store methodsFor: 'carts' stamp: 'AMS 6/22/2019 18:22:42'!
removeCart: aCartID

	carts removeKey: aCartID.
	lastTimeUsed removeKey: aCartID.
	clientByCartID removeKey: aCartID.! !

!Store methodsFor: 'carts' stamp: 'AMS 6/17/2019 17:58:08'!
resetLastTimeUsedFor: aCartID.
	
	lastTimeUsed at: aCartID put: clock now.! !

!Store methodsFor: 'carts' stamp: 'AMS 6/22/2019 18:25:40'!
saveCart: aCart for: clientID
	
	| cartID |

	cartID := self generateCartID.
	carts at: cartID put: aCart.
	self resetLastTimeUsedFor: cartID.
	clientByCartID at: cartID put: clientID.
	
	^cartID! !


!Store methodsFor: 'initialization' stamp: 'AMS 6/22/2019 18:36:52'!
initialize
	
	carts := Dictionary new.
	lastTimeUsed := Dictionary new.
	nextCartID := 0.
	purchasedItemsByClient := Dictionary new.
	checkoutedCarts := OrderedCollection new.
 	clientByCartID := Dictionary new.! !

!Store methodsFor: 'initialization' stamp: 'AMS 6/22/2019 19:28:30'!
initializeWithAuthenticator: anAuthenticator catalog: aCatalog andMerchantProcessor: aMerchantProcessor measuringTimeWith: aClock 

	self initialize.
	clientAuthenticator := anAuthenticator.
	catalog := aCatalog.
	merchantProcessor := aMerchantProcessor.
	clock := aClock.
! !


!Store methodsFor: 'assertions' stamp: 'AMS 6/22/2019 18:20:20'!
assert: cartID hasBeenUsedInTheLast: aLimitDuration

	| cartLastTimeUsed |
	
	cartLastTimeUsed := lastTimeUsed at: cartID ifAbsent: [^self error: self class cartDoesNotExist ].
	
	(clock now - cartLastTimeUsed) < aLimitDuration ifFalse: [
		self removeCart: cartID.
		^self error: self class unusedCart ]! !

!Store methodsFor: 'assertions' stamp: 'AMS 6/22/2019 19:22:55'!
assertIsValidCart: cartID
	
	| cart |
	(checkoutedCarts includes: cartID) ifTrue: [self error: self class cartHasBeenCheckouted ].
	cart := carts at: cartID ifAbsent: [self error: self class cartDoesNotExist].
	self assert: cartID hasBeenUsedInTheLast: 30 minutes.
	
	^cart! !


!Store methodsFor: 'checkouting' stamp: 'AMS 6/22/2019 19:04:16'!
createCashierFor: aCart payedWithCreditCardNumber: ccNumber ownedBy: ccOwner expiringOn: ccExpiringDate

	| aCreditCard |
	
	aCreditCard := CreditCard withNumber: ccNumber ownedBy: ccOwner expiringOn: ccExpiringDate.

	^Cashier for: aCart payedBy: aCreditCard using: merchantProcessor andAClock: clock.! !

!Store methodsFor: 'checkouting' stamp: 'AMS 6/22/2019 19:17:43'!
saveSaleOf: aCartID

	| currentPurchasedItemsByClient theClientID theCart |
	
	theClientID := clientByCartID at: aCartID.
	theCart := carts at: aCartID.
	
	currentPurchasedItemsByClient := purchasedItemsByClient at: theClientID ifAbsent: [Bag new] .
	currentPurchasedItemsByClient addAll: theCart products.
	
	purchasedItemsByClient at: theClientID put: currentPurchasedItemsByClient.! !


!Store methodsFor: 'service interface' stamp: 'AMS 6/17/2019 17:58:24'!
add: aQuantity of: aProduct to: aCartID

	| aCart |

	aCart := self assertIsValidCart: aCartID .
	
	aCart add: aQuantity of: aProduct.
	
	self resetLastTimeUsedFor: aCartID! !

!Store methodsFor: 'service interface' stamp: 'BA 7/7/2019 21:17:24'!
checkout: aCartID payingWithCreditCardNumber: ccNumber ownedBy: ccOwner expiringOn: ccExpiringDate 
	
	| aCart aCashier totalDebited |
	
	aCart := self assertIsValidCart: aCartID.
		
	aCashier := self createCashierFor: aCart payedWithCreditCardNumber: ccNumber ownedBy: ccOwner expiringOn: ccExpiringDate.
	totalDebited := aCashier checkout.
	
	self saveSaleOf: aCartID.
	carts removeKey: aCartID.
	checkoutedCarts add: aCartID.
	
	^totalDebited! !

!Store methodsFor: 'service interface' stamp: 'AMS 6/17/2019 16:24:55'!
createCartForClient: clientID andPassword: clientPassword

	| aCart cartID |

	self authenticateClient: clientID withPassword: clientPassword.
	
	aCart := self createCart .
	cartID := self saveCart: aCart for: clientID .

	^cartID! !

!Store methodsFor: 'service interface' stamp: 'AMS 6/17/2019 20:19:56'!
listCart: cartID
	
	| aCart |
	
	aCart := self assertIsValidCart: cartID.
	self resetLastTimeUsedFor: cartID.
	
	^aCart products! !

!Store methodsFor: 'service interface' stamp: 'AMS 6/22/2019 18:36:15'!
listPurchasesForClient: clientID andPassword: clientPassword

	| aCart cartID |

	self authenticateClient: clientID withPassword: clientPassword.

	^purchasedItemsByClient at: clientID! !


!Store methodsFor: 'accesing' stamp: 'Ba 7/10/2019 02:23:37'!
catalog
	"esta funcion existe para obtener el catalogo a partir de un servicio del TusLibrosServerController"
	^catalog! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Store class' category: #TusLibros!
Store class
	instanceVariableNames: ''!

!Store class methodsFor: 'instance creation' stamp: 'AMS 6/22/2019 19:26:39'!
withAuthenticator: anAuthenticator catalog: aCatalog andMerchantProcessor: aMerchantProcessor measuringTimeWith: aClock 

	^self new initializeWithAuthenticator: anAuthenticator catalog: aCatalog andMerchantProcessor: aMerchantProcessor measuringTimeWith: aClock! !


!Store class methodsFor: 'exception messages' stamp: 'AMS 6/12/2019 23:35:16'!
cartDoesNotExist

	^'cart does not exist'! !

!Store class methodsFor: 'exception messages' stamp: 'AMS 6/22/2019 19:21:05'!
cartHasBeenCheckouted

	^'cart has been checkouted'! !

!Store class methodsFor: 'exception messages' stamp: 'AMS 6/22/2019 18:19:53'!
unusedCart

	^'cart has been unused for more than 30 minutes'! !


!classDefinition: #TusLibrosClientWindowModel category: #TusLibros!
Object subclass: #TusLibrosClientWindowModel
	instanceVariableNames: 'webClient clientId password purchasesList catalog cartId catalogBookSelectedIndex bookQuantity booksByCartId ccn cced cco'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosClientWindowModel methodsFor: 'initialization' stamp: 'ba 7/11/2019 02:44:22'!
initialize

	clientId := ''.
	password :=''.
	catalog := Dictionary new.
	catalogBookSelectedIndex := 0.
	bookQuantity := ''.
	ccn := ''.
	cco := ''.
	cced := ''.
	purchasesList := ''.
	booksByCartId := Dictionary new.
	webClient := TusLibrosWebClient new.! !


!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'Ba 7/9/2019 18:25:55'!
clientIdText
	
	^clientId.! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'Ba 7/9/2019 18:26:31'!
clientIdText: clientIdText
	
	clientId := clientIdText.
	^true! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ba 7/10/2019 22:32:02'!
getBookQuantity
	
	^bookQuantity.! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ba 7/11/2019 01:44:47'!
getCCED

	^cced! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ba 7/11/2019 01:44:06'!
getCCN

	^ccn! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ba 7/11/2019 01:44:12'!
getCCO

	^cco! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ba 7/10/2019 22:24:13'!
getCatalogBookSelectedIndex
	
	^catalogBookSelectedIndex! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ba 7/11/2019 02:30:36'!
getPurchasesList
	
	^purchasesList.! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'Ba 7/9/2019 18:28:27'!
passwordText
	
	^password.! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'Ba 7/9/2019 18:28:46'!
passwordText: passwordText
	
	password := passwordText.
	^true! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ba 7/10/2019 22:31:51'!
setBookQuantity: aBookQuantity
	
	bookQuantity := aBookQuantity.! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ba 7/11/2019 01:44:36'!
setCCED: aCCED

	cced := aCCED! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ba 7/11/2019 01:43:56'!
setCCN: aCCN

	ccn := aCCN! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ba 7/11/2019 01:44:25'!
setCCO: aCCO

	cco := aCCO! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ba 7/10/2019 22:43:05'!
setCartId: aCartId

	cartId := aCartId! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ba 7/10/2019 22:24:22'!
setCatalogBookSelectedIndex: anIndex
	
	catalogBookSelectedIndex := anIndex.! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'ba 7/11/2019 02:27:25'!
setPurchasesList: aPurchasesList

	purchasesList := aPurchasesList! !


!TusLibrosClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ba 7/10/2019 23:55:14'!
getListBooksFromCart

	| books |
	booksByCartId at: cartId ifAbsent: [
		booksByCartId at: cartId put: Bag new.
		].
	books := booksByCartId at: cartId.

	^books as: OrderedCollection.! !

!TusLibrosClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'Ba 7/10/2019 03:33:09'!
getListFromCatalog

	| aCatalog |
	
	aCatalog := webClient sendGetCatalogRequest.
	catalog := aCatalog.

	^catalog keys! !

!TusLibrosClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ba 7/11/2019 00:45:52'!
sendAddToCart
	
	| aDictionaryWithParams books aBookToAdd |

	aDictionaryWithParams := Dictionary new.
	aBookToAdd := ((catalog keys) at: catalogBookSelectedIndex).
	aDictionaryWithParams add: 'cartId'->cartId; add: 'bookIsbn'->aBookToAdd; add: 'bookQuantity'->bookQuantity.
	webClient sendAddToCartRequest: aDictionaryWithParams.

	booksByCartId at: cartId ifAbsent: [
			booksByCartId at: cartId put: Bag new.
		].
	books := booksByCartId at: cartId.

	books add: aBookToAdd withOccurrences: bookQuantity asNumber.
	
	self triggerEvent: #newSubstringsArrived with: self.
	
	
	! !

!TusLibrosClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ba 7/11/2019 01:55:05'!
sendCheckOutCart
	
	| aDictionaryWithParams |

	aDictionaryWithParams := Dictionary new.

	aDictionaryWithParams add: 'cartId'->cartId; add: 'ccn'->ccn; add: 'cced'->cced; add: 'cco'->cco.
	webClient sendCheckOutCartRequest: aDictionaryWithParams.

	
	
	! !

!TusLibrosClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'ba 7/11/2019 02:41:16'!
sendCreateCart
	
	| aDictionary |

	aDictionary := Dictionary new.
	aDictionary add: 'clientId'->clientId;add: 'password'->password.
	webClient sendCreateCartRequest: aDictionary.

	! !


!classDefinition: #TusLibrosServerController category: #TusLibros!
Object subclass: #TusLibrosServerController
	instanceVariableNames: 'webServer port store'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosServerController methodsFor: 'initialization' stamp: 'ba 7/11/2019 02:51:52'!
initialize

	store := self getTestingStore.

	webServer := WebServer new listenOn: self port.

	webServer addService: '/createCart' action:[:request | self createCartAction: request].

	webServer addService: '/addToCart' action:[:request | self addToCartAction: request].

	webServer addService: '/listCart' action:[:request | self listCartAction: request].

	webServer addService: '/checkOutCart' action:[:request | self checkOutCartAction: request].

	webServer addService: '/listPurchases' action:[:request | self listPurchasesAction: request].
	
	webServer addService: '/getCatalog' action:[:request | self getCatalogAction: request].

	
! !

!TusLibrosServerController methodsFor: 'initialization' stamp: 'BA 7/7/2019 04:35:31'!
port
	"Use a random port to minimise chances of concurrently running test suites clashing."
	"^ port
		ifNil: [port := (10000 to: 50000) atRandom]"
	
	^port ifNil: [port:=8080].! !


!TusLibrosServerController methodsFor: 'enabling services' stamp: 'BA 7/7/2019 04:35:58'!
destroy
	
	webServer ifNotNil:[webServer destroy].! !

!TusLibrosServerController methodsFor: 'enabling services' stamp: 'BA 7/7/2019 04:36:10'!
startListening
	
	webServer startListener ! !

!TusLibrosServerController methodsFor: 'enabling services' stamp: 'BA 7/7/2019 04:36:33'!
stopListening
	
	webServer stopListener! !


!TusLibrosServerController methodsFor: 'private' stamp: 'BA 7/7/2019 06:40:48'!
booksListToString: listOfBooks
	| booksBag booksSet listOfBooksString |
	booksBag := listOfBooks asBag.
	booksSet := listOfBooks asSet.
	listOfBooksString := ''.
	
	booksSet do: [:aBook | 
			listOfBooksString := listOfBooksString , '|', aBook, '|', (booksBag occurrencesOf: aBook) asString.
		].
	
	^listOfBooksString! !

!TusLibrosServerController methodsFor: 'private' stamp: 'ba 7/11/2019 02:52:27'!
getTestingStore
	"<======== SETUP PARA PRUEBAS =========>"

	| clock nonExpiredCreditCard validClientAuthenticator validMerchantProcessor aProduct1 aProduct2 aProduct3 aCatalog monthOfYear |

	validClientAuthenticator := AuthenticatorSimulator withBehavior: [].

	clock := ManualClock now: DateAndTime now.
	monthOfYear := GregorianMonthOfYear year: (GregorianYear number: 2020) month: (GregorianMonth named: 'June').
	nonExpiredCreditCard := CreditCard withNumber: '1234567890123456' ownedBy: 'aPerson' expiringOn: monthOfYear.
	validMerchantProcessor := MerchantProcessorInterfaceSimulator whenHasToDebit: 20 from: nonExpiredCreditCard thenResponse: [20].
	
	aProduct1 := 'aproduct1'.
	aProduct2 := 'aproduct2'.
	aProduct3 := 'aproduct3'.
	aCatalog := Dictionary new.
	aCatalog add: aProduct1 -> 10.
	aCatalog add: aProduct2 -> 5.
	aCatalog add: aProduct3 -> 1.
	
	^Store withAuthenticator: validClientAuthenticator catalog: aCatalog andMerchantProcessor: validMerchantProcessor measuringTimeWith: clock.! !

!TusLibrosServerController methodsFor: 'private' stamp: 'BA 7/7/2019 21:20:49'!
purchasesListToString: listOfBooks
	| booksBag booksSet listOfBooksString totalAmount |
	booksBag := listOfBooks asBag.
	booksSet := listOfBooks asSet.
	listOfBooksString := ''.
	totalAmount := 0.
	
	booksSet do: [:aBook | 
			totalAmount := totalAmount + (booksBag occurrencesOf: aBook).
			listOfBooksString := listOfBooksString , '|', aBook, '|', (booksBag occurrencesOf: aBook) asString.
		].
	
	^listOfBooksString, '|', totalAmount asString.! !


!TusLibrosServerController methodsFor: 'request actions' stamp: 'ba 7/11/2019 00:11:05'!
addToCartAction: request
		
		[| cartId bookIsbn bookQuantity |
			cartId := (request fields at:'cartId') asNumber.
			bookIsbn := (request fields at:'bookIsbn') asString.
			bookQuantity := (request fields at:'bookQuantity') asNumber.	
			store add: bookQuantity of: bookIsbn to: cartId.
			request send200Response: ('0|OK').
		 ]
		on: Error 
		do: [ :anError |
			request send404Response: ('1|', anError messageText) ].! !

!TusLibrosServerController methodsFor: 'request actions' stamp: 'BA 7/7/2019 22:00:37'!
checkOutCartAction: request
		
		[| cartId ccn cced cco month year expirationMonthOfYear totalDebited |	
			cartId := (request fields at:'cartId') asNumber.
			ccn := (request fields at:'ccn') asString.
			cced := (request fields at:'cced') asString.
			cco := (request fields at:'cco') asString.
			month := GregorianMonth numbered: ((cced at: 1) asString, (cced at: 2) asString) asNumber.
			year := GregorianYear number: ((cced at: 3) asString, (cced at: 4) asString, (cced at: 5) asString, (cced at: 6) asString) asNumber.
			expirationMonthOfYear := GregorianMonthOfYear year: year month: month.
			totalDebited := (store checkout: cartId payingWithCreditCardNumber: ccn ownedBy: cco expiringOn: expirationMonthOfYear) asString.
			request send200Response: ('0|', totalDebited).
		 ]
		on: Error 
		do: [ :anError |
			request send404Response: ('1|', anError messageText) ].! !

!TusLibrosServerController methodsFor: 'request actions' stamp: 'BA 7/7/2019 22:12:33'!
createCartAction: request
		
		[ | clientId clientPassword cartId substrings |
			clientId := (request fields at:'clientId') asNumber.
			clientPassword := (request fields at: 'password') asString.
			cartId := store createCartForClient: clientId andPassword: clientPassword.
			substrings :='0|', cartId asString.	
			request send200Response: (substrings).
		 ]
		on: Error 
		do: [ :anError |
			request send404Response: ('1|', anError messageText) ].! !

!TusLibrosServerController methodsFor: 'request actions' stamp: 'Ba 7/10/2019 03:24:33'!
getCatalogAction: request
		
		[| catalog catalogJsonEncode |	
			catalog := store catalog.
			catalogJsonEncode := WebUtils jsonEncode: catalog.
			request send200Response: (catalogJsonEncode).
		 ]
		on: Error 
		do: [ :anError |
			request send404Response: ('1|', anError messageText) ].! !

!TusLibrosServerController methodsFor: 'request actions' stamp: 'BA 7/7/2019 21:54:11'!
listCartAction: request
		
		[| cartId books listCartString |	
			cartId := (request fields at:'cartId') asNumber.
			books := store listCart: cartId.
			listCartString := self booksListToString: books.
			request send200Response: ('0', listCartString).
		 ]
		on: Error 
		do: [ :anError |
			request send404Response: ('1|', anError messageText) ].! !

!TusLibrosServerController methodsFor: 'request actions' stamp: 'BA 7/7/2019 22:05:43'!
listPurchasesAction: request
		
		[| clientId passwordClient listPurchasesString listPurchases |	
			clientId := (request fields at:'clientId') asNumber.
			passwordClient := (request fields at:'password') asString.
			listPurchases := store listPurchasesForClient: clientId andPassword: passwordClient.
			listPurchasesString := self purchasesListToString: listPurchases.
			request send200Response: ('0', listPurchasesString).
		 ]
		on: Error 
		do: [ :anError |
			request send404Response: ('1|', anError messageText) ].! !


!classDefinition: #TusLibrosWebClient category: #TusLibros!
Object subclass: #TusLibrosWebClient
	instanceVariableNames: 'port'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosWebClient methodsFor: 'sending requests' stamp: 'ba 7/11/2019 00:13:17'!
sendAddToCartRequest: aDictionaryWithCartIdABookAndAQuantity

	| resp |

	resp:= WebClient htmlSubmit: (self url,'/addToCart') fields: aDictionaryWithCartIdABookAndAQuantity.

	resp isSuccess 
		ifTrue:[] 
		ifFalse:[^self error: resp content].! !

!TusLibrosWebClient methodsFor: 'sending requests' stamp: 'ba 7/11/2019 02:42:19'!
sendCheckOutCartRequest: aDictionaryWithParams

	| resp |

	resp:= WebClient htmlSubmit: (self url,'/checkOutCart') fields: aDictionaryWithParams.

	resp isSuccess 
		ifTrue:[| purchasesList |
			purchasesList := resp content copyFrom: 3 to: (resp content) size.
			^TusLibrosClientWindow openPurchasesWith: purchasesList.]
		ifFalse:[^self error: resp content].! !

!TusLibrosWebClient methodsFor: 'sending requests' stamp: 'ba 7/11/2019 02:02:31'!
sendCreateCartRequest: aDictionaryWithClientIdandPassword

	| resp |
	
	resp:= WebClient htmlSubmit: (self url,'/createCart') fields: aDictionaryWithClientIdandPassword.
	
	resp isSuccess 
		ifTrue:[| cartId |
			cartId := resp content copyFrom: 3 to: (resp content) size.
			^TusLibrosClientWindow openCatalogWith: (cartId).] 
		ifFalse:[^self error: resp content].! !

!TusLibrosWebClient methodsFor: 'sending requests' stamp: 'Ba 7/10/2019 03:31:48'!
sendGetCatalogRequest

	| resp |
	
	resp:= WebClient htmlSubmit: (self url,'/getCatalog') fields: (Dictionary new).
	
	resp isSuccess 
		ifTrue:[^WebUtils jsonDecode: ((resp content) readStream).]
		ifFalse:[^self error: resp content].! !


!TusLibrosWebClient methodsFor: 'initialization' stamp: 'NR 6/25/2019 22:15:16'!
port
	
	^port ifNil: [port:=8080].! !

!TusLibrosWebClient methodsFor: 'initialization' stamp: 'NR 6/24/2019 06:52:37'!
url
	
	^'http://localhost:', self port asString! !
