!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:15:47'!
test01
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 1@1.
	
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli playsOfX.
	self assert: (terniLapilli playsOfO) isEmpty.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:15:58'!
test02
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	
	self assert: (OrderedCollection with: 0@0) equals: terniLapilli playsOfX.
	self assert: (terniLapilli playsOfO) isEmpty.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:16:03'!
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
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:16:09'!
test04
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 1@1.
	terniLapilli putOAt: 2@2.
	
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli playsOfX .
	self assert: (OrderedCollection with: 2@2) equals: terniLapilli playsOfO .
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:16:14'!
test05
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 1@1.
	terniLapilli putOAt: 0@2.
	
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli playsOfX .
	self assert: (OrderedCollection with: 0@2) equals: terniLapilli playsOfO .
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:16:27'!
test06
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
		
	self should: [terniLapilli putOAt: 1@1.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli notYourTurnErrorDescription.
	
	self assert: terniLapilli playsOfX isEmpty .
	self assert: terniLapilli playsOfO isEmpty.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:16:41'!
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
	self deny: terniLapilli someoneWon.
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:16:47'!
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
	self deny: terniLapilli someoneWon.
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:16:53'!
test09
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 2@0.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 2@2.
		
	self assert: (OrderedCollection with: 2@0 with: 2@2) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 1@2) equals: terniLapilli playsOfO.	
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:16:58'!
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
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:17:03'!
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
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:17:15'!
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
	self deny: terniLapilli someoneWon.
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:17:48'!
test13
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	self should: [terniLapilli putXAt: -1@3.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli invalidPositionErrorDescription.
		
	self assert: (terniLapilli playsOfX) isEmpty.
	self assert: (terniLapilli playsOfO) isEmpty.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:17:55'!
test14
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	self should: [terniLapilli putXAt: 3@-1.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli invalidPositionErrorDescription.
		
	self assert: (terniLapilli playsOfX) isEmpty.
	self assert: (terniLapilli playsOfO) isEmpty.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:18:00'!
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
	self deny: terniLapilli someoneWon.
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 22:13:19'!
test16
	"X gana en forma vertical 1"
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
	self assert: terniLapilli hasWonX.
	self deny: terniLapilli hasWonO.
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 22:13:35'!
test17
	"X gana en forma vertical 2"
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
	self assert: terniLapilli hasWonX.
	self deny: terniLapilli hasWonO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 22:13:43'!
test18
	"X gana en forma horizontal"
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
	self assert: terniLapilli hasWonX.
	self deny: terniLapilli hasWonO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:25:34'!
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
	self assert: terniLapilli hasWonX.
	self deny: terniLapilli hasWonO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:25:39'!
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
	self assert: terniLapilli hasWonX.
	self deny: terniLapilli hasWonO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 22:13:51'!
test21
	"O gana en forma vertical 1"
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
	self assert: terniLapilli hasWonO.
	self deny: terniLapilli hasWonX.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 22:14:11'!
test22
	"O gana en forma horizontal 1"
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
	self assert: terniLapilli hasWonO.
	self deny: terniLapilli hasWonX.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:26:23'!
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
	self assert: terniLapilli hasWonO.
	self deny: terniLapilli hasWonX.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 18:26:28'!
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
	self assert: terniLapilli hasWonO.
	self deny: terniLapilli hasWonX.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 22:43:29'!
test25
	"X no puede poner un token si ya puso 3 tokens"
	| terniLapilli |

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
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 22:53:11'!
test26
	"O no puede poner un token si X ya gano"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 1@0.
	terniLapilli putXAt: 0@1.
	terniLapilli putOAt: 1@1.
	terniLapilli putXAt: 0@2.
	
	self should: [terniLapilli putOAt: 2@1.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli gameIsOverErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@1 with: 0@2) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 1@0 with: 1@1) equals: terniLapilli playsOfO.
	self assert: terniLapilli hasWonX.
	self deny: terniLapilli hasWonO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 22:53:03'!
test27
	"X no puede deslizar si solo puso 1 token"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@2.
		
	self should: [terniLapilli slideXFrom: 0@0 to: 1@0.] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli cantSlideErrorDescription.
	
	self assert: (OrderedCollection with: 0@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 22:52:58'!
test28
	"X no puede deslizar si solo puso 2 tokens"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@2.
	terniLapilli putXAt: 2@1.
	terniLapilli putOAt: 1@1.
		
	self should: [terniLapilli slideXFrom: 2@1 to: 2@2.] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli cantSlideErrorDescription.
	
	self assert: (OrderedCollection with: 0@0 with: 2@1) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@2 with: 1@1) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli hasWonO.
	self deny: terniLapilli hasWonX.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 22:52:53'!
test29
	"O no puede deslizar si solo puso 1 token"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@2.
	terniLapilli putXAt: 2@1.
		
	self should: [terniLapilli slideOFrom: 0@2 to: 0@1.] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli cantSlideErrorDescription.
	
	self assert: (OrderedCollection with: 0@0 with: 2@1) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 22:52:46'!
test30
	"O no puede deslizar si solo puso 2 tokens"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@2.
	terniLapilli putXAt: 2@1.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@1.
		
	self should: [terniLapilli slideOFrom: 1@2 to: 2@2.] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli cantSlideErrorDescription.
	
	self assert: (OrderedCollection with: 0@0 with: 2@1 with: 1@1) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@2 with: 1@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 16:43:16'!
test31
	"Como X y O terminaron de poner las 3 fichas y ninguno gano, X puede deslizar hacia la derecha mientras sea valido"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 2@2.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 2@1.
	terniLapilli putXAt: 1@1.
	terniLapilli putOAt: 1@0.
	terniLapilli slideXFrom: 0@2 to: 1@2.

	self assert: (OrderedCollection with: 0@0 with: 1@1 with: 1@2) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 2@2 with: 2@1 with: 1@0) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 22:52:28'!
