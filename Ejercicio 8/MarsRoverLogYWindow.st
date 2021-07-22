!classDefinition: #TestMarsRover category: 'MarsRoverLogYWindow'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:20:12'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: (0@0) heading: #North afterProcessing: '' endsAt: (0@0) heading: #North! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:12:32'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:12:35'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:12:39'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:12:46'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:12:48'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:12:51'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:12:54'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:12:58'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:13:03'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:13:08'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:13:11'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:13:15'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:13:19'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:13:22'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:13:25'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:13:29'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:13:33'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tests' stamp: 'agg 7/22/2021 12:13:39'!
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


!TestMarsRover methodsFor: 'assertions' stamp: 'agg 7/22/2021 12:18:17'!
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

!TestMarsRoverLog methodsFor: 'tests' stamp: 'agg 7/22/2021 12:47:43'!
test01MarsRoverLogIsEmptyWhenNoCommandsAreProcessed

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' withPositionObserverHasLogEntries: (OrderedCollection new).
! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'agg 7/22/2021 12:48:16'!
test02MarsRoverLogUpdatesWhenItMovesUp

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' withPositionObserverHasLogEntries: (OrderedCollection with: '0@1').! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'agg 7/22/2021 12:48:39'!
test03MarsRoverLogUpdatesWhenItMovesDown

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' withPositionObserverHasLogEntries: (OrderedCollection with: '0@-1').! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'agg 7/22/2021 12:49:12'!
test04MarsRoverLogUpdatesWhenItMovesLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' withPositionObserverHasLogEntries: (OrderedCollection with: '-1@0').! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'agg 7/22/2021 12:49:31'!
test05MarsRoverLogUpdatesWhenItMovesRight

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' withPositionObserverHasLogEntries: (OrderedCollection with: '1@0').! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'agg 7/22/2021 12:51:46'!
test06MarsRoverLogUpdatesWhenItHeadsEast

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' withHeadingObserverHasLogEntries: (OrderedCollection with: 'East').
! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'agg 7/22/2021 12:57:03'!
test07MarsRoverLogUpdatesWhenItHeadsWest

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' withHeadingObserverHasLogEntries: (OrderedCollection with: 'West').! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'agg 7/22/2021 12:57:28'!
test08MarsRoverLogUpdatesWhenItHeadsNorth

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' withHeadingObserverHasLogEntries: (OrderedCollection with: 'North').! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'agg 7/22/2021 12:57:57'!
test09MarsRoverLogUpdatesWhenItHeadsSouth

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' withHeadingObserverHasLogEntries: (OrderedCollection with: 'South').! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'agg 7/22/2021 12:59:48'!
test10MarsRoverLogUpdatesWhenPositionAndDirectionAreChanged

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'bl' withHeadingAndPositionObserversHasLogEntries: (OrderedCollection with: '0@-1' with: 'West').! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'agg 7/22/2021 13:00:31'!
test11MarsRoverLogOnlyUpdatesWhenPositionIsChanged

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'lb' withPositionObserverHasLogEntries: (OrderedCollection with: '1@0').! !

!TestMarsRoverLog methodsFor: 'tests' stamp: 'agg 7/22/2021 13:01:05'!
test12MarsRoverLogOnlyUpdatesWhenDirectionIsChanged

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'lb' withHeadingObserverHasLogEntries: (OrderedCollection with: 'West').	! !


!TestMarsRoverLog methodsFor: 'assertions' stamp: 'agg 7/22/2021 12:58:49'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands withHeadingAndPositionObserversHasLogEntries: logEntries

	| aMarsRoverLog marsRover |
	
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	aMarsRoverLog _ MarsRoverLog new.
	marsRover addPositionObserver: aMarsRoverLog.
	marsRover addHeadingObserver: aMarsRoverLog.
	
	marsRover processCommands: aStringOfCommands.	

	self assert: logEntries equals: aMarsRoverLog entries! !

