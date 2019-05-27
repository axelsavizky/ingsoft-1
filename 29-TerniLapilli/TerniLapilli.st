!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:21:54'!
test01XStartsPuttingATokenAtMiddle
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 1@1.
	positionsOfO := #().
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli positionsOfX.
	self assert: (terniLapilli positionsOfO) isEmpty.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:21:54'!
test02XStartsPuttingATokenAtACorner
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0.
	positionsOfO := #().
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self assert: (OrderedCollection with: 0@0) equals: terniLapilli positionsOfX.
	self assert: (terniLapilli positionsOfO) isEmpty.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:21:54'!
test03XCantPlayTwiceInARow
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 1@1.
	positionsOfO := #().
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli putXAt: 2@2.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli notYourTurnErrorDescription.
	
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli positionsOfX.
	self assert: terniLapilli positionsOfO isEmpty.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:21:54'!
test04OPlaysAfterX
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 1@1.
	positionsOfO := OrderedCollection with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli positionsOfX .
	self assert: (OrderedCollection with: 2@2) equals: terniLapilli positionsOfO .
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:21:54'!
test05OPlaysAfterXInDifferentPosition
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 1@1.
	positionsOfO := OrderedCollection with: 0@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli positionsOfX .
	self assert: (OrderedCollection with: 0@2) equals: terniLapilli positionsOfO .
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 22:30:05'!
test06OCantStartPlaying
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
		
	self should: [terniLapilli putOAt: 1@1.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli notYourTurnErrorDescription.
	
	self assert: terniLapilli positionsOfX isEmpty .
	self assert: terniLapilli positionsOfO isEmpty.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:22:59'!
test07OCantPlayOnAPositionOccupiedByX
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@2.
	positionsOfO := #().
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli putOAt: 0@2] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli nonEmptyPositionErrorDescription.
		
	self assert: (OrderedCollection with: 0@2) equals: terniLapilli positionsOfX.
	self assert: terniLapilli positionsOfO isEmpty.	
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:24:14'!
test08OCantPlayOnAnotherPositionOccupiedByX
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 2@0.
	positionsOfO := #().
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli putOAt: 2@0] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli nonEmptyPositionErrorDescription.
		
	self assert: (OrderedCollection with: 2@0) equals: terniLapilli positionsOfX.
	self assert: terniLapilli positionsOfO isEmpty.	
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:24:49'!
test09XPlaysAfterO
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 2@0 with: 2@2.
	positionsOfO := OrderedCollection with: 1@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
		
	self assert: (OrderedCollection with: 2@0 with: 2@2) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 1@2) equals: terniLapilli positionsOfO.	
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:25:10'!
test10XCantPlayOnAPositionOccupiedByHimself
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 2@0.
	positionsOfO := OrderedCollection with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli putXAt: 2@0] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli nonEmptyPositionErrorDescription.
		
	self assert: (OrderedCollection with: 2@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:25:32'!
test11XCantPlayOnAPositionOccupiedByO
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 2@0.
	positionsOfO := OrderedCollection with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli putXAt: 2@2] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli nonEmptyPositionErrorDescription.
		
	self assert: (OrderedCollection with: 2@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:26:23'!
test12OCantPlayOnAPositionOccupiedByHimself
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 2@0 with: 1@1.
	positionsOfO := OrderedCollection with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli putOAt: 2@2] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli nonEmptyPositionErrorDescription.
		
	self assert: (OrderedCollection with: 2@0 with: 1@1) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 22:30:06'!
test13XCantPlayOnAnInvalidPosition
	
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	self should: [terniLapilli putXAt: -1@3.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli invalidPositionErrorDescription.
		
	self assert: (terniLapilli positionsOfX) isEmpty.
	self assert: (terniLapilli positionsOfO) isEmpty.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'AMS 5/26/2019 22:30:05'!
test14XCantPlayOnAnotherInvalidPosition
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	
	self should: [terniLapilli putXAt: 3@-1.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli invalidPositionErrorDescription.
		
	self assert: (terniLapilli positionsOfX) isEmpty.
	self assert: (terniLapilli positionsOfO) isEmpty.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:28:29'!
test15OCantPlayOnAnInvalidPosition
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 1@1.
	positionsOfO := OrderedCollection new.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli putOAt: -1@-1.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli invalidPositionErrorDescription.
		
	self assert: (OrderedCollection with: 1@1) equals: terniLapilli positionsOfX.
	self assert: (terniLapilli positionsOfO) isEmpty.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:29:06'!
test16XWonWithALeftVerticalLine
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@1 with: 0@2.
	positionsOfO := OrderedCollection with: 2@2 with: 2@1.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.	
	
	self assert: (OrderedCollection with: 0@0 with: 0@1 with: 0@2) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 2@2 with: 2@1) equals: terniLapilli positionsOfO.
	self assert: terniLapilli hasWonX.
	self deny: terniLapilli hasWonO.
! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:29:45'!
test17XWonWithAMiddleVerticalLine
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 1@0 with: 1@1 with: 1@2.
	positionsOfO := OrderedCollection with: 2@2 with: 2@1.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self assert: (OrderedCollection with: 1@0 with: 1@1 with: 1@2) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 2@2 with: 2@1) equals: terniLapilli positionsOfO.
	self assert: terniLapilli hasWonX.
	self deny: terniLapilli hasWonO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:30:22'!
