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

!I class methodsFor: 'as yet unclassified'!
! !

!I class methodsFor: 'as yet unclassified'!
! !

!I class methodsFor: 'as yet unclassified'!
! !

!I class methodsFor: 'as yet unclassified'!
! !

!I class methodsFor: 'as yet unclassified'!
! !

!I class methodsFor: 'as yet unclassified'!
! !

!I class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:49:01'!
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

!II class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:16:53'!
* arg1
	^ self previous * arg1 + arg1.! !

!II class methodsFor: 'as yet unclassified' stamp: 'AS 3/28/2019 18:10:01'!
+ unNumeroDePeano
	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:22:30'!
- arg1
	arg1 = I ifTrue: [ ^ self previous ].
	^ self previous - arg1 previous.! !

!II class methodsFor: 'as yet unclassified'!
! !

!II class methodsFor: 'as yet unclassified'!
! !

!II class methodsFor: 'as yet unclassified'!
! !

!II class methodsFor: 'as yet unclassified'!
! !

!II class methodsFor: 'as yet unclassified'!
! !

!II class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:49:01'!
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

!III class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
* arg1
	^ self previous * arg1 + arg1.! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
+ unNumeroDePeano
	^self previous + unNumeroDePeano next! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
- arg1
	arg1 = I ifTrue: [ ^ self previous ].
	^ self previous - arg1 previous.! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
/ arg1
	self < arg1 ifTrue: [ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	self = arg1 ifTrue: [ ^ I ].
	^ self - arg1 / arg1 + I.! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
< arg1
	arg1 = I ifTrue: [ ^ false ].
	^ self previous < arg1 previous.! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
> arg1
	arg1 = I ifTrue: [ ^ true ].
	^ self previous > arg1 previous.! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ 'No se puede dividir por un numero mayor'.! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^ 'Numeros negativos no soportados'.! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:49:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
next

	next ifNil: [
		next _ self cloneNamed: (self name, 'I').
		next previous: self
	].
	^next
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
previous
	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
previous: unNumeroDePeano
	previous _ unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
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

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
* arg1
	^ self previous * arg1 + arg1.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
+ unNumeroDePeano
	^self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
- arg1
	arg1 = I ifTrue: [ ^ self previous ].
	^ self previous - arg1 previous.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
/ arg1
	self < arg1 ifTrue: [ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	self = arg1 ifTrue: [ ^ I ].
	^ self - arg1 / arg1 + I.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
< arg1
	arg1 = I ifTrue: [ ^ false ].
	^ self previous < arg1 previous.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
> arg1
	arg1 = I ifTrue: [ ^ true ].
	^ self previous > arg1 previous.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ 'No se puede dividir por un numero mayor'.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^ 'Numeros negativos no soportados'.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:49:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := III.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
next

	next ifNil: [
		next _ self cloneNamed: (self name, 'I').
		next previous: self
	].
	^next
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
previous
	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
previous: unNumeroDePeano
	previous _ unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 19:17:33'!
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