!TestMarsRoverLog methodsFor: 'assertions' stamp: 'agg 7/22/2021 12:50:50'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands withHeadingObserverHasLogEntries: logEntries

	| aMarsRoverLog marsRover |
	
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	aMarsRoverLog _ MarsRoverLog new.
	marsRover addHeadingObserver: aMarsRoverLog.
	
	marsRover processCommands: aStringOfCommands.	

	self assert: logEntries equals: aMarsRoverLog entries! !

!TestMarsRoverLog methodsFor: 'assertions' stamp: 'agg 7/22/2021 12:44:17'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands withPositionObserverHasLogEntries: logEntries

	| aMarsRoverLog marsRover |
	
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	aMarsRoverLog _ MarsRoverLog new.
	marsRover addPositionObserver: aMarsRoverLog.
	
	marsRover processCommands: aStringOfCommands.	

	self assert: logEntries equals: aMarsRoverLog entries! !


!classDefinition: #TestMarsRoverStatusWindow category: 'MarsRoverLogYWindow'!
TestCase subclass: #TestMarsRoverStatusWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'agg 7/22/2021 13:37:18'!
test01MarsRoverStatusWindowDoesNotShowAnyPositionWhenNoCommandsAreProcessed

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' withPositionObserverHasStatusWindow: ''.

! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'agg 7/22/2021 13:37:53'!
test02MarsRoverStatusWindowUpdatesWhenItMovesUp

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' withPositionObserverHasStatusWindow: 'Position: 0@1'.
! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'agg 7/22/2021 13:38:19'!
test03MarsRoverStatusWindowUpdatesWhenItMovesDown

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' withPositionObserverHasStatusWindow: 'Position: 0@-1'.
! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'agg 7/22/2021 13:44:32'!
test04MarsRoverStatusWindowUpdatesWhenItMovesRight

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' withPositionObserverHasStatusWindow: 'Position: 1@0'.
! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'agg 7/22/2021 13:45:02'!
test05MarsRoverStatusWindowUpdatesWhenItMovesLeft

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' withPositionObserverHasStatusWindow: 'Position: -1@0'.! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'agg 7/22/2021 13:45:42'!
test06MarsRoverStatusWindowDoesNotShowAnyHeadingWhenNoCommandsAreProcessed

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' withHeadingObserverHasStatusWindow: ''.! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'agg 7/22/2021 13:52:11'!
test07MarsRoverStatusWindowUpdatesWhenItHeadsEast

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' withHeadingObserverHasStatusWindow: 'Heading: East'.! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'agg 7/22/2021 13:52:38'!
test08MarsRoverStatusWindowUpdatesWhenItHeadsWest

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' withHeadingObserverHasStatusWindow: 'Heading: West'.	! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'agg 7/22/2021 13:53:08'!
test09MarsRoverStatusWindowUpdatesWhenItHeadsNorth

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' withHeadingObserverHasStatusWindow: 'Heading: North'.! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'agg 7/22/2021 13:53:34'!
test10MarsRoverStatusWindowUpdatesWhenItHeadsSouth

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' withHeadingObserverHasStatusWindow: 'Heading: South'.! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'agg 7/22/2021 14:01:43'!
test11MarsRoverStatusWindowUpdatesWhenPositionAndDirectionAreChanged

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'br'
	withPositionAndHeadingObserversHasPositionStatus: 'Position: 0@-1' andHeadingStatus: 'Heading: East'! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'agg 7/22/2021 13:59:34'!
test12MarsRoverStatusWindowOnlyUpdatesWhenPositionIsChanged
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'fr' withPositionObserverHasStatusWindow: 'Position: 0@1'.
! !

!TestMarsRoverStatusWindow methodsFor: 'tests' stamp: 'agg 7/22/2021 14:01:15'!
test13MarsRoverStatusWindowOnlyUpdatesWhenDirectionIsChanged

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'lf' withHeadingObserverHasStatusWindow: 'Heading: West'.! !


!TestMarsRoverStatusWindow methodsFor: 'assertions' stamp: 'agg 7/22/2021 14:00:31'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands withHeadingObserverHasStatusWindow: statusWindow

	| aMarsRoverStatusWindow marsRover |
	
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	marsRover addHeadingObserver: aMarsRoverStatusWindow.
	
	marsRover processCommands: aStringOfCommands.	
	
	self assert: statusWindow equals: aMarsRoverStatusWindow headingTextField.
	self assert: '' equals: aMarsRoverStatusWindow positionTextField.
