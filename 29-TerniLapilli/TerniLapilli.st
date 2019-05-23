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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/21/2019 21:33:45'!
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/23/2019 19:58:26'!
test16
	"X gana en forma horizontal 1"
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
	self assert: terniLapilli hasFinished.
	self assert: #X equals: terniLapilli winner.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/23/2019 19:58:18'!
test17
	"X gana en forma horizontal 2"
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
	self assert: terniLapilli hasFinished.
	self assert: #X equals: terniLapilli winner.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/23/2019 19:58:00'!
test18
	"X gana en forma vertical"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@1.
	terniLapilli putOAt: 2@0.
	terniLapilli putXAt: 1@1.
	terniLapilli putOAt: 2@2.
	terniLapilli putXAt: 2@1.	
	
	self assert: (OrderedCollection with: 0@1 with: 1@1 with: 2@1) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 2@0 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self assert: terniLapilli hasFinished.
	self assert: #X equals: terniLapilli winner.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/23/2019 19:58:05'!
test19
	"X gana en forma diagonal 1"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 2@1.
	terniLapilli putXAt: 1@1.
	terniLapilli putOAt: 2@0.
	terniLapilli putXAt: 2@2.	
	
	self assert: (OrderedCollection with: 0@0 with: 1@1 with: 2@2) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 2@1 with: 2@0) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self assert: terniLapilli hasFinished.
	self assert: #X equals: terniLapilli winner.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/23/2019 19:58:10'!
test20
	"X gana en forma diagonal 2"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 2@1.
	terniLapilli putXAt: 1@1.
	terniLapilli putOAt: 2@2.
	terniLapilli putXAt: 2@0.	
	
	self assert: (OrderedCollection with: 0@2 with: 1@1 with: 2@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 2@1 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self assert: terniLapilli hasFinished.
	self assert: #X equals: terniLapilli winner.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/23/2019 19:57:41'!
test21
	"O gana en forma horizontal 1"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 0@0.
	terniLapilli putXAt: 2@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 2@2.
	terniLapilli putOAt: 0@2.	
	
	self assert: (OrderedCollection with: 1@0 with: 2@0 with: 2@2) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@0 with: 0@1 with: 0@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self assert: terniLapilli hasFinished.
	self assert: #O equals: terniLapilli winner.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/23/2019 19:57:46'!
test22
	"O gana en forma vertical 1"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@2. 
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 2@0.
	terniLapilli putOAt: 1@1.
	terniLapilli putXAt: 2@2.
	terniLapilli putOAt: 2@1.	
	
	self assert: (OrderedCollection with: 0@2 with: 2@0 with: 2@2) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@1 with: 2@1) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self assert: terniLapilli hasFinished.
	self assert: #O equals: terniLapilli winner.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/23/2019 20:00:41'!
test23
	"O gana en forma diagonal 1"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 0@0.
	terniLapilli putXAt: 2@1.
	terniLapilli putOAt: 1@1.
	terniLapilli putXAt: 2@0.
	terniLapilli putOAt: 2@2.	
	
	self assert: (OrderedCollection with: 0@2 with: 2@1 with: 2@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@0 with: 1@1 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self assert: terniLapilli hasFinished.
	self assert: #O equals: terniLapilli winner.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/23/2019 20:03:36'!
test24
	"O gana en forma diagonal 2"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@2.
	terniLapilli putXAt: 2@1.
	terniLapilli putOAt: 1@1.
	terniLapilli putXAt: 2@2.
	terniLapilli putOAt: 2@0.	
	
	self assert: (OrderedCollection with: 0@0 with: 2@1 with: 2@2) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@2 with: 1@1 with: 2@0) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self assert: terniLapilli hasFinished.
	self assert: #O equals: terniLapilli winner.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/23/2019 19:57:24'!