test18XWonWithAnHorizontalLine
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@1 with: 1@1 with: 2@1.
	positionsOfO := OrderedCollection with: 2@0 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.	
	
	self assert: (OrderedCollection with: 0@1 with: 1@1 with: 2@1) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 2@0 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: terniLapilli hasWonX.
	self deny: terniLapilli hasWonO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:30:48'!
test19XWonWithADiagonalLine
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 1@1 with: 2@2.
	positionsOfO := OrderedCollection with: 2@1 with: 2@0.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.	
	
	self assert: (OrderedCollection with: 0@0 with: 1@1 with: 2@2) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 2@1 with: 2@0) equals: terniLapilli positionsOfO.
	self assert: terniLapilli hasWonX.
	self deny: terniLapilli hasWonO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:31:10'!
test20XWonWithAnotherDiagonalLine
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@2 with: 1@1 with: 2@0.
	positionsOfO := OrderedCollection with: 2@1 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.	
	
	self assert: (OrderedCollection with: 0@2 with: 1@1 with: 2@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 2@1 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: terniLapilli hasWonX.
	self deny: terniLapilli hasWonO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:31:49'!
test21OWonWithAVerticalLine
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 1@0 with: 2@0 with: 2@2.
	positionsOfO := OrderedCollection with: 0@0 with: 0@1 with: 0@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self assert: (OrderedCollection with: 1@0 with: 2@0 with: 2@2) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@0 with: 0@1 with: 0@2) equals: terniLapilli positionsOfO.
	self assert: terniLapilli hasWonO.
	self deny: terniLapilli hasWonX.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:32:23'!
test22OWonWithAnHorizontalLine
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@2 with: 2@0 with: 2@2.
	positionsOfO := OrderedCollection with: 0@1 with: 1@1 with: 2@1.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.	
	
	self assert: (OrderedCollection with: 0@2 with: 2@0 with: 2@2) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@1 with: 2@1) equals: terniLapilli positionsOfO.
	self assert: terniLapilli hasWonO.
	self deny: terniLapilli hasWonX.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:33:07'!
test23OWonWithADiagonalLine

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@2 with: 2@1 with: 2@0.
	positionsOfO := OrderedCollection with: 0@0 with: 1@1 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self assert: (OrderedCollection with: 0@2 with: 2@1 with: 2@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@0 with: 1@1 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: terniLapilli hasWonO.
	self deny: terniLapilli hasWonX.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:33:51'!
test24OWonWithAnotherDiagonalLine
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 2@1 with: 2@2.
	positionsOfO := OrderedCollection with: 0@2 with: 1@1 with: 2@0.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.	
	
	self assert: (OrderedCollection with: 0@0 with: 2@1 with: 2@2) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@2 with: 1@1 with: 2@0) equals: terniLapilli positionsOfO.
	self assert: terniLapilli hasWonO.
	self deny: terniLapilli hasWonX.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:34:27'!
test25XCantPutATokenIfHeAlreadyPut3Tokens

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli putXAt: 2@0.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli moreThanThreeTokensErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:35:01'!
test26OCantPutATokenIfXAlreadyWon
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@1 with: 0@2.
	positionsOfO := OrderedCollection with: 1@0 with: 1@1.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli putOAt: 2@1.] 
		raise: Error - MessageNotUnderstood 
		withMessageText: TerniLapilli gameIsOverErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@1 with: 0@2) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 1@0 with: 1@1) equals: terniLapilli positionsOfO.
	self assert: terniLapilli hasWonX.
	self deny: terniLapilli hasWonO.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:35:21'!
test27XCantSlideIfHeOnlyPutOneToken
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0.
	positionsOfO := OrderedCollection with: 0@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
		
	self should: [terniLapilli slideXFrom: 0@0 to: 1@0.] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli cantSlideErrorDescription.
	
	self assert: (OrderedCollection with: 0@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@2) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:35:51'!
test28XCantSlideIfHeOnlyPutTwoTokens
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 2@1.
	positionsOfO := OrderedCollection with: 0@2 with: 1@1.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
		
	self should: [terniLapilli slideXFrom: 2@1 to: 2@2.] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli cantSlideErrorDescription.
	
	self assert: (OrderedCollection with: 0@0 with: 2@1) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@2 with: 1@1) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli hasWonO.
	self deny: terniLapilli hasWonX.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:36:23'!
test29OCantSlideIfHeOnlyPutOneToken

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 2@1.
	positionsOfO := OrderedCollection with: 0@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
		
	self should: [terniLapilli slideOFrom: 0@2 to: 0@1.] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli cantSlideErrorDescription.
	
	self assert: (OrderedCollection with: 0@0 with: 2@1) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@2) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:36:59'!
test30OCantSlideIfHeOnlyPutTwoTokens
	
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 2@1 with: 1@1.
	positionsOfO := OrderedCollection with: 0@2 with: 1@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
		
	self should: [terniLapilli slideOFrom: 1@2 to: 2@2.] 
		raise: Error - MessageNotUnderstood
		withMessageText: TerniLapilli cantSlideErrorDescription.
	
	self assert: (OrderedCollection with: 0@0 with: 2@1 with: 1@1) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@2 with: 1@2) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:37:39'!
