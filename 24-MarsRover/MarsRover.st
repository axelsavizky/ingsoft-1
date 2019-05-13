!classDefinition: #MarsRoverTest category: #MarsRover!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'AMS 5/12/2019 21:53:33'!
test01KeepPositionAndHeadingWhenExecuteEmptyCommand

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 headingTo: #North.
	marsRover execute: ''.
	
	self assert: 0@0 equals: marsRover isAt.
	self assert: #North equals: marsRover headingTo.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AMS 5/12/2019 21:57:26'!
test02AdvanceOnePositionToNorthAndKeepHeadingWhenExecutesMoveForwardCommandHeadingToNorth

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 headingTo: #North.
	marsRover execute: 'f'.
	
	self assert: 0@1 equals: marsRover isAt.
	self assert: #North equals: marsRover headingTo.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AMS 5/12/2019 21:57:36'!
test03AdvanceOnePositionToSouthAndKeepHeadingWhenExecutesMoveBackwardCommandHeadingToNorth

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 headingTo: #North.
	marsRover execute: 'b'.
	
	self assert: 0@-1 equals: marsRover isAt.
	self assert: #North equals: marsRover headingTo.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AMS 5/12/2019 21:58:59'!
test04KeepPositionAndHeadsToWestWhenExecuteTurnLeftCommandHeadingToNorth

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 headingTo: #North.
	marsRover execute: 'l'.
	
	self assert: 0@0 equals: marsRover isAt.
	self assert: #West equals: marsRover headingTo.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AMS 5/12/2019 21:59:17'!
test05KeepPositionAndHeadsToEastWhenExecuteTurnRightCommandHeadingToNorth

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 headingTo: #North.
	marsRover execute: 'r'.
	
	self assert: 0@0 equals: marsRover isAt.
	self assert: #East equals: marsRover headingTo.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AMS 5/12/2019 22:00:55'!
test06ShouldRaiseErrorWhenExecutesInvalidCommand

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 headingTo: #North.
	
	self should: [marsRover execute: 'x']
		raise: Error - MessageNotUnderstood 
		withMessageText: MarsRover invalidCommandDescription .
	self assert: 0@0 equals: marsRover isAt.
	self assert: #North equals: marsRover headingTo ! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AMS 5/12/2019 22:01:38'!
test07AdvanceTwoPositionsToNorthAndKeepHeadingWhenExecutesTwoMoveForwardCommandsHeadingToNorth

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 headingTo: #North.
	marsRover execute: 'ff'.
	
	self assert: 0@2 equals: marsRover isAt.
	self assert: #North equals: marsRover headingTo.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AMS 5/12/2019 22:02:21'!
test08AdvanceOnePositionToWestAndKeepHeadingWhenExecutesMoveForwardHeadingToWest

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 headingTo: #West.
	marsRover execute: 'f'.
	
	self assert: -1@0 equals: marsRover isAt.
	self assert: #West equals: marsRover headingTo.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AMS 5/12/2019 22:02:42'!
test09AdvanceOnePositionToEastAndKeepHeadingWhenExecutesMoveBackwardCommandHeadingToWest

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 headingTo: #West.
	marsRover execute: 'b'.
	
	self assert: 1@0 equals: marsRover isAt.
	self assert: #West equals: marsRover headingTo.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AMS 5/12/2019 22:03:12'!
test10KeepPositionAndHeadsToSouthWhenExecuteTurnLeftCommandHeadingToWest

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 headingTo: #West.
	marsRover execute: 'l'.
	
	self assert: 0@0 equals: marsRover isAt.
	self assert: #South equals: marsRover headingTo.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AMS 5/12/2019 22:03:33'!
test11KeepPositionAndHeadsToNorthWhenExecuteTurnRightCommandHeadingToWest

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 headingTo: #West.
	marsRover execute: 'r'.
	
	self assert: 0@0 equals: marsRover isAt.
	self assert: #North equals: marsRover headingTo.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AMS 5/12/2019 22:03:52'!
test12KeepPositionAndHeadingWhenTurnLeftFourTimes

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 headingTo: #North.
	marsRover execute: 'l'.
	marsRover execute: 'l'.
	marsRover execute: 'l'.
	marsRover execute: 'l'.
	
	self assert: 0@0 equals: marsRover isAt.
	self assert: #North equals: marsRover headingTo.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AMS 5/12/2019 22:05:16'!
