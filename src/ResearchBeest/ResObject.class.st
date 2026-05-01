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
ResObject >> childNames [
	"the children of a Program are Projects"

	"the children of a Project are Experiments"

	"in the directory there can be a file 'ResChildren.md' with per line the name of 1 child"

	|  childrenFile |
	childrenFile := self researchObjectChildrenFile
	
	"^ dir files
		detect: [ :file | file name = self researchObjectChildrenFilename ]
		ifFound: [ :foundFile | Character lf split: foundFile contents ]
		ifNone: [ OrderedCollection new ]."
	
]

{ #category : 'as yet unclassified' }
ResObject >> files [

	^ resObjectDir files reject: [ :f | f name = '.DS_Store' ].

]

{ #category : 'as yet unclassified' }
ResObject >> gtActionCopyPathFor: anAction [
	<gtAction>
	| dir |
	dir := self resObjectDir.
	(dir exists or: [ dir path isNetworkPath not ])
		ifFalse: [ ^ anAction noAction ].

	^ anAction button
		icon: BrGlamorousVectorIcons copyToClipboard;
		tooltip: 'Copy Path';
		action: [ Clipboard clipboardText: self resObjectDir pathString ]
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
		icon: BrGlamorousVectorIcons blackcircle ;
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
ResObject >> gtChildrenFor: aView [
	<gtView>
	self researchObjectChildrenFile ensureCreateFile.
	^ aView forward
		title: 'Edit Children';
		priority: 12;
		object: self researchObjectChildrenFile;
		view: #gtContentsFor:;
		actionButtonLabel: 'Create'
			tooltip: 'Create children that don''t exist yet.'
			action: [ self researchChildren
					do: [ :each | each name asFileReference ensureCreateDirectory ] ]
]

{ #category : 'as yet unclassified' }
ResObject >> gtLiveFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Live';
		priority: 5;
		painting: [ :mondrian | 
			| allNodes |
			allNodes := { self }, self researchChildren.
			mondrian nodes
				shape: [ :anItem | self itemContainer: anItem ];
				with: allNodes.
			mondrian edges
				shape: [ BlSigmoidElement new
						zIndex: 0;
						beHorizontal;
						bendingPoint: 0.3;
						sharpness: 0.1;
						border: (BlBorder paint: (Color gray alpha: 0.2) width: 2) ];
				fromRightCenter;
				toLeftCenter;
				connectFrom: #yourself
					"toAll: [ :each | each researchChildren ]."
					toAll: [ :each | allNodes select: [ :node | each researchChildren contains: [:n | n name = node name]]].
			mondrian layout horizontalDominanceTree
				nodesAlignment: GtGradTreeNodesCenterAlignment new;
				levelDistance: 20;
				nodeDistance: 20.
			mondrian ];
		actionButtonIcon: BrGlamorousVectorIcons refresh
			tooltip: 'Update'
			action: [ :aButton "self refreshNodesDictionary." :aTab | aTab viewContentElement phlow update ]
		
]

{ #category : 'as yet unclassified' }
ResObject >> itemContainer: anItem [
	| container |
	container := BrHorizontalPane new
			hExact: 200;
			vFitContent;
			aptitude: BrShadowAptitude;
			clipChildren: false;
			margin: (BlInsets all: 10);
			background: Color white;
			zIndex: 1;
			when: BlClickEvent do: [ :e | e target phlow spawnObject: anItem ].
	^ container
		addChild: (BrVerticalPane new
				vMatchParent;
				hExact: 15;
				background: anItem resultBackgroundColor);
		addChild: (self itemInfoContainer: anItem)
]

{ #category : 'as yet unclassified' }
ResObject >> itemInfoContainer: anItem [
	| container |
	container := BrVerticalPane new
			hMatchParent;
			vFitContent;
			clipChildren: false.
	container
		addChild: (BrEditor new
				text: anItem name asRopedText;
				aptitude: BrGlamorousRegularEditorAptitude).
	^ container
]

{ #category : 'as yet unclassified' }
ResObject >> name [
	^ self resObjectDir asFileReference pathString
]

{ #category : 'as yet unclassified' }
ResObject >> printOn: aStream [
	aStream nextPutAll: self resObjectDir asString
]

{ #category : 'as yet unclassified' }
ResObject >> refChildrenClass [

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

{ #category : 'accessing' }
ResObject >> researchChildren [
	"According to the resourceObjectChildrenFile "
	| paths |
	paths :=  Character lf split: (self researchObjectChildrenFile ensureCreateFile; contents).
	"reject empty lines:"
	paths := paths reject: [ :each | ' *' matches: each ].
	^ paths collect: [ :each | self refChildrenClass onDir: (each asFileReference)]
]

{ #category : 'accessing' }
ResObject >> researchObjectChildrenFile [
	^ self resObjectDir / self researchObjectChildrenFilename
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
