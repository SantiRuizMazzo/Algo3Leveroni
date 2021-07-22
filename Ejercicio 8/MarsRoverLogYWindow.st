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

!TestMarsRover methodsFor: 'tests' stamp: 'SRM 7/22/2021 15:42:14'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North)].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'SRM 7/22/2021 15:41:57'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover _ MarsRover startingAt: aPosition heading: aCardinalPoint.
	
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


!TestMarsRoverLog methodsFor: 'assertions' stamp: 'SRM 7/22/2021 15:42:37'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands withHeadingAndPositionObserversHasLogEntries: logEntries

	| aMarsRoverLog marsRover |
	
	marsRover _ MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	aMarsRoverLog _ MarsRoverLog new.
	marsRover addPositionObserver: aMarsRoverLog.
	marsRover addHeadingObserver: aMarsRoverLog.
	
	marsRover processCommands: aStringOfCommands.	

	self assert: logEntries equals: aMarsRoverLog entries! !

!TestMarsRoverLog methodsFor: 'assertions' stamp: 'SRM 7/22/2021 15:42:42'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands withHeadingObserverHasLogEntries: logEntries

	| aMarsRoverLog marsRover |
	
	marsRover _ MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	aMarsRoverLog _ MarsRoverLog new.
	marsRover addHeadingObserver: aMarsRoverLog.
	
	marsRover processCommands: aStringOfCommands.	

	self assert: logEntries equals: aMarsRoverLog entries! !

!TestMarsRoverLog methodsFor: 'assertions' stamp: 'SRM 7/22/2021 15:42:47'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands withPositionObserverHasLogEntries: logEntries

	| aMarsRoverLog marsRover |
	
	marsRover _ MarsRover startingAt: aPosition heading: aCardinalPoint.
	
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


!TestMarsRoverStatusWindow methodsFor: 'assertions' stamp: 'SRM 7/22/2021 15:43:08'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands withHeadingObserverHasStatusWindow: statusWindow

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	marsRover addHeadingObserver: aMarsRoverStatusWindow.
	
	marsRover processCommands: aStringOfCommands.	
	
	self assert: statusWindow equals: aMarsRoverStatusWindow headingTextField.
	self assert: '' equals: aMarsRoverStatusWindow positionTextField.
! !

!TestMarsRoverStatusWindow methodsFor: 'assertions' stamp: 'SRM 7/22/2021 15:43:14'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands
withPositionAndHeadingObserversHasPositionStatus: positionStatusWindow andHeadingStatus: headingStatusWindow 

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	marsRover addPositionObserver: aMarsRoverStatusWindow.
	marsRover addHeadingObserver: aMarsRoverStatusWindow.
	
	marsRover processCommands: aStringOfCommands.	
	
	self assert: positionStatusWindow equals: aMarsRoverStatusWindow positionTextField.
	self assert: headingStatusWindow equals: aMarsRoverStatusWindow headingTextField.! !

!TestMarsRoverStatusWindow methodsFor: 'assertions' stamp: 'SRM 7/22/2021 15:43:17'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands withPositionObserverHasStatusWindow: statusWindow

	| aMarsRoverStatusWindow marsRover |
	
	marsRover _ MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	aMarsRoverStatusWindow _ MarsRoverStatusWindow new.
	marsRover addPositionObserver: aMarsRoverStatusWindow.
	
	marsRover processCommands: aStringOfCommands.	
	
	self assert: statusWindow equals: aMarsRoverStatusWindow positionTextField.
	self assert: '' equals: aMarsRoverStatusWindow headingTextField.! !


!classDefinition: #MarsRover category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRover
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRover methodsFor: 'initialization' stamp: 'SRM 7/22/2021 16:54:17'!
initializeStartingAt: aPoint heading: aCardinalPoint 
	
	position _ MarsRoverPosition for: aPoint.
	heading _ MarsRoverHeading for: (MarsRoverHead of: self facing: aCardinalPoint)! !