test32
	"Como X y O terminaron de poner las 3 fichas y ninguno gano, X puede deslizar hacia arriba mientras sea valido"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	terniLapilli slideXFrom: 1@0 to: 1@1.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@1) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 22:52:13'!
test33
	"Como X y O terminaron de poner las 3 fichas y ninguno gano, X puede deslizar hacia abajo mientras sea valido"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@1.
	terniLapilli putOAt: 2@2.
	terniLapilli slideXFrom: 1@1 to: 1@0.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/25/2019 22:51:58'!
test34
	"Como X y O terminaron de poner las 3 fichas y ninguno gano, X puede deslizar hacia la izquierda mientras sea valido"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 2@0.
	terniLapilli putOAt: 2@2.
	terniLapilli slideXFrom: 2@0 to: 1@0.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 16:07:42'!
test35
	"Como X y O terminaron de poner las 3 fichas y ninguno gano, O puede deslizar hacia la derecha mientras sea valido"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@1.
	terniLapilli putOAt: 0@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 2@2.
	terniLapilli putOAt: 1@1.
	terniLapilli slideXFrom: 0@1 to: 0@0.
	terniLapilli slideOFrom: 1@1 to: 2@1.

	self assert: (OrderedCollection with: 1@0 with: 2@2 with: 0@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@2 with: 1@2 with: 2@1) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 16:06:27'!
