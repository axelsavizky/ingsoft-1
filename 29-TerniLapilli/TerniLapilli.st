!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:07:47'!
test01
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 1@1.
	
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli playsOfX.
	self assert: (terniLapilli playsOfO) isEmpty.
	self deny: terniLapilli hasFinished.
	self assert: #O equals: terniLapilli currentTurn.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:07:57'!
test02
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	
	self assert: (OrderedCollection with: 0@0) equals: terniLapilli playsOfX.
	self assert: (terniLapilli playsOfO) isEmpty.
	self deny: terniLapilli hasFinished.
	self assert: #O equals: terniLapilli currentTurn.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:08:01'!
test03
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 1@1.
	
	self should: [terniLapilli putXAt: 2@2.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli notYourTurnErrorDescription.
	
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli playsOfX.
	self assert: terniLapilli playsOfO isEmpty.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:08:05'!
test04
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 1@1.
	terniLapilli putOAt: 2@2.
	
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli playsOfX .
	self assert: (OrderedCollection with: 2@2) equals: terniLapilli playsOfO .
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:08:42'!
test05
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 1@1.
	terniLapilli putOAt: 0@2.
	
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli playsOfX .
	self assert: (OrderedCollection with: 0@2) equals: terniLapilli playsOfO .
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 20:32:39'!
test06
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
		
	self should: [terniLapilli putOAt: 1@1.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli notYourTurnErrorDescription.
	
	self assert: terniLapilli playsOfX isEmpty .
	self assert: terniLapilli playsOfO isEmpty.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:08:47'!
test07
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@2.
	
	self should: [terniLapilli putOAt: 0@2] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli nonEmptyPositionErrorDescription.
		
	self assert: (OrderedCollection with: 0@2) equals: terniLapilli playsOfX.
	self assert: terniLapilli playsOfO isEmpty.	
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:08:54'!
test08
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 2@0.
	
	self should: [terniLapilli putOAt: 2@0] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli nonEmptyPositionErrorDescription.
		
	self assert: (OrderedCollection with: 2@0) equals: terniLapilli playsOfX.
	self assert: terniLapilli playsOfO isEmpty.	
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:08:58'!
test09
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 2@0.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 2@2.
		
	self assert: (OrderedCollection with: 2@0 with: 2@2) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 1@2) equals: terniLapilli playsOfO.	
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:09:02'!
test10
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 2@0.
	terniLapilli putOAt: 2@2.
	
	self should: [terniLapilli putXAt: 2@0] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli nonEmptyPositionErrorDescription.
		
	self assert: (OrderedCollection with: 2@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 2@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:09:08'!
test11
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 2@0.
	terniLapilli putOAt: 2@2.
	
	self should: [terniLapilli putXAt: 2@2] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli nonEmptyPositionErrorDescription.
		
	self assert: (OrderedCollection with: 2@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 2@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:09:12'!
test12
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 2@0.
	terniLapilli putOAt: 2@2.
	terniLapilli putXAt: 1@1.
	
	self should: [terniLapilli putOAt: 2@2] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli nonEmptyPositionErrorDescription.
		
	self assert: (OrderedCollection with: 2@0 with: 1@1) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 20:44:13'!
test13
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	self should: [terniLapilli putXAt: -1@3.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli invalidPositionErrorDescription.
		
	self assert: (terniLapilli playsOfX) isEmpty.
	self assert: (terniLapilli playsOfO) isEmpty.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 20:48:42'!
test14
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	self should: [terniLapilli putXAt: 3@-1.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli invalidPositionErrorDescription.
		
	self assert: (terniLapilli playsOfX) isEmpty.
	self assert: (terniLapilli playsOfO) isEmpty.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:09:19'!
test15
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 1@1.
	
	self should: [terniLapilli putOAt: -1@-1.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli invalidPositionErrorDescription.
		
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli playsOfX.
	self assert: (terniLapilli playsOfO) isEmpty.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:09:23'!
test16
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 2@2.
	terniLapilli putXAt: 0@1.
	terniLapilli putOAt: 2@1.
	terniLapilli putXAt: 0@2.	
	
	self assert: (OrderedCollection with: 0@0 with: 0@1 with: 0@2) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 2@2 with: 2@1) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self assert: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:09:28'!
test17
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	terniLapilli putXAt: 1@1.
	terniLapilli putOAt: 2@1.
	terniLapilli putXAt: 1@2.	
	
	self assert: (OrderedCollection with: 1@0 with: 1@1 with: 1@2) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 2@2 with: 2@1) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self assert: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:13:49'!
test18
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@1.
	terniLapilli putOAt: 2@2.
	terniLapilli putXAt: 1@1.
	terniLapilli putOAt: 2@0.
	terniLapilli putXAt: 2@1.	
	
	self assert: (OrderedCollection with: 0@1 with: 1@1 with: 2@1) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 2@2 with: 2@0) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self assert: terniLapilli hasFinished.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:17:57'!
test500
	
	"testear que no haya mas de 3 (para O y para X)"
	"can not slideX while playing (para O y para X)"
	"can not slideX when is not my turn (para O y para X) "
	"no hacer slides de posiciones vacias etc..."! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'currentTurn playsOfX playsOfO'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'exceptions' stamp: 'AMS 5/20/2019 17:58:52'!
raiseInvalidPositionException

	^self error: self class invalidPositionErrorDescription! !

!TerniLapilli methodsFor: 'exceptions' stamp: 'AMS 5/20/2019 18:23:58'!
raiseNonEmptyPositionException

	^self error: self class nonEmptyPositionErrorDescription ! !

!TerniLapilli methodsFor: 'exceptions' stamp: 'AMS 5/20/2019 18:17:34'!
raiseNotYourTurnException

	^self error: self class notYourTurnErrorDescription ! !


!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/20/2019 21:20:48'!
hasWonXByHorizontalLine

	^(((playsOfX at: 1) x = (playsOfX at: 2) x) and: [(playsOfX at: 2) x = (playsOfX at: 3) x])! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/20/2019 21:21:47'!
hasWonXByVerticalLine

	^((playsOfX at: 1) y = (playsOfX at: 2) y) and: [(playsOfX at: 2) y = (playsOfX at: 3) y]! !


!TerniLapilli methodsFor: 'testing' stamp: 'AMS 5/20/2019 17:59:30'!
currentTurn

	^currentTurn! !

!TerniLapilli methodsFor: 'testing' stamp: 'AMS 5/20/2019 21:21:39'!
hasFinished


	^playsOfX size = 3 and: [self hasWonXByHorizontalLine or: [self hasWonXByVerticalLine ]]! !

!TerniLapilli methodsFor: 'testing' stamp: 'AMS 5/20/2019 20:22:14'!
playsOfO

	^playsOfO.! !

!TerniLapilli methodsFor: 'testing' stamp: 'AMS 5/20/2019 20:22:10'!
playsOfX

	^playsOfX.! !


!TerniLapilli methodsFor: 'initialization' stamp: 'AMS 5/20/2019 21:01:56'!
initialize

	currentTurn := #X.
	playsOfX := OrderedCollection new.
	playsOfO := OrderedCollection new.! !


!TerniLapilli methodsFor: 'playing - private' stamp: 'AMS 5/20/2019 20:30:51'!
isValid: aPosition

	^(aPosition x < 0) or: (aPosition x > 2) or: (aPosition y < 0) or: (aPosition y > 2)! !


!TerniLapilli methodsFor: 'playing' stamp: 'AMS 5/20/2019 20:20:17'!
putOAt: aPosition

	(#O = currentTurn) ifFalse: [^self raiseNotYourTurnException].
	(self isValid: aPosition) ifTrue: [^self raiseInvalidPositionException].
	(playsOfX includes: aPosition) ifTrue: [^self raiseNonEmptyPositionException].
	(playsOfO includes: aPosition) ifTrue: [^self raiseNonEmptyPositionException].

	
	playsOfO add: aPosition.
	currentTurn := #X! !

!TerniLapilli methodsFor: 'playing' stamp: 'AMS 5/20/2019 20:20:22'!
putXAt: aPosition

	(#X = currentTurn) ifFalse: [^self raiseNotYourTurnException].
	(self isValid: aPosition) ifTrue: [^self raiseInvalidPositionException].
	(playsOfX includes: aPosition) ifTrue: [^self raiseNonEmptyPositionException].
	(playsOfO includes: aPosition) ifTrue: [^self raiseNonEmptyPositionException].

	
	playsOfX add: aPosition.
	currentTurn := #O! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'exceptions' stamp: 'AMS 5/20/2019 17:55:39'!
invalidPositionErrorDescription
	
	^'invalid position'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'AMS 5/20/2019 18:22:54'!
nonEmptyPositionErrorDescription
	
	^'non empty position'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'AMS 5/20/2019 18:16:10'!
notYourTurnErrorDescription
	
	^'not your turn'! !