!MarsRover methodsFor: 'process commands' stamp: 'SRM 7/21/2021 16:39:52'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand]! !


!MarsRover methodsFor: 'testing' stamp: 'SRM 7/22/2021 16:11:46'!
isAt: aPosition heading: aCardinalPoint

	^position = aPosition and: [ heading isHeading: aCardinalPoint ]! !


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

!MarsRover methodsFor: 'private - process commands' stamp: 'SRM 7/22/2021 15:28:22'!
processCommand: aCommand
	
	| command |
	
	command  _ self detectCommand: aCommand.
	command beExecutedBy: self.! !

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


!MarsRover methodsFor: 'attribute observation' stamp: 'agg 7/22/2021 12:16:34'!
addHeadingObserver: aHeadingObserver

	heading addObserver: aHeadingObserver! !

!MarsRover methodsFor: 'attribute observation' stamp: 'agg 7/22/2021 12:16:59'!
addPositionObserver: aPositionObserver

	position addObserver: aPositionObserver! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRoverLogYWindow'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'agg 7/22/2021 12:14:11'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverAttribute category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRoverAttribute
	instanceVariableNames: 'observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverAttribute methodsFor: 'observation' stamp: 'SRM 7/22/2021 16:04:20'!
addObserver: anObserver

	observers add: anObserver! !


!MarsRoverAttribute methodsFor: 'modification' stamp: 'SRM 7/22/2021 16:05:05'!
beModifiedBy: anAttributeModificator

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverAttribute class' category: 'MarsRoverLogYWindow'!
MarsRoverAttribute class
	instanceVariableNames: ''!

!MarsRoverAttribute class methodsFor: 'instance creation' stamp: 'SRM 7/22/2021 17:33:53'!
for: aMarsRoverCollaborator

	^self new initializeWith: aMarsRoverCollaborator! !


!classDefinition: #MarsRoverHeading category: 'MarsRoverLogYWindow'!
MarsRoverAttribute subclass: #MarsRoverHeading
	instanceVariableNames: 'head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverHeading methodsFor: 'initialization' stamp: 'SRM 7/22/2021 15:59:20'!
initializeWith: aMarsRoverHead

	head _ aMarsRoverHead.
	observers _ OrderedCollection new! !


!MarsRoverHeading methodsFor: 'modification' stamp: 'SRM 7/22/2021 17:06:45'!
beModifiedBy: aNewHead

	head _ aNewHead.
	observers do: [:anObserver | anObserver headingChangedTo: head]! !


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


!MarsRoverHeading methodsFor: 'testing' stamp: 'agg 7/22/2021 12:34:40'!
isHeading: aCardinalPoint

	^head class whenFacing: aCardinalPoint! !


!classDefinition: #MarsRoverPosition category: 'MarsRoverLogYWindow'!
MarsRoverAttribute subclass: #MarsRoverPosition
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverPosition methodsFor: 'initialization' stamp: 'SRM 7/22/2021 16:00:06'!
initializeWith: aPoint

	position _ aPoint.
	observers _ OrderedCollection new! !


!MarsRoverPosition methodsFor: 'modification' stamp: 'SRM 7/22/2021 16:05:48'!
beModifiedBy: aCoordinateToAdd

	position _ position + aCoordinateToAdd.
	observers do: [:anObserver | anObserver positionChangedTo: position]! !


!MarsRoverPosition methodsFor: 'testing' stamp: 'SRM 7/22/2021 16:12:32'!
= anotherPosition

	^position = anotherPosition! !


!classDefinition: #MarsRoverCommand category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRoverCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverCommand methodsFor: 'action' stamp: 'SRM 7/22/2021 15:28:22'!
beExecutedBy: aMarsRover
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommand class' category: 'MarsRoverLogYWindow'!
MarsRoverCommand class
	instanceVariableNames: ''!