! !

!TestMarsRoverStatusWindow methodsFor: 'assertions' stamp: 'agg 7/22/2021 13:56:44'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands
withPositionAndHeadingObserversHasPositionStatus: positionStatusWindow andHeadingStatus: headingStatusWindow 

	| aMarsRoverStatusWindow marsRover |
	
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	marsRover addPositionObserver: aMarsRoverStatusWindow.
	marsRover addHeadingObserver: aMarsRoverStatusWindow.
	
	marsRover processCommands: aStringOfCommands.	
	
	self assert: positionStatusWindow equals: aMarsRoverStatusWindow positionTextField.
	self assert: headingStatusWindow equals: aMarsRoverStatusWindow headingTextField.! !

!TestMarsRoverStatusWindow methodsFor: 'assertions' stamp: 'agg 7/22/2021 14:00:07'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands withPositionObserverHasStatusWindow: statusWindow

	| aMarsRoverStatusWindow marsRover |
	
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	marsRover addPositionObserver: aMarsRoverStatusWindow.
	
	marsRover processCommands: aStringOfCommands.	
	
	self assert: statusWindow equals: aMarsRoverStatusWindow positionTextField.
	self assert: '' equals: aMarsRoverStatusWindow headingTextField.! !


!classDefinition: #MarsRover category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRover
	instanceVariableNames: 'position heading positionObservers headingObservers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRover methodsFor: 'initialization' stamp: 'agg 7/22/2021 12:15:13'!
initializeStartingAt: aPoint heading: aCardinalPoint 
	
	position _ MarsRoverPosition of: aPoint.
	heading _ MarsRoverHeading of: (MarsRoverHead of: self facing: aCardinalPoint)! !


!MarsRover methodsFor: 'process commands' stamp: 'SRM 7/21/2021 16:39:52'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand]! !


!MarsRover methodsFor: 'testing' stamp: 'agg 7/22/2021 12:29:07'!
isAt: aPosition heading: aCardinalPoint

	^ (self actualPosition = aPosition) and: [ heading isHeading: aCardinalPoint ]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'SRM 7/21/2021 16:39:21'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'agg 7/22/2021 14:48:55'!
detectCommand: aCommand

	| subclass |
	
	subclass _ MarsRoverCommand allSubclasses detect: [ :actualCommand | actualCommand isCommand: aCommand].
	^subclass new.! !

!MarsRover methodsFor: 'private - process commands' stamp: 'SRM 7/21/2021 16:39:26'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'agg 7/22/2021 14:49:57'!
processCommand: aCommand
	
	| command |
	
	command  _ self detectCommand: aCommand.
	command beExecutedWith: self.! !

!MarsRover methodsFor: 'private - process commands' stamp: 'agg 7/22/2021 14:39:18'!
processMoveBackwardsCommand
	
	^ heading movingBackwards! !

!MarsRover methodsFor: 'private - process commands' stamp: 'agg 7/22/2021 14:39:28'!
processMoveFowardCommand
	
	^ heading movingForward.
! !

!MarsRover methodsFor: 'private - process commands' stamp: 'agg 7/22/2021 14:38:51'!
processRotateLeftCommand
	
	^ heading rotateLeft
! !

!MarsRover methodsFor: 'private - process commands' stamp: 'agg 7/22/2021 14:39:02'!
processRotateRightCommand
	
	^ heading rotateRight
! !


!MarsRover methodsFor: 'private - commands' stamp: 'agg 7/22/2021 14:53:41'!
isInvalidCommand: aCommand

	^(MarsRoverCommand allSubclasses anySatisfy: [ :actualCommand | actualCommand isCommand: aCommand]) not.! !


!MarsRover methodsFor: 'dd - moving' stamp: 'agg 7/22/2021 12:19:30'!
moveDown

	position beModifiedBy: 0@-1! !

!MarsRover methodsFor: 'dd - moving' stamp: 'agg 7/22/2021 14:30:43'!
moveLeft

	position beModifiedBy: -1@0! !

