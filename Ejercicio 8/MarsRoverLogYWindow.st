!classDefinition: #TestMarsRover category: 'MarsRoverLogYWindow'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LL 7/1/2021 00:42:36'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #TestMarsRoverLog category: 'MarsRoverLogYWindow'!
TestCase subclass: #TestMarsRoverLog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!TestMarsRoverLog methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:02:47'!
test01MarsRoverLogIsEmptyWhenNoCommandsAreProcessed

	| aMarsRoverLog marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverLog _ MarsRoverLog new.
	
	marsRover addPositionLog: aMarsRoverLog.
	marsRover processCommands: ''.
	
	self assert: OrderedCollection new equals: aMarsRoverLog entries! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:11:57'!
test02MarsRoverLogUpdatesWhenItMovesUp

	| aMarsRoverLog marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverLog _ MarsRoverLog new.
	
	marsRover addPositionLog: aMarsRoverLog.
	marsRover processCommands: 'f'.
	
	self assert: (OrderedCollection with: '0@1') equals: aMarsRoverLog entries! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:13:13'!
test03MarsRoverLogUpdatesWhenItMovesDown

	| aMarsRoverLog marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverLog _ MarsRoverLog new.
	
	marsRover addPositionLog: aMarsRoverLog.
	marsRover processCommands: 'b'.
	
	self assert: (OrderedCollection with: '0@-1') equals: aMarsRoverLog entries! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:13:45'!
test04MarsRoverLogUpdatesWhenItMovesLeft

	| aMarsRoverLog marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #West.
	aMarsRoverLog _ MarsRoverLog new.
	
	marsRover addPositionLog: aMarsRoverLog.
	marsRover processCommands: 'f'.
	
	self assert: (OrderedCollection with: '-1@0') equals: aMarsRoverLog entries! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:14:11'!
test05MarsRoverLogUpdatesWhenItMovesRight

	| aMarsRoverLog marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #West.
	aMarsRoverLog _ MarsRoverLog new.
	
	marsRover addPositionLog: aMarsRoverLog.
	marsRover processCommands: 'b'.
	
	self assert: (OrderedCollection with: '1@0') equals: aMarsRoverLog entries! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:15:09'!
test06MarsRoverLogUpdatesWhenItHeadsEast

	| aMarsRoverLog marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverLog _ MarsRoverLog new.
	
	marsRover addHeadingLog: aMarsRoverLog.
	marsRover processCommands: 'r'.
	
	self assert: (OrderedCollection with: 'East') equals: aMarsRoverLog entries! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:16:20'!
test07MarsRoverLogUpdatesWhenItHeadsWest

	| aMarsRoverLog marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverLog _ MarsRoverLog new.
	
	marsRover addHeadingLog: aMarsRoverLog.
	marsRover processCommands: 'l'.
	
	self assert: (OrderedCollection with: 'West') equals: aMarsRoverLog entries! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:16:48'!
test08MarsRoverLogUpdatesWhenItHeadsNorth

	| aMarsRoverLog marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #West.
	aMarsRoverLog _ MarsRoverLog new.
	
	marsRover addHeadingLog: aMarsRoverLog.
	marsRover processCommands: 'r'.
	
	self assert: (OrderedCollection with: 'North') equals: aMarsRoverLog entries! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:17:29'!
test09MarsRoverLogUpdatesWhenItHeadsSouth

	| aMarsRoverLog marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #West.
	aMarsRoverLog _ MarsRoverLog new.
	
	marsRover addHeadingLog: aMarsRoverLog.
	marsRover processCommands: 'l'.
	
	self assert: (OrderedCollection with: 'South') equals: aMarsRoverLog entries! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:19:07'!
test10MarsRoverLogUpdatesWhenPositionAndDirectionAreChanged

	| aMarsRoverLog marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverLog _ MarsRoverLog new.
	
	marsRover addPositionLog: aMarsRoverLog.
	marsRover addHeadingLog: aMarsRoverLog.
	marsRover processCommands: 'bl'.
	
	self assert: (OrderedCollection with: '0@-1' with: 'West') equals: aMarsRoverLog entries! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:19:58'!