test36
	"Como X y O terminaron de poner las 3 fichas y ninguno gano, O puede deslizar hacia arriba mientras sea valido"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@1.
	terniLapilli putOAt: 0@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@1.
	terniLapilli putXAt: 2@2.
	terniLapilli putOAt: 1@1.
	terniLapilli slideXFrom: 0@1 to: 0@0.
	terniLapilli slideOFrom: 1@1 to: 1@2.

	self assert: (OrderedCollection with: 1@0 with: 2@2 with: 0@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@2 with: 2@1 with: 1@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 16:07:04'!
test37
	"Como X y O terminaron de poner las 3 fichas y ninguno gano, O puede deslizar hacia la izquierda mientras sea valido"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@1.
	terniLapilli putOAt: 0@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@1.
	terniLapilli putXAt: 2@2.
	terniLapilli putOAt: 1@1.
	terniLapilli slideXFrom: 0@1 to: 0@0.
	terniLapilli slideOFrom: 1@1 to: 0@1.

	self assert: (OrderedCollection with: 1@0 with: 2@2 with: 0@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@2 with: 2@1 with: 0@1) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 19:06:25'!
test371
	"Como X y O terminaron de poner las 3 fichas y ninguno gano, O puede deslizar hacia abajo mientras sea valido"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@1.
	terniLapilli putOAt: 0@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@1.
	terniLapilli putXAt: 2@2.
	terniLapilli putOAt: 1@1.
	terniLapilli slideXFrom: 0@1 to: 0@0.
	terniLapilli slideOFrom: 2@1 to: 2@0.

	self assert: (OrderedCollection with: 1@0 with: 2@2 with: 0@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@2 with: 1@1 with: 2@0) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 16:10:53'!
test38
	"Si O gano, X no puede deslizar"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@2. 
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 2@0.
	terniLapilli putOAt: 1@1.
	terniLapilli putXAt: 2@2.
	terniLapilli putOAt: 2@1.
	
	self should: [terniLapilli slideXFrom: 0@2 to: 1@2.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli cantSlideIfSomeoneWonErrorDescription.

	self assert: (OrderedCollection with: 0@2 with: 2@0 with: 2@2) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@1 with: 2@1) equals: terniLapilli playsOfO.
	self assert: terniLapilli hasWonO.
	self deny: terniLapilli hasWonX.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 16:46:10'!
test39
	"Si X gano, O no puede deslizar"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 2@2.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 2@1.
	terniLapilli putXAt: 1@1.
	terniLapilli putOAt: 1@0.
	terniLapilli slideXFrom: 1@1 to: 0@1.

	self should: [terniLapilli slideOFrom: 1@0 to: 2@0.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli cantSlideIfSomeoneWonErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 0@1) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 2@2 with: 2@1 with: 1@0) equals: terniLapilli playsOfO.
	self assert: terniLapilli hasWonX.
	self deny: terniLapilli hasWonO.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 16:48:33'!