!MarsRover methodsFor: 'dd - moving' stamp: 'agg 7/22/2021 14:30:48'!
moveRight

	position beModifiedBy: 1@0! !

!MarsRover methodsFor: 'dd - moving' stamp: 'agg 7/22/2021 14:30:52'!
moveUp

	position beModifiedBy: 0@1! !


!MarsRover methodsFor: 'dd - heading' stamp: 'agg 7/22/2021 14:04:38'!
headEast

	heading beModifiedBy: (MarsRoverHeadFacingEast of: self)! !

!MarsRover methodsFor: 'dd - heading' stamp: 'agg 7/22/2021 14:04:44'!
headNorth

	heading beModifiedBy: (MarsRoverHeadFacingNorth of: self)! !

!MarsRover methodsFor: 'dd - heading' stamp: 'agg 7/22/2021 14:04:49'!
headSouth

	heading beModifiedBy: (MarsRoverHeadFacingSouth of: self)! !

!MarsRover methodsFor: 'dd - heading' stamp: 'agg 7/22/2021 14:04:52'!
headWest

	heading beModifiedBy: (MarsRoverHeadFacingWest of: self)! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 12:28:22'!
actualPosition

	^position actualPosition! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 12:16:34'!
addHeadingObserver: aHeadingObserver

	heading addObserver: aHeadingObserver! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 12:16:59'!
addPositionObserver: aPositionObserver

	position addObserver: aPositionObserver! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverLogYWindow'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'agg 7/22/2021 12:14:11'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverCommand category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRoverCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverCommand methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 14:34:55'!
beExecutedWith: aMarsRover
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommand class' category: 'MarsRoverLogYWindow'!
MarsRoverCommand class
	instanceVariableNames: ''!

!MarsRoverCommand class methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 14:28:35'!
isCommand: aCommand

	self subclassResponsibility ! !


!classDefinition: #BackwardCommand category: 'MarsRoverLogYWindow'!
MarsRoverCommand subclass: #BackwardCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!BackwardCommand methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 14:39:57'!
beExecutedWith: aMarsRover
	
	^aMarsRover processMoveBackwardsCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BackwardCommand class' category: 'MarsRoverLogYWindow'!
BackwardCommand class
	instanceVariableNames: ''!

!BackwardCommand class methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 14:17:20'!
isCommand: aCommand

	^$b = aCommand! !


!classDefinition: #FowardCommand category: 'MarsRoverLogYWindow'!
MarsRoverCommand subclass: #FowardCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!FowardCommand methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 14:40:06'!
beExecutedWith: aMarsRover
	
	^aMarsRover processMoveFowardCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FowardCommand class' category: 'MarsRoverLogYWindow'!
FowardCommand class
	instanceVariableNames: ''!

!FowardCommand class methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 14:17:26'!
isCommand: aCommand

	^$f = aCommand! !


!classDefinition: #RotateLeftCommand category: 'MarsRoverLogYWindow'!
MarsRoverCommand subclass: #RotateLeftCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!RotateLeftCommand methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 14:40:16'!
beExecutedWith: aMarsRover
	
	^aMarsRover processRotateLeftCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateLeftCommand class' category: 'MarsRoverLogYWindow'!
RotateLeftCommand class
	instanceVariableNames: ''!

!RotateLeftCommand class methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 14:17:33'!
isCommand: aCommand

	^$l = aCommand! !


!classDefinition: #RotateRightCommand category: 'MarsRoverLogYWindow'!
MarsRoverCommand subclass: #RotateRightCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!RotateRightCommand methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 14:40:24'!
beExecutedWith: aMarsRover
	
	^aMarsRover processRotateRightCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateRightCommand class' category: 'MarsRoverLogYWindow'!
RotateRightCommand class
	instanceVariableNames: ''!

!RotateRightCommand class methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 14:17:39'!
isCommand: aCommand

	^$r = aCommand! !


