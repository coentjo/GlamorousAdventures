Class {
	#name : 'ResObject',
	#superclass : 'Object',
	#instVars : [
		'resProperty',
		'resObjectDir'
	],
	#category : 'ResearchBeest',
	#package : 'ResearchBeest'
}

{ #category : 'as yet unclassified' }
ResObject class >> onDir: aDirRef [ 
	"nog nie helemaal netjes... :-( "
	^ self new
		resObjectDir: aDirRef;
		yourself
]

{ #category : 'as yet unclassified' }
ResObject >> asBrItemsProvider [
	^ BrSequenceableCollectionItemsProvider forCollection: self
]

{ #category : 'as yet unclassified' }
ResObject >> children [
	"the children of a Program are Projects"

	"the children of a Project are Experiments"

	"in the directory there can be a file 'ResChildren.md' with per line the name of 1 child"

	| dir |
	dir := self resObjectDir.
	^ dir files
		detect: [ :file | file name = self researchObjectChildrenFilename ]
		ifFound: [ :foundFile | Character lf split: foundFile contents ]
		ifNone: [ OrderedCollection new ].
	
]

{ #category : 'as yet unclassified' }
ResObject >> files [

	^ resObjectDir files reject: [ :f | f name = '.DS_Store' ].

]

{ #category : 'as yet unclassified' }
ResObject >> gtActionOpenInCursorFor: anAction [
	<gtAction>
	| dir |
	dir := self resObjectDir.
	(dir exists or: [ dir path isNetworkPath not ])
		ifFalse: [ ^ anAction noAction ].

	^ anAction button
		icon: BrGlamorousVectorIcons classicon;
		tooltip: 'Open in Cursor';
		action: [ | process |
			[ process := GtExternalProcessBuilder new
					command: 'openInCursor';
					arg: self resObjectDir pathString;
					pipeStdout;
					spawn ]
				onErrorDo: [ self inform: 'Check from CLI there is a runnable script openInCursor in PATH' ] ]
]

{ #category : 'as yet unclassified' }
ResObject >> gtActionOpenVsCodeFor: anAction [
	<gtAction>
	| dir |
	dir := self resObjectDir.
	(dir exists or: [ dir path isNetworkPath not ])
		ifFalse: [ ^ anAction noAction ].

	^ anAction button
		icon: BrGlamorousVectorIcons packageicon;
		tooltip: 'Open in VS Code';
		action: [ | process |
			[ process := GtExternalProcessBuilder new
					command: 'openInVsCode';
					arg: self resObjectDir pathString;
					pipeStdout;
					spawn ]
				onErrorDo: [ self inform: 'Check from CLI there is a runnable script openInVsCode in PATH' ] ]
]

{ #category : 'as yet unclassified' }
ResObject >> gtActionWebBrowseFor: anAction [
	<gtAction>
	| dir |
	dir := self resObjectDir.
	(dir exists or: [ dir path isNetworkPath not ]) ifFalse: [ ^ anAction noAction ].

	^ anAction button
		  icon: BrGlamorousVectorIcons link;
		  tooltip: 'Open in operating system';
		  action: [ WebBrowser openOn: dir fullName]
]

{ #category : 'as yet unclassified' }
ResObject >> name [
	^ self resObjectDir asFileReference name
]

{ #category : 'as yet unclassified' }
ResObject >> printOn: aStream [
	aStream nextPutAll: self resObjectDir asString
]

{ #category : 'as yet unclassified' }
ResObject >> refClass [

	^ self subclassResponsibility
]

{ #category : 'as yet unclassified' }
ResObject >> resObjectDir [
	^ resObjectDir
]

{ #category : 'as yet unclassified' }
ResObject >> resObjectDir: aDir [ 
	resObjectDir := aDir
]

{ #category : 'as yet unclassified' }
ResObject >> researchObjectChildrenFilename [
	^ 'ResearchObjectChildren.md'
]

{ #category : 'as yet unclassified' }
ResObject >> researchProperty [
	^ resProperty ifNil: [resProperty := OrderedCollection new]
]

{ #category : 'as yet unclassified' }
ResObject >> resultBackgroundColor [
	^ Color gray lighter
]

{ #category : 'as yet unclassified' }
ResObject >> when [
	^ self resObjectDir parent name
]
