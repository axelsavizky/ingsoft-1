!classDefinition: #ReguladorDeTransitoDeCorrientes category: #Semaforo!
DenotativeObjectMorph subclass: #ReguladorDeTransitoDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReguladorDeTransitoDeCorrientes class' category: #Semaforo!
ReguladorDeTransitoDeCorrientes class
	instanceVariableNames: ''!

!ReguladorDeTransitoDeCorrientes class methodsFor: 'morph' stamp: 'AS 3/31/2019 20:16:25'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!ReguladorDeTransitoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:20:33'!
apagar
	SeñalizacionDeFrenadoDeCorrientes color: Color black.
	SeñalizacionDePrecaucionDeCorrientes color: Color black.
	SeñalizacionDeAvanceDeCorrientes color: Color black.! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:20:33'!
avisarPrecaucionPorEncendido
	SeñalizacionDePrecaucionDeCorrientes prender.
	(Delay for: 500*millisecond) wait.
	SeñalizacionDePrecaucionDeCorrientes apagar.
	(Delay for: 500*millisecond) wait.
	
	SeñalizacionDePrecaucionDeCorrientes prender.
	(Delay for: 500*millisecond) wait.
	SeñalizacionDePrecaucionDeCorrientes apagar.
	(Delay for: 500*millisecond) wait.
	
	SeñalizacionDePrecaucionDeCorrientes prender.
	(Delay for: 500*millisecond) wait.
	SeñalizacionDePrecaucionDeCorrientes apagar.
	(Delay for: 500*millisecond) wait.
	
	SeñalizacionDePrecaucionDeCorrientes prender.
	(Delay for: 500*millisecond) wait.
	SeñalizacionDePrecaucionDeCorrientes apagar.
	(Delay for: 500*millisecond) wait.
	
	SeñalizacionDePrecaucionDeCorrientes prender.
	(Delay for: 500*millisecond) wait.
	SeñalizacionDePrecaucionDeCorrientes apagar.
	(Delay for: 500*millisecond) wait.! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:52:34'!
avisarPrecaucionPorFrenadoDeTransito
	SeñalizacionDePrecaucionDeCorrientes prender.
	(Delay for: 2*second) wait.! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:52:27'!
avisarPrecaucionPorHabilitacionDeTransito
	SeñalizacionDePrecaucionDeCorrientes prender.
	(Delay for: 2*second) wait.! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:41:27'!
frenarTransito
	self avisarPrecaucionPorFrenadoDeTransito.
	self señalizarTransitoFrenado.! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:50:18'!
habilitarTransito
	self avisarPrecaucionPorHabilitacionDeTransito.
	self señalizarHabilitacionDeTransito.! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:54:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:16:25'!
prender
	self avisarPrecaucionPorEncendido
	! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:49:16'!
señalizarHabilitacionDeTransito
	SeñalizacionDeFrenadoDeCorrientes apagar.
	SeñalizacionDePrecaucionDeCorrientes apagar.
	SeñalizacionDeAvanceDeCorrientes prender.! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:42:54'!
señalizarTransitoFrenado
	SeñalizacionDePrecaucionDeCorrientes apagar.
	SeñalizacionDeAvanceDeCorrientes apagar.
	SeñalizacionDeFrenadoDeCorrientes prender.! !


!classDefinition: #ReguladorDeTransitoDeMaipu category: #Semaforo!
DenotativeObjectMorph subclass: #ReguladorDeTransitoDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReguladorDeTransitoDeMaipu class' category: #Semaforo!
ReguladorDeTransitoDeMaipu class
	instanceVariableNames: ''!

!ReguladorDeTransitoDeMaipu class methodsFor: 'morph' stamp: 'AS 3/25/2019 20:37:17'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !


!ReguladorDeTransitoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:26:07'!
apagar
	SeñalizacionDeFrenadoDeMaipu color: Color black.
	SeñalizacionDePrecaucionDeMaipu color: Color black.
	SeñalizacionDeAvanceDeMaipu color: Color black.! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:26:37'!