test13AdvanceOnePositionAndHeadsToEastWhenExecutesMoveForwardAndTurnRightCommandHeadingToNorth

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 headingTo: #North.
	marsRover execute: 'fr'.
	
	self assert: 0@1 equals: marsRover isAt.
	self assert: #East equals: marsRover headingTo.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AMS 5/12/2019 22:05:37'!
test14DontExecuteTheRemainingCommandsWhenInvalidCommandAppears

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 headingTo: #North.
	
	self should: [marsRover execute: 'frwlb']
		raise: Error - MessageNotUnderstood 
		withMessageText: MarsRover invalidCommandDescription .	
	self assert: 0@1 equals: marsRover isAt.
	self assert: #East equals: marsRover headingTo.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AMS 5/12/2019 22:06:31'!
test15ExecutesAllCommandsWhenAreMoreThanTwoAndAreAllValid

	| marsRover |
	
	marsRover := MarsRover initializeAt: 0@0 headingTo: #North.
	marsRover execute: 'frfrblf'.
		
	self assert: 2@2 equals: marsRover isAt.
	self assert: #East equals: marsRover headingTo.! !


!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'executing' stamp: 'AMS 5/12/2019 22:13:15'!
execute: commands 
	commands do: [:aCommand | 
		((self isValid: aCommand) not) ifTrue: [self raiseInvalidCommand ].
		(aCommand = $f) ifTrue: [ position := position + heading moveForward ].
		(aCommand = $b) ifTrue: [ position := position + heading moveBackward ].
		(aCommand = $l) ifTrue: [heading := heading turnLeft ].
		(aCommand = $r) ifTrue: [heading := heading turnRight ].
		].! !

!MarsRover methodsFor: 'executing' stamp: 'AMS 5/9/2019 01:22:11'!
isValid: aCommand

	^((aCommand = $f) or: [(aCommand = $b) or: [(aCommand = $l) or: [(aCommand = $r) or: [aCommand = '']]]])! !


!MarsRover methodsFor: 'accessing' stamp: 'AMS 5/9/2019 01:52:53'!
headingTo
	^heading class cardinalPoint ! !

!MarsRover methodsFor: 'accessing' stamp: 'AMS 5/12/2019 21:45:02'!
isAt

	^position! !


!MarsRover methodsFor: 'initialization' stamp: 'AMS 5/9/2019 01:41:35'!
initializeAt: aPoint withHeadingTo: aCardinalPoint

	position := aPoint.
	heading := MarsRoverHeading for: aCardinalPoint ! !


!MarsRover methodsFor: 'exceptions' stamp: 'AMS 5/9/2019 01:10:25'!
raiseInvalidCommand

	^self error: self class invalidCommandDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'AMS 5/6/2019 21:35:43'!
initializeAt: aPoint headingTo: aCardinalPoint 
	^self new initializeAt: aPoint withHeadingTo: aCardinalPoint ! !


!MarsRover class methodsFor: 'exceptions' stamp: 'AMS 5/6/2019 21:28:37'!
invalidCommandDescription

	^'invalid command'! !


!classDefinition: #MarsRoverHeading category: #MarsRover!
Object subclass: #MarsRoverHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverHeading methodsFor: 'moving' stamp: 'AMS 5/9/2019 01:34:00'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'AMS 5/9/2019 01:33:52'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'turning' stamp: 'AMS 5/9/2019 01:34:15'!
turnLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'turning' stamp: 'AMS 5/9/2019 01:34:09'!
turnRight

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: #MarsRover!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'initialization' stamp: 'AMS 5/9/2019 01:49:57'!
for: aCardinalPoint

	^(self subclasses detect: [:subClass | subClass cardinalPoint =  aCardinalPoint ]) new! !


!MarsRoverHeading class methodsFor: 'accessing' stamp: 'AMS 5/9/2019 01:50:53'!
cardinalPoint

	self subclassResponsibility ! !


!classDefinition: #MarsRoverEastHeading category: #MarsRover!
MarsRoverHeading subclass: #MarsRoverEastHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverEastHeading methodsFor: 'moving' stamp: 'AMS 5/9/2019 01:35:23'!
moveBackward

	^-1@0! !