!MarsRoverCommand class methodsFor: 'identity comparation' stamp: 'agg 7/22/2021 14:28:35'!
isCommand: aCommand

	self subclassResponsibility ! !


!classDefinition: #MoveBackwardCommand category: 'MarsRoverLogYWindow'!
MarsRoverCommand subclass: #MoveBackwardCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MoveBackwardCommand methodsFor: 'action' stamp: 'SRM 7/22/2021 15:28:22'!
beExecutedBy: aMarsRover
	
	^aMarsRover processMoveBackwardsCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveBackwardCommand class' category: 'MarsRoverLogYWindow'!
MoveBackwardCommand class
	instanceVariableNames: ''!

!MoveBackwardCommand class methodsFor: 'identity comparation' stamp: 'agg 7/22/2021 14:17:20'!
isCommand: aCommand

	^$b = aCommand! !


!classDefinition: #MoveFowardCommand category: 'MarsRoverLogYWindow'!
MarsRoverCommand subclass: #MoveFowardCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MoveFowardCommand methodsFor: 'action' stamp: 'SRM 7/22/2021 15:28:21'!
beExecutedBy: aMarsRover
	
	^aMarsRover processMoveFowardCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveFowardCommand class' category: 'MarsRoverLogYWindow'!
MoveFowardCommand class
	instanceVariableNames: ''!

!MoveFowardCommand class methodsFor: 'identity comparation' stamp: 'agg 7/22/2021 14:17:26'!
isCommand: aCommand

	^$f = aCommand! !


!classDefinition: #RotateLeftCommand category: 'MarsRoverLogYWindow'!
MarsRoverCommand subclass: #RotateLeftCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!RotateLeftCommand methodsFor: 'action' stamp: 'SRM 7/22/2021 15:28:21'!
beExecutedBy: aMarsRover
	
	^aMarsRover processRotateLeftCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateLeftCommand class' category: 'MarsRoverLogYWindow'!
RotateLeftCommand class
	instanceVariableNames: ''!

!RotateLeftCommand class methodsFor: 'identity comparation' stamp: 'agg 7/22/2021 14:17:33'!
isCommand: aCommand

	^$l = aCommand! !


!classDefinition: #RotateRightCommand category: 'MarsRoverLogYWindow'!
MarsRoverCommand subclass: #RotateRightCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!RotateRightCommand methodsFor: 'action' stamp: 'SRM 7/22/2021 15:28:21'!
beExecutedBy: aMarsRover
	
	^aMarsRover processRotateRightCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateRightCommand class' category: 'MarsRoverLogYWindow'!
RotateRightCommand class
	instanceVariableNames: ''!

!RotateRightCommand class methodsFor: 'identity comparation' stamp: 'agg 7/22/2021 14:17:39'!
isCommand: aCommand

	^$r = aCommand! !


!classDefinition: #MarsRoverHead category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverHead methodsFor: 'initialization' stamp: 'SRM 7/22/2021 16:03:25'!
initializeOf: aMarsRover

	marsRover _ aMarsRover! !


!MarsRoverHead methodsFor: 'status window' stamp: 'SRM 7/22/2021 17:10:23'!
headingToShowIn: aMarsRoverLog

	self subclassResponsibility! !


!MarsRoverHead methodsFor: 'log' stamp: 'SRM 7/22/2021 17:10:09'!
headingToLogIn: aMarsRoverLog

	self subclassResponsibility! !


!MarsRoverHead methodsFor: 'move' stamp: 'SRM 7/21/2021 16:40:54'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'move' stamp: 'SRM 7/21/2021 16:40:57'!
movingForward

	self subclassResponsibility! !


!MarsRoverHead methodsFor: 'rotate' stamp: 'SRM 7/21/2021 16:41:00'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'rotate' stamp: 'SRM 7/21/2021 16:41:03'!
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

