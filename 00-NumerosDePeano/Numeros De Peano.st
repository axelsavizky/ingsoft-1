!classDefinition: #I category: #'Numeros De Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros De Peano'!
I class
	instanceVariableNames: 'next'!

!I class methodsFor: 'as yet unclassified' stamp: 'AS 3/28/2019 18:33:53'!
* unNumeroDePeano
	^unNumeroDePeano! !

!I class methodsFor: 'as yet unclassified' stamp: 'AS 3/28/2019 18:16:40'!
+ unNumeroDePeano
	^unNumeroDePeano next! !

!I class methodsFor: 'as yet unclassified' stamp: 'dhn 10/6/2018 14:17:04'!
ded for long term storage should not contain ^
"
| x y z fac |
x _ [ y _ 1. z _ 2. ]. x value.					"simple block usage"
x _ [ :argOne :argTwo |   argOne, '' and '' , argTwo.].     "set up block with argument passing"
Transcript show: (x value: ''First'' value: ''Second''); newLine.  "use block with argument passing"
x _ [:e | | v | v _ 1. e + v] value: 2.		"localvar in a block"
fac _ [ :n | n > 1 ifTrue:  [n * (fac value: n-1)] ifFalse: [1]].  "closure on block variable"
fac value: 5.											"closure variable scoped to its block"

'! !

!I class methodsFor: 'as yet unclassified' stamp: 'dhn 10/6/2018 14:17:04'!
k with argument passing"
Transcript show: (x value: ''First'' value: ''Second''); newLine.  "use block with argument passing"
x _ [:e | | v | v _ 1. e + v] value: 2.		"localvar in a block"
fac _ [ :n | n > 1 ifTrue:  [n * (fac value: n-1)] ifFalse: [1]].  "closure on block variable"
fac value: 5.											"closure variable scoped to its block"

'! !

!I class methodsFor: 'as yet unclassified' stamp: 'dhn 10/6/2018 14:17:04'!
ac value: n-1)] ifFalse: [1]].  "closure on block variable"
fac value: 5.											"closure variable scoped to its block"

'! !

!I class methodsFor: 'as yet unclassified'!
14:19:28'! !

!I class methodsFor: 'as yet unclassified' stamp: 'dhn 10/6/2018 14:19:28'!
"not equals"
b _ (x == y).							"identical"
b _ (x ~~ y).							"not identical"
b _ (x > y).							"greater than"
b _ (x < y).							"less than"
b _ (x >= y).							"greater than or equal"
b _ (x <= y).							"less than or equal"
b _ b not.								"boolean not"
b _ (x < 5) & (y > 1).				"boolean and"
b _ (x < 5) | (y > 1).				"boolean or"
b _ (x < 5) and: [y > 1].			"boolean and (short-circuit)"
b _ (x < 5) or: [y > 1].			"boolean or (short-circuit)"
b _ (x < 5) eqv: (y > 1).			"test if both true or both false"
b _ (x < 5) xor: (y > 1).			"test if one true and other false"
b _ 5 between: 3 and: 12.			"between (inclusive)"
b _ 123 isKindOf: Number.			"test if object is class or subclass of"
b _ 123 isMemberOf: SmallInteger.	"test if object is type of class"
b _ 123 respondsTo: #sqrt.			"test if object responds to message"
b _ x isNil.							"test if object is nil"
b _ x isZero.							"test if number is zero"
b _ x positive.						"test if number is positive"
b _ x strictlyPositive.				"test if number is greater than zero"
b _ x negative.						"test if number is negative"
b _ x even.								"test if number is even"
b _ x odd.								"test if number is odd"
b _ x isLiteral.						"test if literal constant"
b _ x isInteger.						"test if object is integer"
b _ x isFloat.							"test if object is float"
b _ x isNumber.						"test if object is number"
b _ x isSymbol.						"test if object is a Symbol"
b _ $A isUppercase.					"test if upper case character"
b _ $A isLowercase.					"test if lower case character"

'! !

!I class methodsFor: 'as yet unclassified' stamp: 'dhn 10/6/2018 14:04:52'!
4.								"allocate an array with specified size"
x													"set array elements"
   at: 1 put: 5;
   at: 2 put: 4;
   at: 3 put: 3;
   at: 4 put: 7;
   yourself.									"without this, x will be 7 (the last element)"