test11MarsRoverLogOnlyUpdatesWhenPositionIsChanged

	| aMarsRoverLog marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverLog _ MarsRoverLog new.
	
	marsRover addPositionLog: aMarsRoverLog.
	marsRover processCommands: 'lb'.
	
	self assert: (OrderedCollection with: '1@0') equals: aMarsRoverLog entries! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:20:40'!
test12MarsRoverLogOnlyUpdatesWhenDirectionIsChanged

	| aMarsRoverLog marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverLog _ MarsRoverLog new.
	
	marsRover addHeadingLog: aMarsRoverLog.
	marsRover processCommands: 'lb'.
	
	self assert: (OrderedCollection with: 'West') equals: aMarsRoverLog entries! !


!classDefinition: #TestMarsRoverStatusWindow category: 'MarsRoverLogYWindow'!
TestCase subclass: #TestMarsRoverStatusWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:36:29'!
test01MarsRoverStatusWindowShowsInitialPositionWhenNoCommandsAreProcessed

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	
	marsRover addStatusWindowWithPosition: aMarsRoverStatusWindow.
	marsRover processCommands: ''.
	
	self assert: 'Position: 0@0' equals: aMarsRoverStatusWindow positionTextField! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:44:31'!
test02MarsRoverStatusWindowUpdatesWhenItMovesUp

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	
	marsRover addStatusWindowWithPosition: aMarsRoverStatusWindow.
	marsRover processCommands: 'f'.
	
	self assert: 'Position: 0@1' equals: aMarsRoverStatusWindow positionTextField! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:45:13'!
test03MarsRoverStatusWindowUpdatesWhenItMovesDown

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	
	marsRover addStatusWindowWithPosition: aMarsRoverStatusWindow.
	marsRover processCommands: 'b'.
	
	self assert: 'Position: 0@-1' equals: aMarsRoverStatusWindow positionTextField! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:45:42'!
test04MarsRoverStatusWindowUpdatesWhenItMovesRight

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #East.
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	
	marsRover addStatusWindowWithPosition: aMarsRoverStatusWindow.
	marsRover processCommands: 'f'.
	
	self assert: 'Position: 1@0' equals: aMarsRoverStatusWindow positionTextField! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:46:15'!
test05MarsRoverStatusWindowUpdatesWhenItMovesLeft

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #East.
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	
	marsRover addStatusWindowWithPosition: aMarsRoverStatusWindow.
	marsRover processCommands: 'b'.
	
	self assert: 'Position: -1@0' equals: aMarsRoverStatusWindow positionTextField! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:47:24'!
test06MarsRoverStatusWindowShowsInitialDirectionWhenNoCommandsAreProcessed

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	
	marsRover addStatusWindowWithHeading: aMarsRoverStatusWindow.
	marsRover processCommands: ''.
	
	self assert: 'Heading: North' equals: aMarsRoverStatusWindow headingTextField! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:49:30'!
test07MarsRoverStatusWindowUpdatesWhenItHeadsEast

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	
	marsRover addStatusWindowWithHeading: aMarsRoverStatusWindow.
	marsRover processCommands: 'r'.
	
	self assert: 'Heading: East' equals: aMarsRoverStatusWindow headingTextField! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:49:59'!
test08MarsRoverStatusWindowUpdatesWhenItHeadsWest

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	
	marsRover addStatusWindowWithHeading: aMarsRoverStatusWindow.
	marsRover processCommands: 'l'.
	
	self assert: 'Heading: West' equals: aMarsRoverStatusWindow headingTextField! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:50:36'!
test09MarsRoverStatusWindowUpdatesWhenItHeadsNorth

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #East.
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	
	marsRover addStatusWindowWithHeading: aMarsRoverStatusWindow.
	marsRover processCommands: 'l'.
	
	self assert: 'Heading: North' equals: aMarsRoverStatusWindow headingTextField! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:51:01'!