!MarsRoverHeadFacingEast methodsFor: 'status window' stamp: 'SRM 7/22/2021 17:11:50'!
headingToShowIn: aMarsRoverStatusWindow

	^aMarsRoverStatusWindow textToDisplayEastHeading! !


!MarsRoverHeadFacingEast methodsFor: 'log' stamp: 'SRM 7/22/2021 17:12:58'!
headingToLogIn: aMarsRoverLog

	^aMarsRoverLog textToLogEastHeading! !


!MarsRoverHeadFacingEast methodsFor: 'move' stamp: 'SRM 7/21/2021 16:41:18'!
movingBackwards

	^marsRover moveLeft! !

!MarsRoverHeadFacingEast methodsFor: 'move' stamp: 'SRM 7/21/2021 16:41:23'!
movingForward

	^marsRover moveRight! !


!MarsRoverHeadFacingEast methodsFor: 'rotate' stamp: 'SRM 7/21/2021 16:41:28'!
rotateLeft

	^marsRover headNorth! !

!MarsRoverHeadFacingEast methodsFor: 'rotate' stamp: 'SRM 7/21/2021 16:41:31'!
rotateRight

	^marsRover headSouth! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRoverLogYWindow'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'testing' stamp: 'agg 7/22/2021 12:30:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRoverLogYWindow'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverHeadFacingNorth methodsFor: 'status window' stamp: 'SRM 7/22/2021 17:12:06'!
headingToShowIn: aMarsRoverStatusWindow

	^aMarsRoverStatusWindow textToDisplayNorthHeading! !


!MarsRoverHeadFacingNorth methodsFor: 'log' stamp: 'SRM 7/22/2021 17:13:11'!
headingToLogIn: aMarsRoverLog

	^aMarsRoverLog textToLogNorthHeading! !


!MarsRoverHeadFacingNorth methodsFor: 'move' stamp: 'SRM 7/21/2021 16:41:45'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'move' stamp: 'SRM 7/21/2021 16:41:49'!
movingForward

	^marsRover moveUp.! !


!MarsRoverHeadFacingNorth methodsFor: 'rotate' stamp: 'SRM 7/21/2021 16:41:52'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'rotate' stamp: 'SRM 7/21/2021 16:41:56'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRoverLogYWindow'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'testing' stamp: 'agg 7/22/2021 12:30:21'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRoverLogYWindow'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverHeadFacingSouth methodsFor: 'status window' stamp: 'SRM 7/22/2021 17:12:24'!
headingToShowIn: aMarsRoverStatusWindow

	^aMarsRoverStatusWindow textToDisplaySouthHeading! !


!MarsRoverHeadFacingSouth methodsFor: 'log' stamp: 'SRM 7/22/2021 17:13:21'!
headingToLogIn: aMarsRoverLog

	^aMarsRoverLog textToLogSouthHeading! !


!MarsRoverHeadFacingSouth methodsFor: 'move' stamp: 'SRM 7/21/2021 16:42:08'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'move' stamp: 'SRM 7/21/2021 16:42:12'!
movingForward

	^marsRover moveDown! !


!MarsRoverHeadFacingSouth methodsFor: 'rotate' stamp: 'SRM 7/21/2021 16:42:18'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'rotate' stamp: 'SRM 7/21/2021 16:42:21'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRoverLogYWindow'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'testing' stamp: 'agg 7/22/2021 12:30:24'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRoverLogYWindow'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverHeadFacingWest methodsFor: 'log' stamp: 'SRM 7/22/2021 17:13:31'!
headingToLogIn: aMarsRoverLog

	^aMarsRoverLog textToLogWestHeading! !


!MarsRoverHeadFacingWest methodsFor: 'move' stamp: 'SRM 7/21/2021 16:42:33'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'move' stamp: 'SRM 7/21/2021 16:42:36'!
movingForward

	^marsRover moveLeft.! !


