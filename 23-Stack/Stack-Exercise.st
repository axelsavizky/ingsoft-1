!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'AS 4/18/2019 23:25:08'!
isEmpty

	^top isEmpty! !


!OOStack methodsFor: 'initialization' stamp: 'AS 4/18/2019 23:24:55'!
initialize

	"Inicializamos el stack con un elemento vacio. Este elemento va a pertenecer siempre al stack"
	top := StackBaseElement new! !


!OOStack methodsFor: 'adding' stamp: 'AS 4/18/2019 23:30:13'!
push: anElement 
	
	top := StackTopElement new initializeWith: anElement over: top! !


!OOStack methodsFor: 'accessing' stamp: 'AS 4/18/2019 23:29:29'!
size

	^top deepSize! !

!OOStack methodsFor: 'accessing' stamp: 'AS 4/18/2019 23:29:17'!
top

	^top elementValue ! !


!OOStack methodsFor: 'removing' stamp: 'AS 4/18/2019 23:28:23'!
pop
	
	| currentTop|
	
	currentTop := top elementValue. 
	top := top previous.
	
	^currentTop! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'AS 4/20/2019 16:14:04'!
initializeWith: aStack

	stack := aStack! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AS 4/20/2019 17:04:49'!
copyElementsIntoACollectionFrom: aStack

	| elements |
	
	elements := self getTheElementsFrom: aStack.
	self restore: elements to: aStack.
	
	^elements! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AS 4/20/2019 17:05:05'!
getTheElementsFrom: aStack

	| elements |

	elements := OrderedCollection new.
	
	aStack isEmpty whileFalse: [ | elementFromStack |
		elementFromStack := stack pop.
		elements addFirst: elementFromStack].
	
	^elements! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AS 4/20/2019 17:04:02'!
restore: elements to: aStack

	elements do: [:element | aStack push: element].! !


!SentenceFinderByPrefix methodsFor: 'finding' stamp: 'AS 4/20/2019 16:59:52'!
find: aPrefix
	
	| elementsFromStack |

	"El prefijo no puede ser vacio"
	aPrefix isEmpty ifTrue: [^self error: self prefixEmptyErrorDescription ].
	
	"El prefijo no puede tener espacios"
	(aPrefix select: [ :char | char = $ ]) isEmpty ifFalse: [^self error: self prefixHasSpaceErrorDescription ].
	
	elementsFromStack := self copyElementsIntoACollectionFrom: stack.
	
	^elementsFromStack select: [:elementFromStack | elementFromStack beginsWith: aPrefix] asBag! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'AS 4/20/2019 16:21:16'!
prefixEmptyErrorDescription

	^'Prefix is empty'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'AS 4/20/2019 16:21:49'!
prefixHasSpaceErrorDescription

	^'Prefix has at least one space'! !


!classDefinition: #StackElement category: #'Stack-Exercise'!
Object subclass: #StackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'accessing' stamp: 'AS 4/18/2019 23:22:16'!
deepSize

	self subclassResponsibility ! !

!StackElement methodsFor: 'accessing' stamp: 'AS 4/17/2019 01:36:07'!
elementValue

	self subclassResponsibility ! !


!StackElement methodsFor: 'testing' stamp: 'AS 4/17/2019 01:31:15'!
isEmpty

	self subclassResponsibility ! !


!classDefinition: #StackBaseElement category: #'Stack-Exercise'!
StackElement subclass: #StackBaseElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBaseElement methodsFor: 'testing' stamp: 'AS 4/18/2019 23:23:27'!
isEmpty

	^true! !


!StackBaseElement methodsFor: 'accessing' stamp: 'AS 4/18/2019 23:22:28'!
deepSize

	^0! !

!StackBaseElement methodsFor: 'accessing' stamp: 'AS 4/18/2019 23:21:13'!
elementValue

	self error: OOStack stackEmptyErrorDescription ! !


!classDefinition: #StackTopElement category: #'Stack-Exercise'!
StackElement subclass: #StackTopElement
	instanceVariableNames: 'value previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackTopElement methodsFor: 'accessing' stamp: 'AS 4/18/2019 23:23:06'!
deepSize

	^1 + previous deepSize! !

!StackTopElement methodsFor: 'accessing' stamp: 'AS 4/17/2019 01:19:46'!
elementValue

	"Usamos elementValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Axel (copiado de Hernan)"
	^value! !

!StackTopElement methodsFor: 'accessing' stamp: 'AS 4/18/2019 23:24:17'!
previous

	^previous! !


!StackTopElement methodsFor: 'testing' stamp: 'AS 4/17/2019 01:32:14'!
isEmpty

	^false! !


!StackTopElement methodsFor: 'initialization' stamp: 'AS 4/18/2019 23:30:39'!
initializeWith: aValue over: aStackTopElement

	previous := aStackTopElement.
	value := aValue! !