test31XCanSlideToThRightWhenHeAlreadyPut3Tokens

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@1.
	positionsOfO := OrderedCollection with: 2@2 with: 2@1 with: 1@0.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 0@2 to: 1@2.

	self assert: (OrderedCollection with: 0@0 with: 1@1 with: 1@2) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 2@2 with: 2@1 with: 1@0) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:38:36'!
test32XCanSlideUpWheHeAlreadyPut3Tokens

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 1@0 to: 1@1.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@1) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:39:08'!
test33XCanSlideDownWhenHeAlreadyPut3Tokens

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@1.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 1@1 to: 1@0.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:39:32'!
test34XCanSlideToTheLeftWhenHeAlreadyPut3Tokens

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 2@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 2@0 to: 1@0.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:40:12'!
test35OCanSlideToThRightWhenHeAlreadyPut3Tokens

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@1 with: 1@0 with: 2@2.
	positionsOfO := OrderedCollection with: 0@2 with: 1@2 with: 1@1.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 0@1 to: 0@0.
	terniLapilli slideOFrom: 1@1 to: 2@1.

	self assert: (OrderedCollection with: 1@0 with: 2@2 with: 0@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@2 with: 1@2 with: 2@1) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:40:40'!
test36OCanSlideUpWheHeAlreadyPut3Tokens

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@1 with: 1@0 with: 2@2.
	positionsOfO := OrderedCollection with: 0@2 with: 2@1 with: 1@1.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 0@1 to: 0@0.
	terniLapilli slideOFrom: 1@1 to: 1@2.

	self assert: (OrderedCollection with: 1@0 with: 2@2 with: 0@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@2 with: 2@1 with: 1@2) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:41:16'!
test37OCanSlideToTheLeftWhenHeAlreadyPut3Tokens

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@1 with: 1@0 with: 2@2.
	positionsOfO := OrderedCollection with: 0@2 with: 2@1 with: 1@1.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 0@1 to: 0@0.
	terniLapilli slideOFrom: 1@1 to: 0@1.

	self assert: (OrderedCollection with: 1@0 with: 2@2 with: 0@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@2 with: 2@1 with: 0@1) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:46:48'!
test38OCanSlideDownWhenHeAlreadyPut3Tokens

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@1 with: 1@0 with: 1@1.
	positionsOfO := OrderedCollection with: 0@2 with: 2@2 with: 0@0.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 1@1 to: 1@2.
	terniLapilli slideOFrom: 2@2 to: 2@1.

	self assert: (OrderedCollection with: 0@1 with: 1@0 with: 1@2) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@2 with: 0@0 with: 2@1) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:47:37'!
test39XCantSlideWhenOHasWon

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@2 with: 2@0 with: 2@2.
	positionsOfO := OrderedCollection with: 0@1 with: 1@1 with: 2@1.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli slideXFrom: 0@2 to: 1@2.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli gameIsOverErrorDescription .

	self assert: (OrderedCollection with: 0@2 with: 2@0 with: 2@2) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@1 with: 2@1) equals: terniLapilli positionsOfO.
	self assert: terniLapilli hasWonO.
	self deny: terniLapilli hasWonX.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:48:11'!
test40OCantSlideWhenXHasWon

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@1.
	positionsOfO := OrderedCollection with: 2@2 with: 2@1 with: 1@0.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 1@1 to: 0@1.

	self should: [terniLapilli slideOFrom: 1@0 to: 2@0.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli gameIsOverErrorDescription .

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 0@1) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 2@2 with: 2@1 with: 1@0) equals: terniLapilli positionsOfO.
	self assert: terniLapilli hasWonX.
	self deny: terniLapilli hasWonO.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:48:43'!
test41XCantSlideWhenItsNotHisTurn

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 2@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 2@0 to: 1@0.
	
	self should: [terniLapilli slideXFrom: 1@0 to: 2@0.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli notYourTurnErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:49:13'!
test42OCantSlideWhenItsNotHisTurn

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 2@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 2@0 to: 1@0.
	terniLapilli slideOFrom: 2@2 to: 2@1.
	
	self should: [terniLapilli slideOFrom: 1@2 to: 1@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli notYourTurnErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@1) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:49:40'!
test43XCantSlideToAPositionOccupiedByO

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 2@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli slideXFrom: 0@0 to: 0@1..] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli nonEmptyPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:50:04'!
test44XCantSlideToAPositionOccupiedByHimself

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli slideXFrom: 1@0 to: 0@0.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli nonEmptyPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:50:28'!
test45OCantSlideToAPositionOccupiedByX

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 1@0 to: 1@1.
	
	self should: [terniLapilli slideOFrom: 0@1 to: 0@0.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli nonEmptyPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@1) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:50:59'!
test46OCantSlideToAPositionOccupiedByHimself

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 1@0 to: 1@1.
	
	self should: [terniLapilli slideOFrom: 2@2 to: 1@2.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli nonEmptyPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@1) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:51:25'!