avisarPrecaucionPorEncendido
	SeñalizacionDePrecaucionDeMaipu prender.
	(Delay for: 500*millisecond) wait.
	SeñalizacionDePrecaucionDeMaipu apagar.
	(Delay for: 500*millisecond) wait.
	
	SeñalizacionDePrecaucionDeMaipu prender.
	(Delay for: 500*millisecond) wait.
	SeñalizacionDePrecaucionDeMaipu apagar.
	(Delay for: 500*millisecond) wait.
	
	SeñalizacionDePrecaucionDeMaipu prender.
	(Delay for: 500*millisecond) wait.
	SeñalizacionDePrecaucionDeMaipu apagar.
	(Delay for: 500*millisecond) wait.
	
	SeñalizacionDePrecaucionDeMaipu prender.
	(Delay for: 500*millisecond) wait.
	SeñalizacionDePrecaucionDeMaipu apagar.
	(Delay for: 500*millisecond) wait.
	
	SeñalizacionDePrecaucionDeMaipu prender.
	(Delay for: 500*millisecond) wait.
	SeñalizacionDePrecaucionDeMaipu apagar.
	(Delay for: 500*millisecond) wait.! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:52:15'!
avisarPrecaucionPorFrenadoDeTransito
	SeñalizacionDePrecaucionDeMaipu prender.
	(Delay for: 2*second) wait.! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:52:08'!
avisarPrecaucionPorHabilitacionDeTransito
	SeñalizacionDePrecaucionDeMaipu prender.
	(Delay for: 2*second) wait.! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:43:44'!
frenarTransito
	self avisarPrecaucionPorFrenadoDeTransito.
	self señalizarTransitoFrenado.! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:46:12'!
habilitarTransito
	self avisarPrecaucionPorHabilitacionDeTransito.
	self señalizarHabilitacionDeTransito.! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:54:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:00:20'!
prender
	self avisarPrecaucionPorEncendido
	! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:48:49'!
señalizarHabilitacionDeTransito
	SeñalizacionDeFrenadoDeMaipu apagar.
	SeñalizacionDePrecaucionDeMaipu apagar.
	SeñalizacionDeAvanceDeMaipu prender.! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:43:30'!
señalizarTransitoFrenado
	SeñalizacionDePrecaucionDeMaipu apagar.
	SeñalizacionDeAvanceDeMaipu apagar.
	SeñalizacionDeFrenadoDeMaipu prender.! !


!classDefinition: #SeñalizacionDeAvanceDeCorrientes category: #Semaforo!
DenotativeObjectMorph subclass: #SeñalizacionDeAvanceDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalizacionDeAvanceDeCorrientes class' category: #Semaforo!
SeñalizacionDeAvanceDeCorrientes class
	instanceVariableNames: ''!

!SeñalizacionDeAvanceDeCorrientes class methodsFor: 'morph' stamp: 'AS 3/25/2019 20:38:23'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalizacionDeAvanceDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:14:11'!
apagar
	self color: Color black! !

!SeñalizacionDeAvanceDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:54:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!SeñalizacionDeAvanceDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:14:05'!
prender
	self color: Color green! !


!classDefinition: #SeñalizacionDeAvanceDeMaipu category: #Semaforo!
DenotativeObjectMorph subclass: #SeñalizacionDeAvanceDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalizacionDeAvanceDeMaipu class' category: #Semaforo!
SeñalizacionDeAvanceDeMaipu class
	instanceVariableNames: ''!

!SeñalizacionDeAvanceDeMaipu class methodsFor: 'morph' stamp: 'AS 3/31/2019 20:20:44'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalizacionDeAvanceDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:20:44'!
apagar
	self color: Color black! !

!SeñalizacionDeAvanceDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:54:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!SeñalizacionDeAvanceDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:20:44'!
prender
	self color: Color green! !


!classDefinition: #SeñalizacionDeFrenadoDeCorrientes category: #Semaforo!
DenotativeObjectMorph subclass: #SeñalizacionDeFrenadoDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalizacionDeFrenadoDeCorrientes class' category: #Semaforo!
SeñalizacionDeFrenadoDeCorrientes class
	instanceVariableNames: ''!