test10MarsRoverStatusWindowUpdatesWhenItHeadsSouth

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #East.
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	
	marsRover addStatusWindowWithHeading: aMarsRoverStatusWindow.
	marsRover processCommands: 'r'.
	
	self assert: 'Heading: South' equals: aMarsRoverStatusWindow headingTextField! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:52:44'!
test11MarsRoverStatusWindowUpdatesWhenPositionAndDirectionAreChanged

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	
	marsRover addStatusWindowWithPosition: aMarsRoverStatusWindow.
	marsRover addStatusWindowWithHeading: aMarsRoverStatusWindow.
	marsRover processCommands: 'br'.
	
	self assert: 'Position: 0@-1' equals: aMarsRoverStatusWindow positionTextField.
	self assert: 'Heading: East' equals: aMarsRoverStatusWindow headingTextField! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:53:17'!
test12MarsRoverStatusWindowOnlyUpdatesWhenPositionIsChanged

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	
	marsRover addStatusWindowWithPosition: aMarsRoverStatusWindow.
	marsRover processCommands: 'fr'.
	
	self assert: 'Position: 0@1' equals: aMarsRoverStatusWindow positionTextField! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'SRM 7/21/2021 10:54:02'!
test13MarsRoverStatusWindowOnlyUpdatesWhenDirectionIsChanged

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: 0@0 heading: #North.
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	
	marsRover addStatusWindowWithHeading: aMarsRoverStatusWindow.
	marsRover processCommands: 'lf'.
	
	self assert: 'Heading: West' equals: aMarsRoverStatusWindow headingTextField! !


!classDefinition: #MarsRover category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head positionXXX headingXXX'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRover methodsFor: 'initialization' stamp: 'SRM 7/21/2021 11:21:47'!
initializeStartingAt: aPoint heading: aCardinalPoint 
	
	position _ aPoint.
	head _ MarsRoverHead of: self facing: aCardinalPoint.
	headingXXX _ OrderedCollection new.
	positionXXX _ OrderedCollection new! !


!MarsRover methodsFor: 'process commands' stamp: 'SRM 7/19/2021 20:09:33'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
	
! !