!classDefinition: #MarsRoverHead category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:40:40'!
directionToLogIn: aMarsRoverLog

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:40:43'!
directionToShowIn: aMarsRoverLog

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:40:46'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:40:54'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:40:57'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:41:00'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:41:03'!
rotateRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRoverLogYWindow'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'agg 7/22/2021 12:30:11'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'agg 7/22/2021 12:30:02'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'agg 7/22/2021 12:30:06'!
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

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:41:09'!
directionToLogIn: aMarsRoverLog

	^aMarsRoverLog textToLogEast! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:41:12'!
directionToShowIn: aMarsRoverStatusWindow

	^aMarsRoverStatusWindow textToShowEast! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:41:18'!
movingBackwards

	^marsRover moveLeft! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:41:23'!
movingForward

	^marsRover moveRight! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:41:28'!
rotateLeft

	^marsRover headNorth! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:41:31'!
rotateRight

	^marsRover headSouth! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRoverLogYWindow'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 12:30:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRoverLogYWindow'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:41:40'!
directionToLogIn: aMarsRoverLog

	^aMarsRoverLog textToLogNorth! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:41:43'!
directionToShowIn: aMarsRoverStatusWindow

	^aMarsRoverStatusWindow textToShowNorth! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:41:45'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:41:49'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:41:52'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:41:56'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRoverLogYWindow'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 12:30:21'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRoverLogYWindow'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:42:00'!
directionToLogIn: aMarsRoverLog

	^aMarsRoverLog textToLogSouth! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:42:04'!
directionToShowIn: aMarsRoverStatusWindow

	^aMarsRoverStatusWindow textToShowSouth! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:42:08'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:42:12'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:42:18'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:42:21'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRoverLogYWindow'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 12:30:24'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRoverLogYWindow'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:42:26'!
directionToLogIn: aMarsRoverLog

	^aMarsRoverLog textToLogWest! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:42:29'!
directionToShowIn: aMarsRoverStatusWindow

	^aMarsRoverStatusWindow textToShowWest! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:42:33'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:42:36'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:42:40'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'SRM 7/21/2021 16:42:43'!
rotateRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRoverLogYWindow'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 12:30:27'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverHeading category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'head headObservers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverHeading methodsFor: 'initialization' stamp: 'SRM 7/22/2021 10:28:57'!
initializeAt: aMarsRoverHead

	head _ aMarsRoverHead.
	headObservers _ OrderedCollection new! !


!MarsRoverHeading methodsFor: 'modification' stamp: 'SRM 7/22/2021 10:31:54'!
beModifiedBy: aNewHead

	head _ aNewHead.
	headObservers do: [:aHeadObserver | aHeadObserver headingChangedTo: head]! !


!MarsRoverHeading methodsFor: 'observation' stamp: 'SRM 7/22/2021 10:29:18'!
addObserver: aHeadObserver

	headObservers add: aHeadObserver! !


!MarsRoverHeading methodsFor: 'processing' stamp: 'SRM 7/22/2021 10:29:54'!
movingBackwards

	^head movingBackwards! !

!MarsRoverHeading methodsFor: 'processing' stamp: 'SRM 7/22/2021 10:30:07'!
movingForward

	^head movingForward! !

!MarsRoverHeading methodsFor: 'processing' stamp: 'SRM 7/22/2021 10:30:15'!
rotateLeft

	^head rotateLeft! !

!MarsRoverHeading methodsFor: 'processing' stamp: 'SRM 7/22/2021 10:30:24'!
rotateRight

	^head rotateRight! !


!MarsRoverHeading methodsFor: 'as yet unclassified' stamp: 'agg 7/22/2021 12:34:40'!
isHeading: aCardinalPoint

	^head class whenFacing: aCardinalPoint! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: 'MarsRoverLogYWindow'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'SRM 7/22/2021 10:19:51'!
of: aMarsRoverHead

	^self new initializeAt: aMarsRoverHead! !


!classDefinition: #MarsRoverLog category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRoverLog
	instanceVariableNames: 'entries'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverLog methodsFor: 'accessing' stamp: 'SRM 7/22/2021 08:07:57'!
entries

	^entries! !