b _ x isEmpty.									"test if array is empty"
y _ x size.										"array size"
y _ x at: 4.									"get array element at index"
b _ x includes: 3.							"test if element is in array"
y _ x copyFrom: 2 to: 4.					"subarray"
y _ x indexOf: 3 ifAbsent: [0].			"first position of element within array"
y _ x occurrencesOf: 3.						"number of times object in collection"
x do: [:a | Transcript show: a printString; newLine].  "iterate over the array"
b _ x allSatisfy: [:a | (a >= 1) & (a <= 4)].	"test if all elements meet condition"
y _ x select: [:a | a > 2].				"return collection of elements that pass test"
y _ x reject: [:a | a < 2].				"return collection of elements that fail test"
y _ x collect: [:a | a + a].				"transform each element for new collection"
y _ x detect: [:a | a > 3] ifNone: [].	"return first element that passes test"
y _ x findFirst: [:a | a < 3].			"find position of first element that passes test"
sum _ 0. x do: [:a | sum _ sum + a]. sum.	"sum array elements"
sum _ 0. 1 to: (x size) do: [:a | sum _ sum + (x at: a)].  "sum array elements"
sum _ x inject: 0 into: [:a :c | a + c].	"sum array elements"
max _ x inject: 0 into: [:a :c | (a > c)	"find max element in array"
   ifTrue: [a]
   ifFalse: [c]].
y _ x shuffled.								"randomly shuffle collection"
y _ x asArray.									"convert to array"
y _ x asByteArray.							"convert to byte array"
y _ x asWordArray.							"convert to word array"
y _ x asOrderedCollection.					"convert to ordered collection"
y _ x asSortedCollection.					"convert to sorted collection"
y _ x asBag.									"convert to bag collection"
y _ x asSet.									"convert to set collection"

'! !

!I class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:16:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := II.! !

!I class methodsFor: 'as yet unclassified' stamp: 'AS 3/28/2019 18:07:44'!
next

	next ifNil: [
		next _ self cloneNamed: (self name, 'I').
		next previous: self
	].
	^next
	! !


!classDefinition: #II category: #'Numeros De Peano'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros De Peano'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:08'!
* arg1
	^self previous * arg1 + arg1! !

!II class methodsFor: 'as yet unclassified' stamp: 'AS 3/28/2019 18:10:01'!
+ unNumeroDePeano
	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:15:44'!
- arg1
	|sustraendo result|
	sustraendo := arg1.
	result := self.
	[sustraendo > I] whileTrue: [ 
		 result _ result previous. 
		sustraendo _ sustraendo previous
		].
	^result previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'dhn 10/6/2018 16:31:59'!