test40
	"Si no es el turno de X, X no puede deslizar"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 2@0.
	terniLapilli putOAt: 2@2.
	terniLapilli slideXFrom: 2@0 to: 1@0.
	
	self should: [terniLapilli slideXFrom: 1@0 to: 2@0.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli notYourTurnErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 16:50:35'!
test41
	"Si no es el turno de O, O no puede deslizar"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 2@0.
	terniLapilli putOAt: 2@2.
	terniLapilli slideXFrom: 2@0 to: 1@0.
	terniLapilli slideOFrom: 2@2 to: 2@1.
	
	self should: [terniLapilli slideOFrom: 1@2 to: 1@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli notYourTurnErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@1) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 16:56:11'!
test42
	"X no puede deslizar a una posicion ocupada por O"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 2@0.
	terniLapilli putOAt: 2@2.
	
	self should: [terniLapilli slideXFrom: 0@0 to: 0@1..] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli nonEmptyPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 16:57:57'!
test43
	"X no puede deslizar a una posicion ocupada por X"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	
	self should: [terniLapilli slideXFrom: 1@0 to: 0@0.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli nonEmptyPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 16:59:57'!
test44
	"O no puede deslizar a una posicion ocupada por X"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	terniLapilli slideXFrom: 1@0 to: 1@1.
	
	self should: [terniLapilli slideOFrom: 0@1 to: 0@0.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli nonEmptyPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@1) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 17:00:42'!
test45
	"O no puede deslizar a una posicion ocupada por O"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	terniLapilli slideXFrom: 1@0 to: 1@1.
	
	self should: [terniLapilli slideOFrom: 2@2 to: 1@2.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli nonEmptyPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@1) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 17:05:50'!
test46
	"X no puede deslizar desde una posicion vacia"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	
	self should: [terniLapilli slideXFrom: 1@1 to: 2@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli emptySourcePointErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 17:10:49'!
test47
	"O no puede deslizar desde una posicion vacia"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	terniLapilli slideXFrom: 1@0 to: 2@0.
	
	self should: [terniLapilli slideOFrom: 1@1 to: 2@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli emptySourcePointErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 17:19:52'!
test48
	"X no puede deslizar desde una posicion de O"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	
	self should: [terniLapilli slideXFrom: 2@2 to: 2@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli sourcePointIsOErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 17:21:25'!
test49
	"O no puede deslizar desde una posicion de X"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	terniLapilli slideXFrom: 1@0 to: 2@0.
	
	self should: [terniLapilli slideOFrom: 2@0 to: 2@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli sourcePointIsXErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 17:36:14'!
test50
	"X no se puede deslizar a una posicion invalida, es decir, salida del tablero 1"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	
	self should: [terniLapilli slideXFrom: 0@0 to: -1@-6.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli invalidPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 17:36:29'!
test51
	"X no se puede deslizar a una posicion invalida, es decir, salida del tablero 2"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	
	self should: [terniLapilli slideXFrom: 0@0 to: 4@2.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli invalidPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 17:38:22'!
test52
	"O no se puede deslizar a una posicion invalida, es decir, salida del tablero 1"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	terniLapilli slideXFrom: 1@0 to: 2@0.
	
	self should: [terniLapilli slideOFrom: 2@2 to: 2@3.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli invalidPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 17:39:23'!
test53
	"O no se puede deslizar a una posicion invalida, es decir, salida del tablero 2"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	terniLapilli slideXFrom: 1@0 to: 2@0.
	
	self should: [terniLapilli slideOFrom: 0@1 to: -1@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli invalidPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 18:24:11'!
test54
	"O no puede poner un token si cada uno ya puso tres tokens"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	terniLapilli slideXFrom: 1@0 to: 2@0.
	
	self should: [terniLapilli putOAt: 1@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli moreThanThreeTokensErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 18:29:35'!
test55
	"X no puede deslizar un token en diagonal"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	
	self should: [terniLapilli slideXFrom: 0@0 to: 1@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli cantSlideDiagonallyErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 18:56:41'!
test56
	"O no puede deslizar un token en diagonal"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 1@0.
	terniLapilli putOAt: 2@2.
	terniLapilli slideXFrom: 1@0 to: 2@0.
	
	self should: [terniLapilli slideOFrom: 2@2 to: 1@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli cantSlideDiagonallyErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 19:29:50'!
test57
	"X no puede deslizar un token a longitud 2 del origen"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 1@2.
	terniLapilli putXAt: 2@2.
	terniLapilli putOAt: 1@0.
	
	self should: [terniLapilli slideXFrom: 2@2 to: 2@0.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli cantSlideToMoreThan1LengthOfSourceErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@2) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 1@0) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 19:31:53'!
test58
	"O no puede deslizar un token a longitud 2 del origen"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	terniLapilli putOAt: 0@1.
	terniLapilli putXAt: 0@2.
	terniLapilli putOAt: 2@2.
	terniLapilli putXAt: 2@1.
	terniLapilli putOAt: 1@0.
	terniLapilli slideXFrom: 2@1 to: 2@0.
	
	self should: [terniLapilli slideOFrom: 1@0 to: 1@2.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli cantSlideToMoreThan1LengthOfSourceErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 2@2 with: 1@0) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'currentTurn playsOfX playsOfO'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'exceptions' stamp: 'BA 5/26/2019 18:29:57'!
raiseCantSlideDiagonallyException

	^self error: self class cantSlideDiagonallyErrorDescription ! !

!TerniLapilli methodsFor: 'exceptions' stamp: 'BA 5/25/2019 21:06:07'!
raiseCantSlideException

	^self error: self class cantSlideErrorDescription ! !

!TerniLapilli methodsFor: 'exceptions' stamp: 'BA 5/26/2019 16:04:09'!
raiseCantSlideIfSomeoneWonException

	^self error: self class cantSlideIfSomeoneWonErrorDescription ! !

!TerniLapilli methodsFor: 'exceptions' stamp: 'BA 5/26/2019 19:12:43'!
raiseCantSlideToMoreThan1LengthOfSourceException

	^self error: self class cantSlideToMoreThan1LengthOfSourceErrorDescription ! !

!TerniLapilli methodsFor: 'exceptions' stamp: 'BA 5/26/2019 17:07:19'!
raiseEmptySourcePointException

	^self error: self class emptySourcePointErrorDescription ! !

!TerniLapilli methodsFor: 'exceptions' stamp: 'BA 5/25/2019 18:06:11'!
raiseGameOverException

	^self error: self class gameIsOverErrorDescription ! !

!TerniLapilli methodsFor: 'exceptions' stamp: 'AMS 5/20/2019 17:58:52'!
raiseInvalidPositionException

	^self error: self class invalidPositionErrorDescription! !

!TerniLapilli methodsFor: 'exceptions' stamp: 'BA 5/25/2019 21:27:15'!
raiseMoreThanThreeTokensException

	^self error: self class moreThanThreeTokensErrorDescription ! !

!TerniLapilli methodsFor: 'exceptions' stamp: 'AMS 5/20/2019 18:23:58'!
raiseNonEmptyPositionException

	^self error: self class nonEmptyPositionErrorDescription ! !

!TerniLapilli methodsFor: 'exceptions' stamp: 'AMS 5/20/2019 18:17:34'!
raiseNotYourTurnException

	^self error: self class notYourTurnErrorDescription ! !

!TerniLapilli methodsFor: 'exceptions' stamp: 'BA 5/26/2019 17:18:34'!
raiseSourcePointIsOException

	^self error: self class sourcePointIsOErrorDescription ! !

!TerniLapilli methodsFor: 'exceptions' stamp: 'BA 5/26/2019 17:19:31'!
raiseSourcePointIsXException

	^self error: self class sourcePointIsXErrorDescription ! !


!TerniLapilli methodsFor: 'testing - private' stamp: 'BA 5/23/2019 20:01:20'!
hasWonOByDiagonalLine

	| aDiagonalSequence anotherDiagonalSequence |
	
	aDiagonalSequence := OrderedCollection with: 0@0 with: 1@1 with: 2@2.
	anotherDiagonalSequence := OrderedCollection with: 0@2 with: 1@1 with: 2@0.

	^(playsOfO difference: aDiagonalSequence) isEmpty or: [(playsOfO difference: anotherDiagonalSequence ) isEmpty]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'BA 5/25/2019 22:11:43'!
hasWonOByHorizontalLine
	
	^((playsOfO at: 1) y = (playsOfO at: 2) y) and: [(playsOfO at: 2) y = (playsOfO at: 3) y]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'BA 5/25/2019 22:12:22'!
hasWonOByVerticalLine

	^(((playsOfO at: 1) x = (playsOfO at: 2) x) and: [(playsOfO at: 2) x = (playsOfO at: 3) x])! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/21/2019 21:36:22'!
hasWonXByDiagonalLine

	| aDiagonalSequence anotherDiagonalSequence |
	
	aDiagonalSequence := OrderedCollection with: 0@0 with: 1@1 with: 2@2.
	anotherDiagonalSequence := OrderedCollection with: 0@2 with: 1@1 with: 2@0.

	^(playsOfX difference: aDiagonalSequence) isEmpty or: [(playsOfX difference: anotherDiagonalSequence ) isEmpty]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'BA 5/25/2019 22:13:01'!
hasWonXByHorizontalLine

	^(((playsOfX at: 1) y = (playsOfX at: 2) y) and: [(playsOfX at: 2) y = (playsOfX at: 3) y])! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'BA 5/25/2019 22:12:51'!
hasWonXByVerticalLine

	^((playsOfX at: 1) x = (playsOfX at: 2) x) and: [(playsOfX at: 2) x = (playsOfX at: 3) x]! !


!TerniLapilli methodsFor: 'testing' stamp: 'BA 5/25/2019 17:01:11'!
hasWonO

	^playsOfO size = 3 and: [self hasWonOByHorizontalLine or: [self hasWonOByVerticalLine or: [self hasWonOByDiagonalLine]]]
! !

!TerniLapilli methodsFor: 'testing' stamp: 'AMS 5/21/2019 20:39:07'!
hasWonX

	^playsOfX size = 3 and: [self hasWonXByHorizontalLine or: [self hasWonXByVerticalLine or: [self hasWonXByDiagonalLine]]]! !

!TerniLapilli methodsFor: 'testing' stamp: 'BA 5/25/2019 18:01:35'!
someoneWon

	^self hasWonO or: [self hasWonX]! !


!TerniLapilli methodsFor: 'initialization' stamp: 'BA 5/25/2019 17:19:30'!
initialize

	currentTurn := #X.
	playsOfX := OrderedCollection new.
	playsOfO := OrderedCollection new.! !


!TerniLapilli methodsFor: 'playing - private' stamp: 'BA 5/26/2019 18:53:57'!
aPosition: aPosition isDiagonalTo: anotherPosition

	| upRightDiagonalPosition upLeftDiagonalPosition downRightDiagonalPosition downLeftDiagonalPosition | 
	
	upRightDiagonalPosition := (aPosition x+1)@(aPosition y+1).
	upLeftDiagonalPosition := (aPosition x-1)@(aPosition y+1).
	downRightDiagonalPosition := (aPosition x+1)@(aPosition y-1).
	downLeftDiagonalPosition := (aPosition x-1)@(aPosition y-1).

	^(upRightDiagonalPosition = anotherPosition) or: (upLeftDiagonalPosition = anotherPosition) or: (downRightDiagonalPosition = anotherPosition) or:
	(downLeftDiagonalPosition = anotherPosition).! !

!TerniLapilli methodsFor: 'playing - private' stamp: 'BA 5/26/2019 19:29:06'!
aPosition: aPosition isMoreThan1LengthOf: anotherPosition
	
	| xDifference yDifference |
	
	xDifference := anotherPosition x - aPosition x.
	yDifference := anotherPosition y - aPosition y.
	
	^(xDifference abs > 1) or: (yDifference abs > 1)! !

!TerniLapilli methodsFor: 'playing - private' stamp: 'BA 5/26/2019 17:35:09'!
isInvalidPosition: aPosition

	^(aPosition x < 0) or: (aPosition x > 2) or: (aPosition y < 0) or: (aPosition y > 2)! !


!TerniLapilli methodsFor: 'sliding' stamp: 'BA 5/26/2019 19:32:13'!
slideOFrom: aPosition to: aPositionToSlide 
	
	(#O = currentTurn) ifFalse: [^self raiseNotYourTurnException].
	(playsOfO size < 3) ifTrue: [^self raiseCantSlideException].
	(self hasWonX) ifTrue: [^self raiseCantSlideIfSomeoneWonException].
	(playsOfX includes: aPositionToSlide) ifTrue: [^self raiseNonEmptyPositionException].
	(playsOfO includes: aPositionToSlide) ifTrue: [^self raiseNonEmptyPositionException].
	((playsOfX includes: aPosition) or: [playsOfO includes: aPosition]) ifFalse: [^self raiseEmptySourcePointException].
	(playsOfO includes: aPosition) ifFalse: [^self raiseSourcePointIsXException].
	(self isInvalidPosition: aPositionToSlide) ifTrue: [^self raiseInvalidPositionException].
	(self aPosition: aPosition isDiagonalTo: aPositionToSlide) ifTrue: [^self raiseCantSlideDiagonallyException].
	(self aPosition: aPosition isMoreThan1LengthOf: aPositionToSlide) ifTrue: [^self raiseCantSlideToMoreThan1LengthOfSourceException].
	
	playsOfO remove: aPosition.
	playsOfO add: aPositionToSlide.
	currentTurn := #X.! !

!TerniLapilli methodsFor: 'sliding' stamp: 'BA 5/26/2019 19:16:20'!
slideXFrom: aPosition to: aPositionToSlide 
	
	(#X = currentTurn) ifFalse: [^self raiseNotYourTurnException].
	(playsOfX size < 3) ifTrue: [^self raiseCantSlideException].
	(self hasWonO) ifTrue: [^self raiseCantSlideIfSomeoneWonException].
	(playsOfX includes: aPositionToSlide) ifTrue: [^self raiseNonEmptyPositionException].
	(playsOfO includes: aPositionToSlide) ifTrue: [^self raiseNonEmptyPositionException].
	((playsOfX includes: aPosition) or: [playsOfO includes: aPosition]) ifFalse: [^self raiseEmptySourcePointException].
	(playsOfX includes: aPosition) ifFalse: [^self raiseSourcePointIsOException].
	(self isInvalidPosition: aPositionToSlide) ifTrue: [^self raiseInvalidPositionException].
	(self aPosition: aPosition isDiagonalTo: aPositionToSlide) ifTrue: [^self raiseCantSlideDiagonallyException].
	(self aPosition: aPosition isMoreThan1LengthOf: aPositionToSlide) ifTrue: [^self raiseCantSlideToMoreThan1LengthOfSourceException].

	playsOfX remove: aPosition.
	playsOfX add: aPositionToSlide.
	currentTurn := #O.! !


!TerniLapilli methodsFor: 'puting' stamp: 'BA 5/26/2019 18:25:27'!
putOAt: aPosition

	(#O = currentTurn) ifFalse: [^self raiseNotYourTurnException].
	(self isInvalidPosition: aPosition) ifTrue: [^self raiseInvalidPositionException].
	(playsOfX includes: aPosition) ifTrue: [^self raiseNonEmptyPositionException].
	(playsOfO includes: aPosition) ifTrue: [^self raiseNonEmptyPositionException].
	(playsOfO size > 2) ifTrue: [^self raiseMoreThanThreeTokensException].
	(self hasWonX) ifTrue:[^self raiseGameOverException].

	playsOfO add: aPosition.
	currentTurn := #X.! !

!TerniLapilli methodsFor: 'puting' stamp: 'BA 5/26/2019 17:35:42'!
putXAt: aPosition

	(#X = currentTurn) ifFalse: [^self raiseNotYourTurnException].
	(self isInvalidPosition: aPosition) ifTrue: [^self raiseInvalidPositionException].
	(playsOfX includes: aPosition) ifTrue: [^self raiseNonEmptyPositionException].
	(playsOfO includes: aPosition) ifTrue: [^self raiseNonEmptyPositionException].
	(playsOfX size > 2) ifTrue: [^self raiseMoreThanThreeTokensException].

	playsOfX add: aPosition.
	currentTurn := #O.! !


!TerniLapilli methodsFor: 'accessing' stamp: 'AMS 5/20/2019 17:59:30'!
currentTurn

	^currentTurn! !

!TerniLapilli methodsFor: 'accessing' stamp: 'AMS 5/20/2019 20:22:14'!
playsOfO

	^playsOfO.! !

!TerniLapilli methodsFor: 'accessing' stamp: 'AMS 5/20/2019 20:22:10'!
playsOfX

	^playsOfX.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'exceptions' stamp: 'BA 5/26/2019 18:29:26'!
cantSlideDiagonallyErrorDescription

	^'you cant slide diagonally'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'BA 5/25/2019 21:02:10'!
cantSlideErrorDescription

	^'you cant slide if you did not put three tokens'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'BA 5/26/2019 16:03:47'!
cantSlideIfSomeoneWonErrorDescription

	^'you cant slide if someone won'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'BA 5/26/2019 19:12:20'!
cantSlideToMoreThan1LengthOfSourceErrorDescription

	^'you cant slide to more than 1 length of source position'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'BA 5/26/2019 17:06:29'!
emptySourcePointErrorDescription

	^'you cant slide if you did not put three tokens'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'BA 5/25/2019 17:59:26'!
gameIsOverErrorDescription
	
	^'the game is over.'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'AMS 5/20/2019 17:55:39'!
invalidPositionErrorDescription
	
	^'invalid position'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'BA 5/25/2019 17:58:36'!
moreThanThreeTokensErrorDescription

	^'already put more than three tokens'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'AMS 5/20/2019 18:22:54'!
nonEmptyPositionErrorDescription
	
	^'non empty position'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'AMS 5/20/2019 18:16:10'!
notYourTurnErrorDescription
	
	^'not your turn'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'BA 5/26/2019 17:19:14'!
sourcePointIsOErrorDescription

	^'you cant slide if the source point is a O token.'! !

!TerniLapilli class methodsFor: 'exceptions' stamp: 'BA 5/26/2019 17:19:22'!
sourcePointIsXErrorDescription

	^'you cant slide if the source point is a X token.'! !
