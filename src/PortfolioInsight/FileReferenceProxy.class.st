Class {
	#name : #FileReferenceProxy,
	#superclass : #Object,
	#instVars : [
		's',
		'component',
		'children',
		'parent'
	],
	#category : #PortfolioInsight
}

{ #category : #accessing }
FileReferenceProxy class >> on: aFileReference [
	"proxy for proxy will be the proxy itself!"
	aFileReference class = FileReferenceProxy
		ifTrue: [ ^ aFileReference ]. 
	^ self new 
		component: aFileReference;
		yourself

]

{ #category : #'as yet unclassified' }
FileReferenceProxy >> addChildrenMatching: aString [ 
	self shouldBeImplemented.
]

{ #category : #accessing }
FileReferenceProxy >> adoptAllChildSourcesMatching: aRegExp lookIn: aFileReference [ 
	^ ((aFileReference allChildrenMatching: aRegExp)
		collect: [:each | FileReferenceProxy on: each ])
		do: [:child | self adoptChild: child ];
		yourself
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

{ #category : #'as yet unclassified' }
FileReferenceProxy >> basename [
	^ component basename
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
FileReferenceProxy >> gtAsMondrian [
	| m |
	m := GtMondrian new.
	m nodes 
		stencil: [ :each | BlTextElement new
			text: each basename asRopedText; 
			background: Color green ];
		with: self interestingChildren.
	m edges connectFrom: #parent.
	m layout horizontalTree.
	^ m
]

{ #category : #accessing }
FileReferenceProxy >> interestingChildren [
	| projects interesting |
	"projects (.sln), subprojects (.csproj), sourceFiles (.cs)"
	projects := self adoptAllChildrenMatching: '*.sln'.
	interesting :=  OrderedCollection new.
	interesting 
		add: self; 
		addAll: projects.
	"Add subprojects (*.csproj)"
	projects
		do: [ :project | 			
			interesting addAll: 
				(self collectAndAdoptSubprojectsOf: project) ].
	^ interesting
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
