!classDefinition: #LuzAmarilla category: #Semaforo!
DenotativeObjectMorph subclass: #LuzAmarilla
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LuzAmarilla class' category: #Semaforo!
LuzAmarilla class
	instanceVariableNames: ''!

!LuzAmarilla class methodsFor: 'morph' stamp: 'AS 3/25/2019 20:38:15'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LuzAmarilla class methodsFor: 'as yet unclassified' stamp: 'AS 3/25/2019 21:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!LuzAmarilla class methodsFor: 'as yet unclassified' stamp: 'AS 3/25/2019 20:45:33'!
titilar
	5 timesRepeat: [ 
		self color: Color yellow.
		(Delay for: 500*millisecond) wait.
		self color: Color black.
		(Delay for: 500*millisecond) wait.
		]! !


!classDefinition: #LuzRoja category: #Semaforo!
DenotativeObjectMorph subclass: #LuzRoja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LuzRoja class' category: #Semaforo!
LuzRoja class
	instanceVariableNames: ''!

!LuzRoja class methodsFor: 'morph' stamp: 'AS 3/25/2019 20:37:55'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LuzRoja class methodsFor: 'as yet unclassified' stamp: 'AS 3/25/2019 21:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #LuzVerde category: #Semaforo!
DenotativeObjectMorph subclass: #LuzVerde
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LuzVerde class' category: #Semaforo!
LuzVerde class
	instanceVariableNames: ''!

!LuzVerde class methodsFor: 'morph' stamp: 'AS 3/25/2019 20:38:23'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LuzVerde class methodsFor: 'as yet unclassified' stamp: 'AS 3/25/2019 21:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #Semaforo category: #Semaforo!
DenotativeObjectMorph subclass: #Semaforo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Semaforo class' category: #Semaforo!
Semaforo class
	instanceVariableNames: ''!

!Semaforo class methodsFor: 'morph' stamp: 'AS 3/25/2019 20:37:17'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!Semaforo class methodsFor: 'as yet unclassified' stamp: 'AS 3/25/2019 20:46:28'!
apagar
	LuzRoja color: Color black.
	LuzAmarilla color: Color black.
	LuzVerde color: Color black.! !

!Semaforo class methodsFor: 'as yet unclassified' stamp: 'AS 3/25/2019 21:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!Semaforo class methodsFor: 'as yet unclassified' stamp: 'AS 3/25/2019 20:41:41'!
prender
	LuzAmarilla titilar
	! !

LuzAmarilla initializeAfterFileIn!
LuzRoja initializeAfterFileIn!
LuzVerde initializeAfterFileIn!
Semaforo initializeAfterFileIn!