!MarsRoverLog methodsFor: 'updating' stamp: 'SRM 7/22/2021 08:08:06'!
headingChangedTo: aNewHead

	entries add: (aNewHead directionToLogIn: self)! !

!MarsRoverLog methodsFor: 'updating' stamp: 'SRM 7/22/2021 08:08:20'!
positionChangedTo: aNewPosition

	entries add: aNewPosition asString! !


!MarsRoverLog methodsFor: 'initialization' stamp: 'SRM 7/22/2021 08:08:13'!
initialize

	entries _ OrderedCollection new! !


!MarsRoverLog methodsFor: 'private' stamp: 'SRM 7/22/2021 08:08:29'!
textToLogEast

	^'East'! !

!MarsRoverLog methodsFor: 'private' stamp: 'SRM 7/22/2021 08:08:37'!
textToLogNorth

	^'North'! !

!MarsRoverLog methodsFor: 'private' stamp: 'SRM 7/22/2021 08:08:46'!
textToLogSouth

	^'South'! !

!MarsRoverLog methodsFor: 'private' stamp: 'SRM 7/22/2021 08:08:54'!
textToLogWest

	^'West'! !


!classDefinition: #MarsRoverPosition category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRoverPosition
	instanceVariableNames: 'position positionObservers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverPosition methodsFor: 'getter' stamp: 'agg 7/22/2021 12:27:47'!
actualPosition

	^position! !


!MarsRoverPosition methodsFor: 'initialization' stamp: 'SRM 7/22/2021 10:11:51'!
initializeAt: anInitialPosition

	position _ anInitialPosition.
	positionObservers _ OrderedCollection new! !


!MarsRoverPosition methodsFor: 'modification' stamp: 'SRM 7/22/2021 10:32:08'!
beModifiedBy: aCoordinateToAdd

	position _ position + aCoordinateToAdd.
	positionObservers do: [:aPositionObserver | aPositionObserver positionChangedTo: position]! !


!MarsRoverPosition methodsFor: 'observation' stamp: 'SRM 7/22/2021 10:14:55'!
addObserver: aPositionObserver

	positionObservers add: aPositionObserver! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverPosition class' category: 'MarsRoverLogYWindow'!
MarsRoverPosition class
	instanceVariableNames: ''!

!MarsRoverPosition class methodsFor: 'instance creation' stamp: 'SRM 7/22/2021 10:10:52'!
of: anInitialPosition

	^self new initializeAt: anInitialPosition! !


!classDefinition: #MarsRoverStatusWindow category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRoverStatusWindow
	instanceVariableNames: 'headingTextField positionTextField'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverStatusWindow methodsFor: 'accessing' stamp: 'SRM 7/22/2021 08:12:56'!
headingTextField

	^headingTextField! !

!MarsRoverStatusWindow methodsFor: 'accessing' stamp: 'SRM 7/22/2021 08:13:22'!
positionTextField

	^positionTextField! !


!MarsRoverStatusWindow methodsFor: 'private' stamp: 'SRM 7/22/2021 08:13:30'!
textToShowEast

	^'East'! !

!MarsRoverStatusWindow methodsFor: 'private' stamp: 'SRM 7/22/2021 08:13:38'!
textToShowNorth

	^'North'! !

!MarsRoverStatusWindow methodsFor: 'private' stamp: 'SRM 7/22/2021 08:13:46'!
textToShowSouth

	^'South'! !

!MarsRoverStatusWindow methodsFor: 'private' stamp: 'SRM 7/22/2021 08:13:56'!
textToShowWest

	^'West'! !


!MarsRoverStatusWindow methodsFor: 'updating' stamp: 'SRM 7/22/2021 08:12:48'!
headingChangedTo: aNewHead

	headingTextField _ 'Heading: ',(aNewHead directionToShowIn: self)! !

!MarsRoverStatusWindow methodsFor: 'updating' stamp: 'SRM 7/22/2021 08:13:11'!
positionChangedTo: aPosition

	positionTextField _ 'Position: ',aPosition asString! !


!MarsRoverStatusWindow methodsFor: 'initialization' stamp: 'SRM 7/22/2021 08:13:03'!
initialize

	positionTextField _ headingTextField _ String new! !