test47XCantSlideFromAnEmptyPosition

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli slideXFrom: 1@1 to: 2@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli emptySourcePointErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:51:49'!
test48OCantSlideFromAnEmptyPosition

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 1@0 to: 2@0.
	
	self should: [terniLapilli slideOFrom: 1@1 to: 2@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli emptySourcePointErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:52:14'!
test49XCantSlideFromAPositionOccupiedByO

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli slideXFrom: 2@2 to: 2@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli sourcePointIsOErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:52:39'!
test50OCantSlideFromAPositionOccupiedByX

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 1@0 to: 2@0.
	
	self should: [terniLapilli slideOFrom: 2@0 to: 2@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli sourcePointIsXErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:53:03'!
test51XCantSlideToAnInvalidPosition

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli slideXFrom: 0@0 to: -1@-6.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli invalidPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:53:27'!
test52XCantSlideToAnotherInvalidPosition
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli slideXFrom: 0@0 to: 4@2.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli invalidPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:54:04'!
test53OCantSlideToAnInvalidPosition

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 1@0 to: 2@0.
	
	self should: [terniLapilli slideOFrom: 2@2 to: 2@3.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli invalidPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:54:29'!
test54OCantSlideToAnotherInvalidPosition
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 1@0 to: 2@0.
	
	self should: [terniLapilli slideOFrom: 0@1 to: -1@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli invalidPositionErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:55:03'!
test55OCantPutATokenIfHeAlreadyPutTokens

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 1@0 to: 2@0.
	
	self should: [terniLapilli putOAt: 1@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli moreThanThreeTokensErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:55:45'!
test56XCantSlideToAPositionMoreThan1Length

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli slideXFrom: 0@0 to: 1@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli cantSlideToMoreThan1LengthOfSourceErrorDescription .

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 1@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:56:15'!
test57XCantSlideToAnotherPositionMoreThan1Length
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 2@2.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 1@0.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	
	self should: [terniLapilli slideXFrom: 2@2 to: 2@0.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli cantSlideToMoreThan1LengthOfSourceErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@2) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 1@0) equals: terniLapilli positionsOfO.
	self assert: #X equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:56:46'!
test58OCantSlideToAPositionMoreThan1Length

	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 1@0.
	positionsOfO := OrderedCollection with: 0@1 with: 1@2 with: 2@2.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 1@0 to: 2@0.
	
	self should: [terniLapilli slideOFrom: 2@2 to: 1@1.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli cantSlideToMoreThan1LengthOfSourceErrorDescription .

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 1@2 with: 2@2) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !

!TerniLapilliTest methodsFor: 'tests' stamp: 'BA 5/26/2019 23:57:20'!
test59OCantSlideToAnotherPositionMoreThan1Length
	"este test lo dejamos simplemente para 'mostrar la historia', pero podria ser sacado ya que testea el mismo caso con otro dato de prueba"
	| terniLapilli positionsOfX positionsOfO|

	positionsOfX := OrderedCollection with: 0@0 with: 0@2 with: 2@1.
	positionsOfO := OrderedCollection with: 0@1 with: 2@2 with: 1@0.
	terniLapilli := self createTerniLapilliWithXPositions: positionsOfX andOPositions: positionsOfO.
	terniLapilli slideXFrom: 2@1 to: 2@0.
	
	self should: [terniLapilli slideOFrom: 1@0 to: 1@2.] 
	raise: Error - MessageNotUnderstood
	withMessageText: TerniLapilli cantSlideToMoreThan1LengthOfSourceErrorDescription.

	self assert: (OrderedCollection with: 0@0 with: 0@2 with: 2@0) equals: terniLapilli positionsOfX.
	self assert: (OrderedCollection with: 0@1 with: 2@2 with: 1@0) equals: terniLapilli positionsOfO.
	self assert: #O equals: terniLapilli currentTurn.
	self deny: terniLapilli someoneWon.
	! !


!TerniLapilliTest methodsFor: 'tests - private' stamp: 'BA 5/26/2019 23:21:54'!
createTerniLapilliWithXPositions: positionsOfXTokens andOPositions: positionsOfOTokens
	| terniLapilli |

	terniLapilli := TerniLapilli new.
	positionsOfXTokens do: [:posOfX |
		terniLapilli putXAt: posOfX.
		(positionsOfOTokens isEmpty) ifFalse: [
				terniLapilli putOAt: (positionsOfOTokens removeFirst).
		]
	].

	^terniLapilli! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'state positionsOfO positionsOfX'
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


!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/26/2019 22:04:51'!
hasWonByDiagonalLine: playerPositions

	| aDiagonalSequence anotherDiagonalSequence |
	
	aDiagonalSequence := OrderedCollection with: 0@0 with: 1@1 with: 2@2.
	anotherDiagonalSequence := OrderedCollection with: 0@2 with: 1@1 with: 2@0.

	^(playerPositions difference: aDiagonalSequence) isEmpty or: [(playerPositions difference: anotherDiagonalSequence ) isEmpty]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/26/2019 22:27:14'!
hasWonOByDiagonalLine

	^self hasWonByDiagonalLine: positionsOfO! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/26/2019 22:27:14'!
hasWonOByHorizontalLine
	
	^self hasWonPlayerByHorizontalLine: positionsOfO ! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/26/2019 22:27:14'!
hasWonOByVerticalLine

	^self hasWonPlayerByVerticalLine: positionsOfO! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/26/2019 22:03:27'!
hasWonPlayerByHorizontalLine: playerPositions
	
	^((playerPositions at: 1) y = (playerPositions at: 2) y) and: [(playerPositions at: 2) y = (playerPositions at: 3) y]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/26/2019 22:03:18'!
hasWonPlayerByVerticalLine: playerPositions

	^((playerPositions at: 1) x = (playerPositions at: 2) x) and: [(playerPositions at: 2) x = (playerPositions at: 3) x]! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/26/2019 22:27:34'!
hasWonXByDiagonalLine

	^self hasWonByDiagonalLine: positionsOfX ! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/26/2019 22:27:34'!
hasWonXByHorizontalLine

	^self hasWonPlayerByHorizontalLine: positionsOfX ! !

!TerniLapilli methodsFor: 'testing - private' stamp: 'AMS 5/26/2019 22:27:34'!
hasWonXByVerticalLine

	^self hasWonPlayerByVerticalLine: positionsOfX ! !


!TerniLapilli methodsFor: 'testing' stamp: 'AMS 5/26/2019 22:27:14'!
hasWonO

	^positionsOfO size = 3 and: [self hasWonOByHorizontalLine or: [self hasWonOByVerticalLine or: [self hasWonOByDiagonalLine]]]
! !

!TerniLapilli methodsFor: 'testing' stamp: 'AMS 5/26/2019 22:27:34'!
hasWonX

	^positionsOfX size = 3 and: [self hasWonXByHorizontalLine or: [self hasWonXByVerticalLine or: [self hasWonXByDiagonalLine]]]! !

!TerniLapilli methodsFor: 'testing' stamp: 'BA 5/25/2019 18:01:35'!
someoneWon

	^self hasWonO or: [self hasWonX]! !


!TerniLapilli methodsFor: 'initialization' stamp: 'AMS 5/26/2019 22:27:34'!
initialize

	positionsOfX := OrderedCollection new.
	positionsOfO := OrderedCollection new.
	state := TerniLapilliState for: self.
	! !


!TerniLapilli methodsFor: 'playing - private' stamp: 'AMS 5/26/2019 19:43:52'!
aPosition: aPosition isMoreThan1LengthOf: anotherPosition
	
	| xDifference yDifference |
	
	xDifference := anotherPosition x - aPosition x.
	yDifference := anotherPosition y - aPosition y.
	
	^xDifference abs + yDifference abs > 1! !

!TerniLapilli methodsFor: 'playing - private' stamp: 'AMS 5/26/2019 22:27:34'!
isEmptyPosition: aPosition

	^(positionsOfX includes: aPosition) not and: [(positionsOfO includes: aPosition) not]! !

!TerniLapilli methodsFor: 'playing - private' stamp: 'BA 5/26/2019 17:35:09'!
isInvalidPosition: aPosition

	^(aPosition x < 0) or: (aPosition x > 2) or: (aPosition y < 0) or: (aPosition y > 2)! !


!TerniLapilli methodsFor: 'sliding - private' stamp: 'AMS 5/26/2019 22:28:44'!
slide: playerPositions from: aSourcePosition to: aDestinationPosition raisingIfItsNotYoursSourcePosition: aBlockClosureException

	(self isEmptyPosition: aDestinationPosition) ifFalse: [^self raiseNonEmptyPositionException].
	(self isEmptyPosition: aSourcePosition ) ifTrue: [^self raiseEmptySourcePointException].
	(self isInvalidPosition: aDestinationPosition) ifTrue: [^self raiseInvalidPositionException].
	(self aPosition: aSourcePosition isMoreThan1LengthOf: aDestinationPosition) ifTrue: [^self raiseCantSlideToMoreThan1LengthOfSourceException].
	
	playerPositions remove: aSourcePosition ifAbsent: aBlockClosureException.
	playerPositions add: aDestinationPosition.
	state := TerniLapilliState for: self.! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'AMS 5/26/2019 21:16:39'!
slideOWhenGameIsOver

	^self raiseGameOverException ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'AMS 5/26/2019 20:43:32'!
slideOWhenIsPuttingO

	^self raiseCantSlideException ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'AMS 5/26/2019 20:43:44'!
slideOWhenIsPuttingX

	^self raiseCantSlideException ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'AMS 5/26/2019 22:27:14'!
slideOWhenIsSlidingOFrom: aSourcePosition to: aDestinationPosition

	^ self slide: positionsOfO from: aSourcePosition to: aDestinationPosition raisingIfItsNotYoursSourcePosition: [ ^self raiseSourcePointIsXException ]! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'AMS 5/26/2019 20:44:12'!
slideOWhenIsSlidingX

	^self raiseNotYourTurnException ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'AMS 5/26/2019 21:16:36'!
slideXWhenGameIsOver

	^self raiseGameOverException ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'AMS 5/26/2019 20:43:33'!
slideXWhenIsPuttingO

	^self raiseCantSlideException ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'AMS 5/26/2019 20:43:18'!
slideXWhenIsPuttingX

	^self raiseCantSlideException ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'AMS 5/26/2019 20:44:08'!
slideXWhenIsSlidingO

	^self raiseNotYourTurnException ! !

!TerniLapilli methodsFor: 'sliding - private' stamp: 'AMS 5/26/2019 22:27:34'!
slideXWhenIsSlidingXFrom: aSourcePosition to: aDestinationPosition

	^ self slide: positionsOfX from: aSourcePosition to: aDestinationPosition raisingIfItsNotYoursSourcePosition: [ ^self raiseSourcePointIsOException ]! !


!TerniLapilli methodsFor: 'sliding' stamp: 'AMS 5/26/2019 20:44:40'!
slideOFrom: aSourcePosition to: aDestinationPosition 
	
	^state slideOFrom: aSourcePosition to: aDestinationPosition ! !

!TerniLapilli methodsFor: 'sliding' stamp: 'AMS 5/26/2019 21:03:11'!
slideXFrom: aSourcePosition to: aDestinationPosition 
	
	^state slideXFrom: aSourcePosition to: aDestinationPosition ! !


!TerniLapilli methodsFor: 'putting - private' stamp: 'AMS 5/26/2019 22:27:53'!
put: aPosition in: playerPositions

	(self isInvalidPosition: aPosition) ifTrue: [^self raiseInvalidPositionException].
	(self isEmptyPosition: aPosition) ifFalse: [^self raiseNonEmptyPositionException].

	playerPositions add: aPosition.
	
	state := TerniLapilliState for: self.! !

!TerniLapilli methodsFor: 'putting - private' stamp: 'AMS 5/26/2019 21:16:42'!
putOWhenGameIsOver

	^self raiseGameOverException ! !

!TerniLapilli methodsFor: 'putting - private' stamp: 'AMS 5/26/2019 22:28:09'!
putOWhenIsPuttingOAt: aPosition

	^self put: aPosition in: positionsOfO ! !

!TerniLapilli methodsFor: 'putting - private' stamp: 'AMS 5/26/2019 20:49:12'!
putOWhenIsPuttingX

	^self raiseNotYourTurnException ! !

!TerniLapilli methodsFor: 'putting - private' stamp: 'AMS 5/26/2019 20:57:24'!
putOWhenIsSlidingO

	^self raiseMoreThanThreeTokensException ! !

!TerniLapilli methodsFor: 'putting - private' stamp: 'AMS 5/26/2019 21:04:54'!
putOWhenIsSlidingX

	^self raiseNotYourTurnException ! !

!TerniLapilli methodsFor: 'putting - private' stamp: 'AMS 5/26/2019 21:16:47'!
putXWhenGameIsOver

	^self raiseGameOverException ! !

!TerniLapilli methodsFor: 'putting - private' stamp: 'AMS 5/26/2019 20:49:22'!
putXWhenIsPuttingO

	^self raiseNotYourTurnException ! !

!TerniLapilli methodsFor: 'putting - private' stamp: 'AMS 5/26/2019 22:28:21'!
putXWhenIsPuttingXAt: aPosition

	^self put: aPosition in: positionsOfX ! !

!TerniLapilli methodsFor: 'putting - private' stamp: 'AMS 5/26/2019 21:05:10'!
putXWhenIsSlidingO

	^self raiseNotYourTurnException ! !

!TerniLapilli methodsFor: 'putting - private' stamp: 'AMS 5/26/2019 20:57:16'!
putXWhenIsSlidingX

	^self raiseMoreThanThreeTokensException ! !


!TerniLapilli methodsFor: 'putting' stamp: 'AMS 5/26/2019 21:03:04'!
putOAt: aPosition

	^state putOAt: aPosition! !

!TerniLapilli methodsFor: 'putting' stamp: 'AMS 5/26/2019 20:55:13'!
putXAt: aPosition

	^state putXAt: aPosition ! !


!TerniLapilli methodsFor: 'turns - private' stamp: 'AMS 5/26/2019 21:17:33'!
currentTurnWhenGameIsOver

	^self raiseGameOverException ! !


!TerniLapilli methodsFor: 'positions - private' stamp: 'AMS 5/26/2019 22:37:07'!
hasPlayedAllTokens: playerPositions

	^playerPositions size = 3! !


!TerniLapilli methodsFor: 'positions' stamp: 'AMS 5/26/2019 22:33:54'!
hasOPlayedAllTokens

	^self hasPlayedAllTokens: positionsOfO! !

!TerniLapilli methodsFor: 'positions' stamp: 'AMS 5/26/2019 22:33:50'!
hasXPlayedAllTokens

	^self hasPlayedAllTokens: positionsOfX! !

!TerniLapilli methodsFor: 'positions' stamp: 'AMS 5/26/2019 22:30:05'!
positionsOfO

	^positionsOfO.! !

!TerniLapilli methodsFor: 'positions' stamp: 'AMS 5/26/2019 22:29:53'!
positionsOfX

	^positionsOfX.! !


!TerniLapilli methodsFor: 'turns' stamp: 'AMS 5/26/2019 20:11:51'!
currentTurn

	^state currentTurn.! !

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


!classDefinition: #TerniLapilliState category: #TerniLapilli!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'terniLapilli'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliState methodsFor: 'accessing' stamp: 'AMS 5/26/2019 20:11:14'!
currentTurn

	self subclassResponsibility.! !


!TerniLapilliState methodsFor: 'initialization' stamp: 'AMS 5/26/2019 20:15:20'!
initializeFor: aTerniLapilli

	terniLapilli := aTerniLapilli ! !


!TerniLapilliState methodsFor: 'putting' stamp: 'AMS 5/26/2019 20:15:49'!
putOAt: aPosition

	self subclassResponsibility ! !

!TerniLapilliState methodsFor: 'putting' stamp: 'AMS 5/26/2019 20:15:47'!
putXAt: aPosition

	self subclassResponsibility ! !


!TerniLapilliState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 20:34:30'!
slideOFrom: aSourcePosition to: aDestinationPosition

	self subclassResponsibility ! !

!TerniLapilliState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 20:34:26'!
slideXFrom: aSourcePosition to: aDestinationPosition

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilli!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'instance creation' stamp: 'AMS 5/26/2019 21:51:20'!
for: aTerniLapilli

	^(self allSubclasses detect: [:aState | aState canHandle: aTerniLapilli ]) new initializeFor: aTerniLapilli ! !


!TerniLapilliState class methodsFor: 'testing' stamp: 'AMS 5/26/2019 21:40:28'!
canHandle: aTerniLapili

	self subclassResponsibility ! !


!classDefinition: #GameOverState category: #TerniLapilli!
TerniLapilliState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!GameOverState methodsFor: 'accessing' stamp: 'AMS 5/26/2019 21:14:50'!
currentTurn

	^terniLapilli currentTurnWhenGameIsOver.! !


!GameOverState methodsFor: 'putting' stamp: 'AMS 5/26/2019 21:15:21'!
putOAt: aPosition

	^terniLapilli putOWhenGameIsOver! !

!GameOverState methodsFor: 'putting' stamp: 'AMS 5/26/2019 21:15:11'!
putXAt: aPosition

	^terniLapilli putXWhenGameIsOver! !


!GameOverState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 21:16:06'!
slideOFrom: aSourcePosition to: aDestinationPosition

	^terniLapilli slideOWhenGameIsOver! !

!GameOverState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 21:16:10'!
slideXFrom: aSourcePosition to: aDestinationPosition

	^terniLapilli slideXWhenGameIsOver! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'GameOverState class' category: #TerniLapilli!
GameOverState class
	instanceVariableNames: ''!

!GameOverState class methodsFor: 'testing' stamp: 'AMS 5/26/2019 21:40:55'!
canHandle: aTerniLapilli

	^aTerniLapilli someoneWon ! !


!classDefinition: #PlayingOState category: #TerniLapilli!
TerniLapilliState subclass: #PlayingOState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayingOState methodsFor: 'accessing' stamp: 'AMS 5/26/2019 20:26:42'!
currentTurn

	^#O! !


!PlayingOState methodsFor: 'putting' stamp: 'AMS 5/26/2019 20:27:00'!
putOAt: aPosition

	self subclassResponsibility ! !

!PlayingOState methodsFor: 'putting' stamp: 'AMS 5/26/2019 20:26:57'!
putXAt: aPosition

	self subclassResponsibility ! !


!PlayingOState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 20:34:50'!
slideOFrom: aSourcePosition to: aDestinationPosition

	self subclassResponsibility ! !

!PlayingOState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 20:34:48'!
slideXFrom: aSourcePosition to: aDestinationPosition

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingOState class' category: #TerniLapilli!
PlayingOState class
	instanceVariableNames: ''!

!PlayingOState class methodsFor: 'testing' stamp: 'AMS 5/26/2019 21:56:49'!
canHandle: aTerniLapilli

	^false ! !


!classDefinition: #PuttingOState category: #TerniLapilli!
PlayingOState subclass: #PuttingOState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PuttingOState methodsFor: 'putting' stamp: 'AMS 5/26/2019 20:33:44'!
putOAt: aPosition

	^terniLapilli putOWhenIsPuttingOAt: aPosition ! !

!PuttingOState methodsFor: 'putting' stamp: 'AMS 5/26/2019 20:48:50'!
putXAt: aPosition

	^terniLapilli putXWhenIsPuttingO ! !


!PuttingOState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 20:38:38'!
slideOFrom: aSourcePosition to: aDestinationPosition

	^terniLapilli slideOWhenIsPuttingO! !

!PuttingOState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 20:38:45'!
slideXFrom: aSourcePosition to: aDestinationPosition

	^terniLapilli slideXWhenIsPuttingO! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuttingOState class' category: #TerniLapilli!
PuttingOState class
	instanceVariableNames: ''!

!PuttingOState class methodsFor: 'testing' stamp: 'AMS 5/26/2019 22:34:38'!
canHandle: aTerniLapilli

	^aTerniLapilli someoneWon not and: [(aTerniLapilli currentTurn = #X) and: [aTerniLapilli hasOPlayedAllTokens not]]! !


!classDefinition: #SlidingOState category: #TerniLapilli!
PlayingOState subclass: #SlidingOState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!SlidingOState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 20:38:25'!
slideOFrom: aSourcePosition to: aDestinationPosition

	^terniLapilli slideOWhenIsSlidingOFrom: aSourcePosition to: aDestinationPosition .! !

!SlidingOState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 20:37:53'!
slideXFrom: aSourcePosition to: aDestinationPosition

	^terniLapilli slideXWhenIsSlidingO.! !


!SlidingOState methodsFor: 'putting' stamp: 'AMS 5/26/2019 20:39:54'!
putOAt: aPosition

	^terniLapilli putOWhenIsSlidingO! !

!SlidingOState methodsFor: 'putting' stamp: 'AMS 5/26/2019 20:39:49'!
putXAt: aPosition

	^terniLapilli putXWhenIsSlidingO! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingOState class' category: #TerniLapilli!
SlidingOState class
	instanceVariableNames: ''!

!SlidingOState class methodsFor: 'testing' stamp: 'AMS 5/26/2019 22:34:45'!
canHandle: aTerniLapilli

	^aTerniLapilli someoneWon not and: [(aTerniLapilli currentTurn = #X) and: [aTerniLapilli hasOPlayedAllTokens ]]! !


!classDefinition: #PlayingXState category: #TerniLapilli!
TerniLapilliState subclass: #PlayingXState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlayingXState methodsFor: 'putting' stamp: 'AMS 5/26/2019 20:27:29'!
putOAt: aPosition

	self subclassResponsibility ! !

!PlayingXState methodsFor: 'putting' stamp: 'AMS 5/26/2019 20:27:26'!
putXAt: aPosition

	self subclassResponsibility ! !


!PlayingXState methodsFor: 'accessing' stamp: 'AMS 5/26/2019 20:27:13'!
currentTurn

	^#X! !


!PlayingXState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 20:35:11'!
slideOFrom: aSourcePosition to: aDestinationPosition

	self subclassResponsibility ! !

!PlayingXState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 20:35:08'!
slideXFrom: aSourcePosition to: aDestinationPosition

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlayingXState class' category: #TerniLapilli!
PlayingXState class
	instanceVariableNames: ''!

!PlayingXState class methodsFor: 'testing' stamp: 'AMS 5/26/2019 21:56:56'!
canHandle: aTerniLapilli

	^false! !


!classDefinition: #PuttingXState category: #TerniLapilli!
PlayingXState subclass: #PuttingXState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PuttingXState methodsFor: 'accessing' stamp: 'AMS 5/26/2019 20:11:37'!
currentTurn

	^#X! !


!PuttingXState methodsFor: 'putting' stamp: 'AMS 5/26/2019 20:49:01'!
putOAt: aPosition

	^terniLapilli putOWhenIsPuttingX! !

!PuttingXState methodsFor: 'putting' stamp: 'AMS 5/26/2019 20:33:49'!
putXAt: aPosition

	^terniLapilli putXWhenIsPuttingXAt: aPosition ! !


!PuttingXState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 20:40:56'!
slideOFrom: aSourcePosition to: aDestinationPosition

	^terniLapilli slideOWhenIsPuttingX! !

!PuttingXState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 20:40:48'!
slideXFrom: aSourcePosition to: aDestinationPosition

	^terniLapilli slideXWhenIsPuttingX! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuttingXState class' category: #TerniLapilli!
PuttingXState class
	instanceVariableNames: ''!

!PuttingXState class methodsFor: 'testing' stamp: 'AMS 5/26/2019 22:35:04'!
canHandle: aTerniLapilli

	^aTerniLapilli someoneWon not and: [(aTerniLapilli positionsOfX isEmpty) or: [(aTerniLapilli currentTurn = #O) and: [aTerniLapilli hasXPlayedAllTokens not]]]! !


!classDefinition: #SlidingXState category: #TerniLapilli!
PlayingXState subclass: #SlidingXState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!SlidingXState methodsFor: 'putting' stamp: 'AMS 5/26/2019 20:41:31'!
putOAt: aPosition

	^terniLapilli putOWhenIsSlidingX! !

!SlidingXState methodsFor: 'putting' stamp: 'AMS 5/26/2019 20:41:25'!
putXAt: aPosition

	^terniLapilli putXWhenIsSlidingX! !


!SlidingXState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 20:42:32'!
slideOFrom: aSourcePosition to: aDestinationPosition

	^terniLapilli slideOWhenIsSlidingX! !

!SlidingXState methodsFor: 'sliding' stamp: 'AMS 5/26/2019 20:42:19'!
slideXFrom: aSourcePosition to: aDestinationPosition

	^terniLapilli slideXWhenIsSlidingXFrom: aSourcePosition to: aDestinationPosition ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SlidingXState class' category: #TerniLapilli!
SlidingXState class
	instanceVariableNames: ''!

!SlidingXState class methodsFor: 'testing' stamp: 'AMS 5/26/2019 22:35:22'!
canHandle: aTerniLapilli

	^aTerniLapilli someoneWon not and: [(aTerniLapilli currentTurn = #O) and: [aTerniLapilli hasXPlayedAllTokens ]]! !