at: 'Blocks' put: #block;
	at: 'Booleans' put: #boolean;
	at: 'Canvas' put: #canvas;
	at: 'Character' put: #character;
	at: 'Coding' put: #coding;
	at: 'Constants' put: #constants;
	at: 'Colors' put: #colors;
	at: 'Conditional Statements' put: #conditionalStatement;
	at: 'Conversion' put: #conversion;
	at: 'Date' put: #date;
	at: 'Debugging' put: #debugging;
	at: 'Dictionary' put: #dictionary;
	at: 'Dynamic Messages' put: #dynamic;
	at: 'Exceptions' put: #exceptions;
	at: 'Features' put: #feature;
	at: 'File Operations' put: #fileMan;
	at: 'Fonts' put: #font;
	at: 'Forms' put: #form;
	at: 'Heap' put: #heap;
	at: 'Internal Streams' put: #internalStream;
	at: 'Intervals' put: #interval;
	at: 'Introduction' put: #introduction;
	at: 'Iterations' put: #iterationStatement;
	at: 'Layout Morph' put: #layoutMorph;
	at: 'Layout Spec' put: #layoutSpec;
	at: 'Literals' put: #literals;
	at: 'Metaclass' put: #metaclass;
	at: 'Method Calls' put: #methodCall;
	at: 'Miscellaneous' put: #misc;
	at: 'Morphs' put: #morph;
	at: 'Object' put: #anObject;
	at: 'Ordered Collections' put: #orderedCollection;
	at: 'Point' put: #point;
	at: 'PopUpMenu' put: #popUpMenu;
	at: 'Primitives' put: #primitive;
	at: 'Rectangle' put: #rectangle;
	at: 'Sets' put: #set;
	at: 'Sorted Collections' put: #sortedCollection;
	at: 'Strings' put: #string;
	at: 'Symbols' put: #symbol;
	at: 'Syntax' put: #syntax;
	at: 'Time' put: #time;
	at: 'Transcript' put: #transcript;	
	at: 'Trie' put: #trie;
	yourself`! !

!II class methodsFor: 'as yet unclassified' stamp: 'dhn 10/6/2018 13:18:04'!
but does not call on halt: in order to 
	avoid putting this message on the stack. Halt is especially useful when 
	the breakpoint message is an arbitrary one."

self halt: ''something to aid debugging''.
	"This is the typical message to use for inserting breakpoints during 
	debugging. It creates and schedules a Notifier with a label."

self inboundPointers.  "Answers a collection of all objects in the system that point to myself"

self inboundPointersExcluding: #().  "Answer a list of all objects in the system that point to me, excluding those in the collection of objectsToExclude. I do my best to avoid creating any temporary objects that point to myself"

nil inform: ''Nothing exceeds like excess.''.  "Display a message for the user to read and then dismiss."

x inspectWithLabel: ''Interesting Instance''.  "Create and schedule an Inspector labelled aLabel."

x isKindOf: Set. 	"Answer whether the argument is a superclass or class of the receiver."

y isMemberOf: Symbol. 
	"Answer whether the receiver is an instance of the argument class"

y longPrintString.
	"Answer a String whose characters are a description of the receiver."

nil notify: ''this is a notice''. 
	"Create and schedule a Notifier with the argument as the message in 
	order to request confirmation before a process can proceed."

x _ y outboundPointers.
"Answers a list of all objects I am causing not to be garbage-collected"

x perform: #asBag. 
	"Send the unary selector, a symbol, to the receiver.
	Fail if the number of arguments expected by the selector is not zero."

x perform: #at: with: 2. 
	"Send the selector, a symbol, to the receiver with an argument.
	Fail if the number of arguments expected by the selector is not one."

x perform: #at:put: with: 2 with: ''bar''. 
	"Send the selector, a symbol, to the receiver with the given arguments.
	Fail if the number of arguments expected by the selector is not two."

x perform: #at:put: withArguments: {2. 17.6}. 
	"Send the selector, a symbol, to the receiver with arguments in an array.
	Fail if the number of arguments expected by the selector does not match 
	the size of the array."

y printOn: String new writeStream.
	"Append to the argument, a stream, a sequence of characters that  
	identifies the receiver."

nil shouldBeImplemented.
	"Announce that this message should be implemented"

nil shouldNotImplement.
	"Announce that, although the receiver inherits this message, it should 
	not implement it."

y storeOn: String new writeStream. 
	"Append to the argument a sequence of characters that is an 
	expression whose evaluation creates an object similar to the receiver."

y storeString.
	"Answer a String representation of the receiver from which the receiver 
	can be reconstructed."

self subclassResponsibility.
	"This message sets up a framework for the behavior of the class'' subclasses.
	 Announce that the subclass should have implemented this message."

self triggerEvent: #mouseOver.
	"Evaluate all actions registered for the argument, an EventSelector. Return the 
	value of the last registered action."

x yourself.

y ~= #foo. 
	"Answer whether the receiver and the argument do not represent the 
	same object."

y ~~ #foo. 
	"Answer whether the receiver and the argument are not the same object 
	(do not have the same object pointer)."

'! !

!II class methodsFor: 'as yet unclassified' stamp: 'dhn 10/6/2018 13:18:04'!
l message to use for inserting breakpoints during 
	debugging. It creates and schedules a Notifier with a label."

self inboundPointers.  "Answers a collection of all objects in the system that point to myself"

self inboundPointersExcluding: #().  "Answer a list of all objects in the system that point to me, excluding those in the collection of objectsToExclude. I do my best to avoid creating any temporary objects that point to myself"

nil inform: ''Nothing exceeds like excess.''.  "Display a message for the user to read and then dismiss."

x inspectWithLabel: ''Interesting Instance''.  "Create and schedule an Inspector labelled aLabel."

x isKindOf: Set. 	"Answer whether the argument is a superclass or class of the receiver."

y isMemberOf: Symbol. 
	"Answer whether the receiver is an instance of the argument class"

y longPrintString.
	"Answer a String whose characters are a description of the receiver."

nil notify: ''this is a notice''. 
	"Create and schedule a Notifier with the argument as the message in 
	order to request confirmation before a process can proceed."

x _ y outboundPointers.
"Answers a list of all objects I am causing not to be garbage-collected"

x perform: #asBag. 
	"Send the unary selector, a symbol, to the receiver.
	Fail if the number of arguments expected by the selector is not zero."

x perform: #at: with: 2. 
	"Send the selector, a symbol, to the receiver with an argument.
	Fail if the number of arguments expected by the selector is not one."

x perform: #at:put: with: 2 with: ''bar''. 
	"Send the selector, a symbol, to the receiver with the given arguments.
	Fail if the number of arguments expected by the selector is not two."

x perform: #at:put: withArguments: {2. 17.6}. 
	"Send the selector, a symbol, to the receiver with arguments in an array.
	Fail if the number of arguments expected by the selector does not match 
	the size of the array."

y printOn: String new writeStream.
	"Append to the argument, a stream, a sequence of characters that  
	identifies the receiver."

nil shouldBeImplemented.
	"Announce that this message should be implemented"

nil shouldNotImplement.
	"Announce that, although the receiver inherits this message, it should 
	not implement it."

y storeOn: String new writeStream. 
	"Append to the argument a sequence of characters that is an 
	expression whose evaluation creates an object similar to the receiver."

y storeString.
	"Answer a String representation of the receiver from which the receiver 
	can be reconstructed."

self subclassResponsibility.
	"This message sets up a framework for the behavior of the class'' subclasses.
	 Announce that the subclass should have implemented this message."

self triggerEvent: #mouseOver.
	"Evaluate all actions registered for the argument, an EventSelector. Return the 
	value of the last registered action."

x yourself.

y ~= #foo. 
	"Answer whether the receiver and the argument do not represent the 
	same object."

y ~~ #foo. 
	"Answer whether the receiver and the argument are not the same object 
	(do not have the same object pointer)."

'! !

!II class methodsFor: 'as yet unclassified' stamp: 'dhn 10/6/2018 14:04:52'!
ax |	"For efficient viewing, have a Transcript open and use Cmd-d on these statements"
x _ #(4 3 2 1).								"constant array"
x _ Array with: 5 with: 4 with: 3 with: 2.         "create array with 4 elements"
x _ Array new: 4.								"allocate an array with specified size"
x													"set array elements"
   at: 1 put: 5;
   at: 2 put: 4;
   at: 3 put: 3;
   at: 4 put: 7;
   yourself.									"without this, x will be 7 (the last element)"

b _ x isEmpty.									"test if array is empty"
y _ x size.										"array size"
y _ x at: 4.									"get array element at index"
b _ x includes: 3.							"test if element is in array"
y _ x copyFrom: 2 to: 4.					"subarray"
y _ x indexOf: 3 ifAbsent: [0].			"first position of element within array"
y _ x occurrencesOf: 3.						"number of times object in collection"
x do: [:a | Transcript show: a printString; newLine].  "iterate over the array"
b _ x allSatisfy: [:a | (a >= 1) & (a <= 4)].	"test if all elements meet condition"
y _ x select: [:a | a > 2].				"return collection of elements that pass test"
y _ x reject: [:a | a < 2].				"return collection of elements that fail test"
y _ x collect: [:a | a + a].				"transform each element for new collection"
y _ x detect: [:a | a > 3] ifNone: [].	"return first element that passes test"
y _ x findFirst: [:a | a < 3].			"find position of first element that passes test"
sum _ 0. x do: [:a | sum _ sum + a]. sum.	"sum array elements"
sum _ 0. 1 to: (x size) do: [:a | sum _ sum + (x at: a)].  "sum array elements"
sum _ x inject: 0 into: [:a :c | a + c].	"sum array elements"
max _ x inject: 0 into: [:a :c | (a > c)	"find max element in array"
   ifTrue: [a]
   ifFalse: [c]].
y _ x shuffled.								"randomly shuffle collection"
y _ x asArray.									"convert to array"
y _ x asByteArray.							"convert to byte array"
y _ x asWordArray.							"convert to word array"
y _ x asOrderedCollection.					"convert to ordered collection"
y _ x asSortedCollection.					"convert to sorted collection"
y _ x asBag.									"convert to bag collection"
y _ x asSet.									"convert to set collection"

'! !

!II class methodsFor: 'as yet unclassified' stamp: 'dhn 10/6/2018 14:04:52'!
ill be 7 (the last element)"

b _ x isEmpty.									"test if array is empty"
y _ x size.										"array size"
y _ x at: 4.									"get array element at index"
b _ x includes: 3.							"test if element is in array"
y _ x copyFrom: 2 to: 4.					"subarray"
y _ x indexOf: 3 ifAbsent: [0].			"first position of element within array"
y _ x occurrencesOf: 3.						"number of times object in collection"
x do: [:a | Transcript show: a printString; newLine].  "iterate over the array"
b _ x allSatisfy: [:a | (a >= 1) & (a <= 4)].	"test if all elements meet condition"
y _ x select: [:a | a > 2].				"return collection of elements that pass test"
y _ x reject: [:a | a < 2].				"return collection of elements that fail test"
y _ x collect: [:a | a + a].				"transform each element for new collection"
y _ x detect: [:a | a > 3] ifNone: [].	"return first element that passes test"
y _ x findFirst: [:a | a < 3].			"find position of first element that passes test"
sum _ 0. x do: [:a | sum _ sum + a]. sum.	"sum array elements"
sum _ 0. 1 to: (x size) do: [:a | sum _ sum + (x at: a)].  "sum array elements"
sum _ x inject: 0 into: [:a :c | a + c].	"sum array elements"
max _ x inject: 0 into: [:a :c | (a > c)	"find max element in array"
   ifTrue: [a]
   ifFalse: [c]].
y _ x shuffled.								"randomly shuffle collection"
y _ x asArray.									"convert to array"
y _ x asByteArray.							"convert to byte array"
y _ x asWordArray.							"convert to word array"
y _ x asOrderedCollection.					"convert to ordered collection"
y _ x asSortedCollection.					"convert to sorted collection"
y _ x asBag.									"convert to bag collection"
y _ x asSet.									"convert to set collection"

'! !

!II class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:16:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !

!II class methodsFor: 'as yet unclassified' stamp: 'AS 3/28/2019 18:08:45'!
next

	next ifNil: [
		next _ self cloneNamed: (self name, 'I').
		next previous: self
	].
	^next
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'AS 3/28/2019 18:10:40'!
previous
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'AS 3/28/2019 18:23:50'!
previous: unNumeroDePeano
	previous _ unNumeroDePeano! !

!II class methodsFor: 'as yet unclassified' stamp: 'AS 3/28/2019 18:17:28'!
removeAllNext
	next ifNotNil:

	[

		next removeAllNext.

		next removeFromSystem.

		next := nil.

	]! !


!classDefinition: #III category: #'Numeros De Peano'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Numeros De Peano'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
* arg1
	^self previous * arg1 + arg1! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
+ unNumeroDePeano
	^self previous + unNumeroDePeano next! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:15:28'!
- arg1
	|sustraendo result|
	sustraendo := arg1.
	result := self.
	[sustraendo > I] whileTrue: [ 
		 result _ result previous. 
		sustraendo _ sustraendo previous
		].
	^result previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
/ arg1
	self < arg1 ifTrue: [ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	self = arg1 ifTrue: [ ^ I ].
	^ self - arg1 / arg1 + I.! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
< arg1
	arg1 = I ifTrue: [ ^ false ].
	^ self previous < arg1 previous.! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
> arg1
	arg1 = I ifTrue: [ ^ true ].
	^ self previous > arg1 previous.! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ 'No se puede dividir por un numero mayor'.! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^ 'Numeros negativos no soportados'.! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:16:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
next

	next ifNil: [
		next _ self cloneNamed: (self name, 'I').
		next previous: self
	].
	^next
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
previous
	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
previous: unNumeroDePeano
	previous _ unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
removeAllNext
	next ifNotNil:

	[

		next removeAllNext.

		next removeFromSystem.

		next := nil.

	]! !


!classDefinition: #IIII category: #'Numeros De Peano'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Numeros De Peano'!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
* arg1
	^self previous * arg1 + arg1! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
+ unNumeroDePeano
	^self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:15:39'!
- arg1
	|sustraendo result|
	sustraendo := arg1.
	result := self.
	[sustraendo > I] whileTrue: [ 
		 result _ result previous. 
		sustraendo _ sustraendo previous
		].
	^result previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
/ arg1
	self < arg1 ifTrue: [ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	self = arg1 ifTrue: [ ^ I ].
	^ self - arg1 / arg1 + I.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
< arg1
	arg1 = I ifTrue: [ ^ false ].
	^ self previous < arg1 previous.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
> arg1
	arg1 = I ifTrue: [ ^ true ].
	^ self previous > arg1 previous.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ 'No se puede dividir por un numero mayor'.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^ 'Numeros negativos no soportados'.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:16:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := III.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
next

	next ifNil: [
		next _ self cloneNamed: (self name, 'I').
		next previous: self
	].
	^next
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
previous
	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
previous: unNumeroDePeano
	previous _ unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 4/1/2019 20:11:25'!
removeAllNext
	next ifNotNil:

	[

		next removeAllNext.

		next removeFromSystem.

		next := nil.

	]! !

I initializeAfterFileIn!
II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!