!MarsRover methodsFor: 'testing' stamp: 'LL 6/30/2021 19:47:14'!
isAt: aPosition heading: aCardinalPoint

	^ position = aPosition and: [ head isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 19:48:47'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'SRM 7/21/2021 09:33:35'!
moveDown

	self step: 0@-1! !

!MarsRover methodsFor: 'dd - moving' stamp: 'SRM 7/21/2021 09:33:43'!
moveLeft

	self step: -1@0! !

!MarsRover methodsFor: 'dd - moving' stamp: 'SRM 7/21/2021 09:33:48'!
moveRight

	self step: 1@0! !

!MarsRover methodsFor: 'dd - moving' stamp: 'SRM 7/21/2021 09:33:53'!
moveUp

	self step: 0@1! !

!MarsRover methodsFor: 'dd - moving' stamp: 'SRM 7/21/2021 09:42:30'!
step: aCoordinateToAdd

	position _ position + aCoordinateToAdd.
	self logPositionChange! !


!MarsRover methodsFor: 'dd - heading' stamp: 'SRM 7/21/2021 09:27:15'!
headEast

	self updateHead: (MarsRoverHeadFacingEast of: self)! !

!MarsRover methodsFor: 'dd - heading' stamp: 'SRM 7/21/2021 09:27:37'!
headNorth

	self updateHead: (MarsRoverHeadFacingNorth of: self)! !

!MarsRover methodsFor: 'dd - heading' stamp: 'SRM 7/21/2021 09:27:50'!
headSouth

	self updateHead: (MarsRoverHeadFacingSouth of: self)! !

!MarsRover methodsFor: 'dd - heading' stamp: 'SRM 7/21/2021 09:27:58'!
headWest

	self updateHead: (MarsRoverHeadFacingWest of: self)! !

!MarsRover methodsFor: 'dd - heading' stamp: 'SRM 7/21/2021 09:43:42'!
updateHead: aNewHead

	head _ aNewHead.
	self logHeadingChange! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 11:22:18'!
addHeadingLog: aHeadingLog

	headingXXX add: aHeadingLog! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 11:11:29'!
addPositionLog: aPositionLog

	positionXXX add: aPositionLog! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 11:23:38'!
addStatusWindowWithHeading: aStatusWindowWithHeading

	aStatusWindowWithHeading headingChangedTo: head.
	headingXXX add: aStatusWindowWithHeading! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 11:12:47'!
addStatusWindowWithPosition: aStatusWindowWithPosition

	aStatusWindowWithPosition positionChangedTo: position.
	positionXXX add: aStatusWindowWithPosition.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 11:23:07'!
logHeadingChange

	headingXXX do: [:aHeadingXXX | aHeadingXXX headingChangedTo: head]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 11:13:20'!
logPositionChange
	
	positionXXX do: [:aPositionXXX | aPositionXXX positionChangedTo: position]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverLogYWindow'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverHead category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 11:52:26'!
directionToLogIn: aMarsRoverLog

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 12:07:10'!
directionToShowIn: aMarsRoverLog

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRoverLogYWindow'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRoverLogYWindow'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 11:56:18'!
directionToLogIn: aMarsRoverLog

	^aMarsRoverLog textToLogEast! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 12:08:28'!
directionToShowIn: aMarsRoverStatusWindow

	^aMarsRoverStatusWindow textToShowEast! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRoverLogYWindow'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRoverLogYWindow'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 11:56:29'!
directionToLogIn: aMarsRoverLog

	^aMarsRoverLog textToLogNorth! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 12:08:38'!
directionToShowIn: aMarsRoverStatusWindow

	^aMarsRoverStatusWindow textToShowNorth! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRoverLogYWindow'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRoverLogYWindow'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 11:56:40'!
directionToLogIn: aMarsRoverLog

	^aMarsRoverLog textToLogSouth! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 12:08:52'!
directionToShowIn: aMarsRoverStatusWindow

	^aMarsRoverStatusWindow textToShowSouth! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRoverLogYWindow'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRoverLogYWindow'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 11:56:54'!
directionToLogIn: aMarsRoverLog

	^aMarsRoverLog textToLogWest! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 12:09:03'!
directionToShowIn: aMarsRoverStatusWindow

	^aMarsRoverStatusWindow textToShowWest! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRoverLogYWindow'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverLog category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRoverLog
	instanceVariableNames: 'entries'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 10:03:33'!
entries

	^entries! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 11:51:56'!
headingChangedTo: aNewHead

	entries add: (aNewHead directionToLogIn: self)! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 11:10:18'!
positionChangedTo: aNewPosition

	entries add: aNewPosition asString! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 11:56:18'!
textToLogEast

	^'East'! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 11:56:29'!
textToLogNorth

	^'North'! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 11:56:39'!
textToLogSouth

	^'South'! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 11:56:54'!
textToLogWest

	^'West'! !


!MarsRoverLog methodsFor: 'initialization' stamp: 'SRM 7/21/2021 09:57:11'!
initialize

	entries _ OrderedCollection new! !


!classDefinition: #MarsRoverStatusWindow category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRoverStatusWindow
	instanceVariableNames: 'headingTextField positionTextField'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 12:07:10'!
headingChangedTo: aNewHead

	headingTextField _ 'Heading: ', (aNewHead directionToShowIn: self).! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 10:47:01'!
headingTextField

	^headingTextField! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 10:43:32'!
initialize

	positionTextField _ 'No position'.
	headingTextField _ 'No heading'! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 11:10:33'!
positionChangedTo: aPosition

	positionTextField _ 'Position: ',aPosition asString! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 10:38:00'!
positionTextField

	^positionTextField! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 12:08:28'!
textToShowEast

	^'East'! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 12:08:38'!
textToShowNorth

	^'North'! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 12:08:52'!
textToShowSouth

	^'South'! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'agg 7/21/2021 12:09:03'!
textToShowWest

	^'West'! !
