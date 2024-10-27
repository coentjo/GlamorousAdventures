"
This class makes it possible to store feedback to FileReference objects (files, especially source files). 
Created to be able to look at zip files from students containing program source files. This way it is possible to store the feedback beside the zip. 

To use it create a proxy for a FileReference by inspecting: 
FileReferenceProxy on: aFileRef
"
Class {
	#name : #FileReferenceProxy,
	#superclass : #Object,
	#instVars : [
		's',
		'component',
		'children',
		'parent',
		'feedback'
	],
	#category : #PortfolioInsight
}

{ #category : #accessing }
FileReferenceProxy class >> on: aFileReference [
	"proxy for proxy will be the proxy itself!"
	aFileReference class = FileReferenceProxy
		ifTrue: [ ^ aFileReference ]. 
	"proxy for zip-file will be a proxy on the root-FileReference"
	aFileReference extension = 'zip'
		ifTrue: [ | fileRef |
			fileRef := (FileSystem zip: aFileReference) open workingDirectory.
			^ FileReferenceProxy on: fileRef ].
	"or else just create a proxy on the FileReference"
	^ self new 
		component: aFileReference;
		yourself

]

{ #category : #'as yet unclassified' }
FileReferenceProxy >> addChildrenMatching: aString [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
FileReferenceProxy >> addFeedback: aFeedbackItem [
	self feedback add: aFeedbackItem
]

{ #category : #accessing }
FileReferenceProxy >> adoptAllChildSourcesMatching: aRegExp lookIn: aFileReference [ 
	| col |
	col := ((aFileReference allChildrenMatching: aRegExp)
			collect: [:each | FileReferenceProxy on: each ]).
	col do: [:child | self adoptChild: child ].
	^ col
]

{ #category : #accessing }
FileReferenceProxy >> adoptAllChildrenMatching: aRegExp [
	^ (self allChildrenMatching: aRegExp) 
		do: [:child | self adoptChild: child];
		yourself 
	
]

{ #category : #accessing }
FileReferenceProxy >> adoptAllChildrenMatching: aRegExp lookIn: aDirectory [
	^ ((aDirectory allChildrenMatching: aRegExp) 
		collect: [:each | FileReferenceProxy on: each ])
		do: [:child | self adoptChild: child];
		yourself 
	
]

{ #category : #accessing }
FileReferenceProxy >> adoptChild: child [
	| adoptee | 
	adoptee := FileReferenceProxy on: child. 
	adoptee parent: self.
	self children add: adoptee
]

{ #category : #accessing }
FileReferenceProxy >> ageInDays [
	| d d2 |
	d := self component .
	d2 := d modificationTime .
	^ d2 monthName, d2 dayOfMonth asString
]

{ #category : #accessing }
FileReferenceProxy >> ageInWholeDays [
	^ self ageOfFile asDays truncated
]

{ #category : #accessing }
FileReferenceProxy >> ageOfFile [

	^ (Timespan
	   starting: self fileTimestampForVisualizer
	   ending: DateAndTime now) asDuration 
]

{ #category : #accessing }
FileReferenceProxy >> allChildrenMatching: aRegExp [
	^ (component allChildrenMatching: aRegExp)
		collect: [:each | FileReferenceProxy on: each]
]

{ #category : #accessing }
FileReferenceProxy >> allFiles [
	^ component allFiles
		collect: [ :each| self class on: each ]
]

{ #category : #accessing }
FileReferenceProxy >> assertEmptyView: aView [
	self assert: aView topStep root children isEmpty.
]

{ #category : #accessing }
FileReferenceProxy >> basename [
	^ self component basename
]

{ #category : #accessing }
FileReferenceProxy >> children [
	^ children ifNil: [children := OrderedCollection new]
]

{ #category : #accessing }
FileReferenceProxy >> classHierarchyHorizontalTreeWithClassNames [
	"inspi comes from: GtMondrianClassHierarchyExamples"
	<gtExample>
	| targetClass view |
	targetClass := GtPhlowView .
	view := self emptyView.
	view nodes
		shape: [ :aClass |
			BlTextElement new
				text: aClass name asRopedText ]; 
		with: targetClass withAllSubclasses.

	view layout horizontalTree.
	^view
]

{ #category : #accessing }
FileReferenceProxy >> collectAndAdoptSourceOf: subproject [ 
	| sources |
	sources := OrderedCollection new.
	sources addAll: (subproject
		adoptAllChildSourcesMatching: '*.cs'
		lookIn: subproject componentParent).
	^ sources
]

{ #category : #accessing }
FileReferenceProxy >> collectAndAdoptSubprojectsOf: project [ 
	| subProjects |
	subProjects := OrderedCollection new.
	subProjects addAll: 
		(project 
			adoptAllChildrenMatching: '*.csProj' 
			lookIn: project componentParent).
	"Add sources (*.cs)"
	subProjects do: [:subproject |
		subProjects addAll: (self collectAndAdoptSourceOf: subproject) ] .
	^ subProjects
]

{ #category : #accessing }
FileReferenceProxy >> component [
	^ component ifNil: [self error: self class asString, ' without a component.']
]

{ #category : #accessing }
FileReferenceProxy >> component: aFileReference [ 
	component := aFileReference
]

{ #category : #accessing }
FileReferenceProxy >> componentParent [
	^ self component parent
]

{ #category : #accessing }
FileReferenceProxy >> dirVisualizerTime [

	^ self component modificationTime
]

{ #category : #accessing }
FileReferenceProxy >> emptyView [
	<gtExample>
	| view |
	view := GtMondrian new.
	self assertEmptyView: view.
	^ view
]

{ #category : #accessing }
FileReferenceProxy >> entry [
	^ component entry
]

{ #category : #accessing }
FileReferenceProxy >> extension [
	^ component extension
]

{ #category : #accessing }
FileReferenceProxy >> feedback [
	^ feedback ifNil: [feedback := OrderedCollection new]
]

{ #category : #accessing }
FileReferenceProxy >> fileTimestampForVisualizer [

	^ self isDirectory
		  ifTrue: [ self dirVisualizerTime ]
		  ifFalse: [ self component modificationTime ]
]

{ #category : #accessing }
FileReferenceProxy >> gtAsMondrian [
	| m |
	m := GtMondrian new.
	m nodes 
		stencil: [ :each | BlTextElement new
			text: each insightName asRopedText; 
			background: each insightColorAdjustedForAge  ];
		with: self interestingChildren.
	m edges connectFrom: #parent.
	m layout horizontalTree.
	^ m
]

{ #category : #accessing }
FileReferenceProxy >> gtStyledCodeFor: aView [
	<gtView>
	| parser styler |
	component := self component. 
	(component isFile
		and: [ (parser := SmaCCParser allSubclasses
				detect: [ :each | each fileExtensions includes: '.' , self extension ]
				ifNone: [  ]) notNil and: [ (styler := parser gtStyler) notNil ] ])
		ifFalse: [ ^ aView empty ].
	^ aView textEditor
		title: 'Code';
		priority: 10;
		styler: styler;
		actionButtonLabel: 'Add feedback'
			action: [self addFeedback: (FeedbackItem on: self) ] ;
		look: BrGlamorousCodeEditorLook;
		text: [ | stream | 
			stream := WriteStream on: String new.
			stream nextPutAll: ' --- Feedback --- '; cr.
			self feedback do: [:fb | 
				stream nextPutAll: fb printString; cr].
			stream nextPutAll: ' --- about: ---'; cr.
			stream nextPutAll: component contents; cr.
			component contents asRopedText ]
]

{ #category : #'as yet unclassified' }
FileReferenceProxy >> gtVisualFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Portfolio';
		priority: 12;
		painting: [ :aMondrian |
			self paintPortfolioWith: aMondrian  ];
	actionUpdateButton
]

{ #category : #accessing }
FileReferenceProxy >> insightColor [
	| extensionColors |
	extensionColors := Dictionary 
		with:'cs' -> Color green
		with: 'csproj' -> Color orange 
		with: 'sln' -> Color red .
	^ extensionColors 
		at: self extension 
		ifAbsent: [Color gray] 

]

{ #category : #accessing }
FileReferenceProxy >> insightColorAdjustedForAge [
	^ self insightColor colorAdjustedForAge: self ageInWholeDays
]

{ #category : #accessing }
FileReferenceProxy >> insightName [
	^ self component isFile
		ifTrue: [ self ageInDays asString, ' ', self basename] 
		ifFalse: [ self basename]
			asRopedText
	
]

{ #category : #accessing }
FileReferenceProxy >> interestingChildren [
	| projects interesting |
	"projects (.sln), subprojects (.csproj), sourceFiles (.cs)"
	projects := self adoptAllChildrenMatching: '*.sln'.
	interesting :=  OrderedCollection new.
	interesting 
		add: self; 
		addAll: projects ";
		addAll: (self adoptAllChildrenMatching: '*.txt');
		addAll: ((self adoptAllChildrenMatching: '*.md')) ".
	"Add subprojects (*.csproj)"
	projects
		do: [ :project | 			
			interesting addAll: 
				(self collectAndAdoptSubprojectsOf: project) ].
	^ interesting
]

{ #category : #accessing }
FileReferenceProxy >> isDirectory [
	^ self component isDirectory
]

{ #category : #'as yet unclassified' }
FileReferenceProxy >> paintPortfolioWith: view [
	view nodes
		shape: [ :x | 
			BlTextElement new
				text: x basename asString asRopedText;
				border: (BlBorder paint: 
					(x isDirectory ifTrue: [Color red] ifFalse: [Color blue]) )];
		with: {self component} , self component children .
	view edges
		connectTo: [ :x | 
			x predecessor	"b := x asString size < self asString size.
			b"	"x asString beginsWith: self asString " ].
	view edges
		shape: [ :x | BlBezierElement new border: (BlBorder paint: (Color gray lighter) width: 1) ];
		passive;
		connect: 			
			(self component children collect: [ :c | c -> self component predecessor]) 
			from: #key
			to: #value.
	view layout circle  "tree" "horizontalTree".
"	^ view	 nodes 
		stencil: [ :c | 
			BlElement new 
				zIndex: 10;
				border: (BlBorder paint: (Color black alpha: 0.5) width: 2);
				width: 15;
				height: 15];
		with: {self component} , self component children ."
	"view edges 
		fromCenterBottom;
		toCenterTop;
		connectFrom: #parent."
"	view layout custom: (GtGraphTreeLayout new)."
]

{ #category : #accessing }
FileReferenceProxy >> parent [
	^ parent
]

{ #category : #accessing }
FileReferenceProxy >> parent: aProxy [
	parent := aProxy
]

{ #category : #accessing }
FileReferenceProxy >> printOn: aStream [
	aStream 
		nextPutAll: 'Proxy for '.
	self component printOn: aStream.
	
]

{ #category : #accessing }
FileReferenceProxy >> resolve [
]

{ #category : #accessing }
FileReferenceProxy >> solutionProxies [
	^ component allChildrenMatching: '*.sln'.
]