!MarsRoverHeadFacingWest methodsFor: 'rotate' stamp: 'SRM 7/21/2021 16:42:40'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'rotate' stamp: 'SRM 7/21/2021 16:42:43'!
rotateRight

	^marsRover headNorth.! !


!MarsRoverHeadFacingWest methodsFor: 'status window' stamp: 'SRM 7/22/2021 17:12:42'!
headingToShowIn: aMarsRoverStatusWindow

	^aMarsRoverStatusWindow textToDisplayWestHeading! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRoverLogYWindow'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'testing' stamp: 'agg 7/22/2021 12:30:27'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverLog category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRoverLog
	instanceVariableNames: 'entries'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverLog methodsFor: 'initialization' stamp: 'SRM 7/22/2021 08:08:13'!
initialize

	entries _ OrderedCollection new! !


!MarsRoverLog methodsFor: 'accessing' stamp: 'SRM 7/22/2021 08:07:57'!
entries

	^entries! !


!MarsRoverLog methodsFor: 'updating' stamp: 'SRM 7/22/2021 17:10:09'!
headingChangedTo: aNewHead

	entries add: (aNewHead headingToLogIn: self)! !

!MarsRoverLog methodsFor: 'updating' stamp: 'SRM 7/22/2021 08:08:20'!
positionChangedTo: aNewPosition

	entries add: aNewPosition asString! !


!MarsRoverLog methodsFor: 'private' stamp: 'SRM 7/22/2021 17:12:58'!
textToLogEastHeading

	^'East'! !

!MarsRoverLog methodsFor: 'private' stamp: 'SRM 7/22/2021 17:13:10'!
textToLogNorthHeading

	^'North'! !

!MarsRoverLog methodsFor: 'private' stamp: 'SRM 7/22/2021 17:13:21'!
textToLogSouthHeading

	^'South'! !

!MarsRoverLog methodsFor: 'private' stamp: 'SRM 7/22/2021 17:13:31'!
textToLogWestHeading

	^'West'! !


!classDefinition: #MarsRoverStatusWindow category: 'MarsRoverLogYWindow'!
Object subclass: #MarsRoverStatusWindow
	instanceVariableNames: 'headingTextField positionTextField'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRoverLogYWindow'!

!MarsRoverStatusWindow methodsFor: 'initialization' stamp: 'SRM 7/22/2021 08:13:03'!
initialize

	positionTextField _ headingTextField _ String new! !


!MarsRoverStatusWindow methodsFor: 'accessing' stamp: 'SRM 7/22/2021 08:12:56'!
headingTextField

	^headingTextField! !

!MarsRoverStatusWindow methodsFor: 'accessing' stamp: 'SRM 7/22/2021 08:13:22'!
positionTextField

	^positionTextField! !


!MarsRoverStatusWindow methodsFor: 'updating' stamp: 'SRM 7/22/2021 17:10:23'!
headingChangedTo: aNewHead

	headingTextField _ 'Heading: ',(aNewHead headingToShowIn: self)! !

!MarsRoverStatusWindow methodsFor: 'updating' stamp: 'SRM 7/22/2021 08:13:11'!
positionChangedTo: aPosition

	positionTextField _ 'Position: ',aPosition asString! !


!MarsRoverStatusWindow methodsFor: 'private' stamp: 'SRM 7/22/2021 17:11:49'!
textToDisplayEastHeading

	^'East'! !

!MarsRoverStatusWindow methodsFor: 'private' stamp: 'SRM 7/22/2021 17:12:05'!
textToDisplayNorthHeading

	^'North'! !

!MarsRoverStatusWindow methodsFor: 'private' stamp: 'SRM 7/22/2021 17:12:24'!
textToDisplaySouthHeading

	^'South'! !

!MarsRoverStatusWindow methodsFor: 'private' stamp: 'SRM 7/22/2021 17:12:42'!
textToDisplayWestHeading

	^'West'! !