!SeñalizacionDeFrenadoDeCorrientes class methodsFor: 'morph' stamp: 'AS 3/25/2019 20:37:55'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalizacionDeFrenadoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:13:44'!
apagar
	self color: Color black! !

!SeñalizacionDeFrenadoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:54:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!SeñalizacionDeFrenadoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:13:37'!
prender
	self color: Color red! !


!classDefinition: #SeñalizacionDeFrenadoDeMaipu category: #Semaforo!
DenotativeObjectMorph subclass: #SeñalizacionDeFrenadoDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalizacionDeFrenadoDeMaipu class' category: #Semaforo!
SeñalizacionDeFrenadoDeMaipu class
	instanceVariableNames: ''!

!SeñalizacionDeFrenadoDeMaipu class methodsFor: 'morph' stamp: 'AS 3/31/2019 20:20:57'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalizacionDeFrenadoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:20:57'!
apagar
	self color: Color black! !

!SeñalizacionDeFrenadoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:54:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!SeñalizacionDeFrenadoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:20:57'!
prender
	self color: Color red! !


!classDefinition: #SeñalizacionDePrecaucionDeCorrientes category: #Semaforo!
DenotativeObjectMorph subclass: #SeñalizacionDePrecaucionDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalizacionDePrecaucionDeCorrientes class' category: #Semaforo!
SeñalizacionDePrecaucionDeCorrientes class
	instanceVariableNames: ''!

!SeñalizacionDePrecaucionDeCorrientes class methodsFor: 'morph' stamp: 'AS 3/25/2019 20:38:15'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalizacionDePrecaucionDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:01:04'!
apagar
	self color: Color black.! !

!SeñalizacionDePrecaucionDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:54:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!SeñalizacionDePrecaucionDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:00:54'!
prender
	self color: Color yellow.! !


!classDefinition: #SeñalizacionDePrecaucionDeMaipu category: #Semaforo!
DenotativeObjectMorph subclass: #SeñalizacionDePrecaucionDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalizacionDePrecaucionDeMaipu class' category: #Semaforo!
SeñalizacionDePrecaucionDeMaipu class
	instanceVariableNames: ''!

!SeñalizacionDePrecaucionDeMaipu class methodsFor: 'morph' stamp: 'AS 3/31/2019 20:21:05'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!SeñalizacionDePrecaucionDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:21:05'!
apagar
	self color: Color black.! !

!SeñalizacionDePrecaucionDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:54:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

!SeñalizacionDePrecaucionDeMaipu class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:21:05'!
prender
	self color: Color yellow.! !


!classDefinition: #SemaforoDeMaipuYCorrientes category: #Semaforo!
DenotativeObject subclass: #SemaforoDeMaipuYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SemaforoDeMaipuYCorrientes class' category: #Semaforo!
SemaforoDeMaipuYCorrientes class
	instanceVariableNames: ''!

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:25:31'!
apagar
	ReguladorDeTransitoDeCorrientes apagar.
	ReguladorDeTransitoDeMaipu apagar! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:38:13'!
habilitarTransitoDeCorrientes
	ReguladorDeTransitoDeMaipu frenarTransito.
	ReguladorDeTransitoDeCorrientes habilitarTransito.! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:51:10'!
habilitarTransitoDeMaipu
	ReguladorDeTransitoDeCorrientes frenarTransito.
	ReguladorDeTransitoDeMaipu habilitarTransito.! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'AS 3/31/2019 20:28:23'!
prender
	[ReguladorDeTransitoDeCorrientes prender] fork.
	[ReguladorDeTransitoDeMaipu prender] fork.! !

ReguladorDeTransitoDeCorrientes initializeAfterFileIn!
ReguladorDeTransitoDeMaipu initializeAfterFileIn!
SeñalizacionDeAvanceDeCorrientes initializeAfterFileIn!
SeñalizacionDeAvanceDeMaipu initializeAfterFileIn!
SeñalizacionDeFrenadoDeCorrientes initializeAfterFileIn!
SeñalizacionDeFrenadoDeMaipu initializeAfterFileIn!
SeñalizacionDePrecaucionDeCorrientes initializeAfterFileIn!
SeñalizacionDePrecaucionDeMaipu initializeAfterFileIn!