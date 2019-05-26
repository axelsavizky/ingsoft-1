!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:45:34'!
test01XStartsPuttingATokenAtMiddle
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 1@1.
	
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli playsOfX.
	self assert: (terniLapilli playsOfO) isEmpty.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:50:11'!
test02XStartsPuttingATokenAtACorner
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 0@0.
	
	self assert: (OrderedCollection with: 0@0) equals: terniLapilli playsOfX.
	self assert: (terniLapilli playsOfO) isEmpty.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:45:57'!
test03XCantPlayTwiceInARow
	
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:46:12'!
test04OPlaysAfterX
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 1@1.
	terniLapilli putOAt: 2@2.
	
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli playsOfX .
	self assert: (OrderedCollection with: 2@2) equals: terniLapilli playsOfO .
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:50:21'!
test05OPlaysAfterXInDifferentPosition
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	terniLapilli putXAt: 1@1.
	terniLapilli putOAt: 0@2.
	
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli playsOfX .
	self assert: (OrderedCollection with: 0@2) equals: terniLapilli playsOfO .
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:48:02'!
test06OCantStartPlaying
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
		
	self should: [terniLapilli putOAt: 1@1.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli notYourTurnErrorDescription.
	
	self assert: terniLapilli playsOfX isEmpty .
	self assert: terniLapilli playsOfO isEmpty.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:48:08'!
test07OCantPlayOnAPositionOccupiedByX
	
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:50:26'!
test08OCantPlayOnAnotherPositionOccupiedByX
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:48:26'!
test09XPlaysAfterO
	
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:48:35'!
test10XCantPlayOnAPositionOccupiedByHimself
	
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:48:44'!
test11XCantPlayOnAPositionOccupiedByO
	
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:48:52'!
test12OCantPlayOnAPositionOccupiedByHimself
	
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:48:58'!
test13XCantPlayOnAnInvalidPosition
	
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:50:39'!
test14XCantPlayOnAnotherInvalidPosition
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	self should: [terniLapilli putXAt: 3@-1.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli invalidPositionErrorDescription.
		
	self assert: (terniLapilli playsOfX) isEmpty.
	self assert: (terniLapilli playsOfO) isEmpty.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:49:15'!
test15OCantPlayOnAnInvalidPosition
	
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:49:24'!
test16XWonWithALeftVerticalLine

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:49:36'!
test17XWonWithAMiddleVerticalLine

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:50:49'!
test18XWonWithAnHorizontalLine

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:50:59'!
test19XWonWithADiagonalLine

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:51:07'!
test20XWonWithAnotherDiagonalLine

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:51:16'!
test21OWonWithAVerticalLine

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:51:31'!
test22OWonWithAnHorizontalLine

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:51:40'!
test23OWonWithADiagonalLine

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:51:48'!
test24OWonWithAnotherDiagonalLine

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:51:57'!
test25XCantPutATokenIfHeAlreadyPut3Tokens

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:52:07'!
test26OCantPutATokenIfXAlreadyWon

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:52:15'!
test27XCantSlideIfHeOnlyPutOneToken

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:52:22'!
test28XCantSlideIfHeOnlyPutTwoTokens

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:52:29'!
test29OCantSlideIfHeOnlyPutOneToken

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:52:35'!
test30OCantSlideIfHeOnlyPutTwoTokens

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:52:47'!
test31XCanSlideToThRightWhenHeAlreadyPut3Tokens

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:52:52'!
test32XCanSlideUpWheHeAlreadyPut3Tokens

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:53:01'!
test33XCanSlideDownWhenHeAlreadyPut3Tokens

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:53:11'!
test34XCanSlideToTheLeftWhenHeAlreadyPut3Tokens

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:53:20'!
test35OCanSlideToThRightWhenHeAlreadyPut3Tokens

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:53:28'!
test36OCanSlideUpWheHeAlreadyPut3Tokens

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:53:38'!
test37OCanSlideToTheLeftWhenHeAlreadyPut3Tokens

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:53:59'!
test38OCanSlideDownWhenHeAlreadyPut3Tokens

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:54:11'!
test39XCantSlideWhenOHasWon

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:54:20'!
test40OCantSlideWhenXHasWon

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:54:28'!
test41XCantSlideWhenItsNotHisTurn

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:54:41'!
test42OCantSlideWhenItsNotHisTurn

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:54:52'!
test43XCantSlideToAPositionOccupiedByO

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:55:01'!
test44XCantSlideToAPositionOccupiedByHimself

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:55:15'!
test45OCantSlideToAPositionOccupiedByX

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:55:29'!
test46OCantSlideToAPositionOccupiedByHimself

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:57:21'!
test47XCantSlideFromAnEmptyPosition

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:57:31'!
test48OCantSlideFromAnEmptyPosition

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:57:40'!
test49XCantSlideFromAPositionOccupiedByO

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:57:50'!
test50OCantSlideFromAPositionOccupiedByX

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:58:00'!
test51XCantSlideToAnInvalidPosition

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 20:01:18'!
test52XCantSlideToAnotherInvalidPosition
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:58:22'!
test53OCantSlideToAnInvalidPosition

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 20:01:23'!
test54OCantSlideToAnotherInvalidPosition
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:59:20'!
test55OCantPutATokenIfHeAlreadyPutTokens

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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 19:59:57'!
test56XCantSlideToAPositionMoreThan1Length

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
	withMessageText: TerniLapilli cantSlideToMoreThan1LengthOfSourceErrorDescription .

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 20:01:31'!
test57XCantSlideToAnotherPositionMoreThan1Length
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"
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

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 20:00:44'!
test58OCantSlideToAPositionMoreThan1Length

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
	withMessageText: TerniLapilli cantSlideToMoreThan1LengthOfSourceErrorDescription .

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli playsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli playsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 20:01:34'!
test59OCantSlideToAnotherPositionMoreThan1Length
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"
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


!TerniLapilli methodsFor: 'playing - private' stamp: 'AMS 5/26/2019 19:43:52'!
aPosition: aPosition isMoreThan1LengthOf: anotherPosition
	
	| xDifference yDifference |
	
	xDifference := anotherPosition x - aPosition x.
	yDifference := anotherPosition y - aPosition y.
	
	^xDifference abs + yDifference abs > 1! !

!TerniLapilli methodsFor: 'playing - private' stamp: 'BA 5/26/2019 17:35:09'!
isInvalidPosition: aPosition

	^(aPosition x < 0) or: (aPosition x > 2) or: (aPosition y < 0) or: (aPosition y > 2)! !


!TerniLapilli methodsFor: 'sliding' stamp: 'AMS 5/26/2019 19:42:34'!
slideOFrom: aPosition to: aPositionToSlide 
	
	(#O = currentTurn) ifFalse: [^self raiseNotYourTurnException].
	(playsOfO size < 3) ifTrue: [^self raiseCantSlideException].
	(self hasWonX) ifTrue: [^self raiseCantSlideIfSomeoneWonException].
	(playsOfX includes: aPositionToSlide) ifTrue: [^self raiseNonEmptyPositionException].
	(playsOfO includes: aPositionToSlide) ifTrue: [^self raiseNonEmptyPositionException].
	((playsOfX includes: aPosition) or: [playsOfO includes: aPosition]) ifFalse: [^self raiseEmptySourcePointException].
	(playsOfO includes: aPosition) ifFalse: [^self raiseSourcePointIsXException].
	(self isInvalidPosition: aPositionToSlide) ifTrue: [^self raiseInvalidPositionException].
	(self aPosition: aPosition isMoreThan1LengthOf: aPositionToSlide) ifTrue: [^self raiseCantSlideToMoreThan1LengthOfSourceException].
	
	playsOfO remove: aPosition.
	playsOfO add: aPositionToSlide.
	currentTurn := #X.! !

!TerniLapilli methodsFor: 'sliding' stamp: 'AMS 5/26/2019 19:42:24'!
slideXFrom: aPosition to: aPositionToSlide 
	
	(#X = currentTurn) ifFalse: [^self raiseNotYourTurnException].
	(playsOfX size < 3) ifTrue: [^self raiseCantSlideException].
	(self hasWonO) ifTrue: [^self raiseCantSlideIfSomeoneWonException].
	(playsOfX includes: aPositionToSlide) ifTrue: [^self raiseNonEmptyPositionException].
	(playsOfO includes: aPositionToSlide) ifTrue: [^self raiseNonEmptyPositionException].
	((playsOfX includes: aPosition) or: [playsOfO includes: aPosition]) ifFalse: [^self raiseEmptySourcePointException].
	(playsOfX includes: aPosition) ifFalse: [^self raiseSourcePointIsOException].
	(self isInvalidPosition: aPositionToSlide) ifTrue: [^self raiseInvalidPositionException].
	(self aPosition: aPosition isMoreThan1LengthOf: aPositionToSlide) ifTrue: [^self raiseCantSlideToMoreThan1LengthOfSourceException].

	playsOfX remove: aPosition.
	playsOfX add: aPositionToSlide.
	currentTurn := #O.! !


!TerniLapilli methodsFor: 'putting' stamp: 'BA 5/26/2019 18:25:27'!
putOAt: aPosition

	(#O = currentTurn) ifFalse: [^self raiseNotYourTurnException].
	(self isInvalidPosition: aPosition) ifTrue: [^self raiseInvalidPositionException].
	(playsOfX includes: aPosition) ifTrue: [^self raiseNonEmptyPositionException].
	(playsOfO includes: aPosition) ifTrue: [^self raiseNonEmptyPositionException].
	(playsOfO size > 2) ifTrue: [^self raiseMoreThanThreeTokensException].
	(self hasWonX) ifTrue:[^self raiseGameOverException].

	playsOfO add: aPosition.
	currentTurn := #X.! !

!TerniLapilli methodsFor: 'putting' stamp: 'BA 5/26/2019 17:35:42'!
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