!MarsRoverEastHeading methodsFor: 'moving' stamp: 'AMS 5/9/2019 01:35:16'!
moveForward

	^1@0! !


!MarsRoverEastHeading methodsFor: 'turning' stamp: 'AMS 5/9/2019 01:35:42'!
turnLeft

	^ MarsRoverNorthHeading new! !

!MarsRoverEastHeading methodsFor: 'turning' stamp: 'AMS 5/9/2019 01:35:50'!
turnRight

	^ MarsRoverSouthHeading new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverEastHeading class' category: #MarsRover!
MarsRoverEastHeading class
	instanceVariableNames: ''!

!MarsRoverEastHeading class methodsFor: 'accessing' stamp: 'AMS 5/9/2019 01:50:30'!
cardinalPoint

	^#East! !


!classDefinition: #MarsRoverNorthHeading category: #MarsRover!
MarsRoverHeading subclass: #MarsRoverNorthHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverNorthHeading methodsFor: 'moving' stamp: 'AMS 5/9/2019 01:36:13'!
moveBackward

	^0@-1! !

!MarsRoverNorthHeading methodsFor: 'moving' stamp: 'AMS 5/9/2019 01:36:03'!
moveForward

	^0@1! !


!MarsRoverNorthHeading methodsFor: 'turning' stamp: 'AMS 5/9/2019 01:36:29'!
turnLeft

	^ MarsRoverWestHeading new! !

!MarsRoverNorthHeading methodsFor: 'turning' stamp: 'AMS 5/9/2019 01:36:40'!
turnRight

	^ MarsRoverEastHeading new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverNorthHeading class' category: #MarsRover!
MarsRoverNorthHeading class
	instanceVariableNames: ''!

!MarsRoverNorthHeading class methodsFor: 'accessing' stamp: 'AMS 5/9/2019 01:51:17'!
cardinalPoint

	^#North! !


!classDefinition: #MarsRoverSouthHeading category: #MarsRover!
MarsRoverHeading subclass: #MarsRoverSouthHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverSouthHeading methodsFor: 'moving' stamp: 'AMS 5/9/2019 01:37:10'!
moveBackward

	^0@1! !

!MarsRoverSouthHeading methodsFor: 'moving' stamp: 'AMS 5/9/2019 01:37:03'!
moveForward

	^0@-1! !


!MarsRoverSouthHeading methodsFor: 'turning' stamp: 'AMS 5/9/2019 01:37:39'!
turnLeft

	^MarsRoverEastHeading new! !

!MarsRoverSouthHeading methodsFor: 'turning' stamp: 'AMS 5/9/2019 01:37:47'!
turnRight

	^MarsRoverWestHeading new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverSouthHeading class' category: #MarsRover!
MarsRoverSouthHeading class
	instanceVariableNames: ''!

!MarsRoverSouthHeading class methodsFor: 'accessing' stamp: 'AMS 5/9/2019 01:51:51'!
cardinalPoint

	^#South! !


!classDefinition: #MarsRoverWestHeading category: #MarsRover!
MarsRoverHeading subclass: #MarsRoverWestHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverWestHeading methodsFor: 'moving' stamp: 'AMS 5/9/2019 01:38:13'!
moveBackward

	^1@0! !

!MarsRoverWestHeading methodsFor: 'moving' stamp: 'AMS 5/9/2019 01:38:07'!
moveForward

	^-1@0! !


!MarsRoverWestHeading methodsFor: 'turning' stamp: 'AMS 5/9/2019 01:38:37'!
turnLeft

	^MarsRoverSouthHeading new! !

!MarsRoverWestHeading methodsFor: 'turning' stamp: 'AMS 5/9/2019 01:38:48'!
turnRight

	^MarsRoverNorthHeading new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverWestHeading class' category: #MarsRover!
MarsRoverWestHeading class
	instanceVariableNames: ''!

!MarsRoverWestHeading class methodsFor: 'accessing' stamp: 'AMS 5/9/2019 01:45:17'!
isTheCardinalPoint: aCardinalPoint

	^aCardinalPoint = #West! !


!MarsRoverWestHeading class methodsFor: 'as yet unclassified' stamp: 'AMS 5/9/2019 01:52:25'!
cardinalPoint

	^#West! !