test300
	"se controla que si ningun jugador gano, al pedir winner a la instancia se lanze una excepcion"
	"| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.	
	
	self should: [terniLapilli winner.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli nobodyWinErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli hasFinished."! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/23/2019 19:57:28'!
test400
	"se controla que no haya mas de 3 X"
	"| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.	
	
	self should: [terniLapilli putXAt: 2@0.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli moreThanThreeTokensErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli hasFinished."! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/20/2019 21:17:57'!
test500
	
	"testear que no haya mas de 3 (para O y para X)"
	"can not slideX while playing (para O y para X)"
	"can not slideX when is not my turn (para O y para X) "
	"no hacer slides de posiciones vacias etc..."! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'currentTurn playsOfX playsOfO hasFinished winner'
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


!TerniLapilli methodsFor: 'testing - private' stamp: 'BA 5/23/2019 20:01:46'!
hasWonO
	^playsOfO size = 3 and: [self hasWonOByHorizontalLine or: [self hasWonOByVerticalLine or: [self hasWonOByDiagonalLine]]]
	
	"^playsOfX size = 3 and: [self hasWonXByHorizontalLine or: [self hasWonXByVerticalLine or: [self hasWonXByDiagonalLine]]]"! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'BA 5/23/2019 20:01:20'!
hasWonOByDiagonalLine

	| aDiagonalSequence anotherDiagonalSequence |
	
	aDiagonalSequence := OrderedCollection with: 0@0 with: 1@1 with: 2@2.
	anotherDiagonalSequence := OrderedCollection with: 0@2 with: 1@1 with: 2@0.

	^(playsOfO difference: aDiagonalSequence) isEmpty or: [(playsOfO difference: anotherDiagonalSequence ) isEmpty]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'BA 5/23/2019 19:44:45'!
hasWonOByHorizontalLine

	^(((playsOfO at: 1) x = (playsOfO at: 2) x) and: [(playsOfO at: 2) x = (playsOfO at: 3) x])! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'BA 5/23/2019 19:43:20'!
hasWonOByVerticalLine
	
	^((playsOfO at: 1) y = (playsOfO at: 2) y) and: [(playsOfO at: 2) y = (playsOfO at: 3) y]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/21/2019 20:39:07'!
hasWonX

	^playsOfX size = 3 and: [self hasWonXByHorizontalLine or: [self hasWonXByVerticalLine or: [self hasWonXByDiagonalLine]]]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/21/2019 21:36:22'!
hasWonXByDiagonalLine

	| aDiagonalSequence anotherDiagonalSequence |
	
	aDiagonalSequence := OrderedCollection with: 0@0 with: 1@1 with: 2@2.
	anotherDiagonalSequence := OrderedCollection with: 0@2 with: 1@1 with: 2@0.

	^(playsOfX difference: aDiagonalSequence) isEmpty or: [(playsOfX difference: anotherDiagonalSequence ) isEmpty]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/20/2019 21:20:48'!
hasWonXByHorizontalLine

	^(((playsOfX at: 1) x = (playsOfX at: 2) x) and: [(playsOfX at: 2) x = (playsOfX at: 3) x])! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/20/2019 21:21:47'!
hasWonXByVerticalLine

	^((playsOfX at: 1) y = (playsOfX at: 2) y) and: [(playsOfX at: 2) y = (playsOfX at: 3) y]! !


!TerniLapilli methodsFor: 'testing' stamp: 'AMS 5/21/2019 20:30:40'!
hasFinished


	^hasFinished! !


!TerniLapilli methodsFor: 'initialization' stamp: 'AMS 5/21/2019 20:30:52'!
initialize

	currentTurn := #X.
	playsOfX := OrderedCollection new.
	playsOfO := OrderedCollection new.
	hasFinished := false.! !


!TerniLapilli methodsFor: 'playing - private' stamp: 'AMS 5/20/2019 20:30:51'!
isValid: aPosition

	^(aPosition x < 0) or: (aPosition x > 2) or: (aPosition y < 0) or: (aPosition y > 2)! !


!TerniLapilli methodsFor: 'playing' stamp: 'BA 5/23/2019 19:39:28'!
putOAt: aPosition

	(#O = currentTurn) ifFalse: [^self raiseNotYourTurnException].
	(self isValid: aPosition) ifTrue: [^self raiseInvalidPositionException].
	(playsOfX includes: aPosition) ifTrue: [^self raiseNonEmptyPositionException].
	(playsOfO includes: aPosition) ifTrue: [^self raiseNonEmptyPositionException].

	playsOfO add: aPosition.
	currentTurn := #X.
	self hasWonO ifTrue: [
		hasFinished := true.
		winner := #O
	]! !

!TerniLapilli methodsFor: 'playing' stamp: 'AMS 5/21/2019 20:32:19'!
putXAt: aPosition

	(#X = currentTurn) ifFalse: [^self raiseNotYourTurnException].
	(self isValid: aPosition) ifTrue: [^self raiseInvalidPositionException].
	(playsOfX includes: aPosition) ifTrue: [^self raiseNonEmptyPositionException].
	(playsOfO includes: aPosition) ifTrue: [^self raiseNonEmptyPositionException].

	playsOfX add: aPosition.
	currentTurn := #O.
	self hasWonX ifTrue: [
		hasFinished := true.
		winner := #X
	]! !


!TerniLapilli methodsFor: 'accessing' stamp: 'AMS 5/20/2019 17:59:30'!
currentTurn

	^currentTurn! !

!TerniLapilli methodsFor: 'accessing' stamp: 'AMS 5/20/2019 20:22:14'!
playsOfO

	^playsOfO.! !

!TerniLapilli methodsFor: 'accessing' stamp: 'AMS 5/20/2019 20:22:10'!
playsOfX

	^playsOfX.! !

!TerniLapilli methodsFor: 'accessing' stamp: 'AMS 5/21/2019 20:34:13'!
winner

	^winner! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'exceptions' stamp: 'AMS 5/20/2019 17:55:39'!
invalidPositionErrorDescription
	
	^'invalid position'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'BA 5/23/2019 18:56:59'!
moreThanThreeTokensErrorDescription

	^''! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'BA 5/23/2019 19:13:55'!
nobodyWinErrorDescription
	
	^'nobody won until now.'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'AMS 5/20/2019 18:22:54'!
nonEmptyPositionErrorDescription
	
	^'non empty position'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'AMS 5/20/2019 18:16:10'!
notYourTurnErrorDescription
	
	^'not your turn'! !
