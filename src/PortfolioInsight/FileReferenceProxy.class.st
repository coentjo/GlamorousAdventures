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
FileReferenceProxy >> adoptAllChildrenMatching: aRegExp [
	^ (self allChildrenMatching: aRegExp) 
		do: [:child | self adoptChild: child];
		yourself 
	
]

{ #category : #accessing }
FileReferenceProxy >> adoptAllChildrenMatching: aRegExp lookIn: aDirectory [
	^ (aDirectory allChildrenMatching: aRegExp) 
		do: [:child | self adoptChild: child];
		yourself 
	
]

{ #category : #accessing }
FileReferenceProxy >> adoptChild: child [
	| adoptee | 
	adoptee := child. 
	child class = FileReferenceProxy 
		ifFalse: [
			adoptee := FileReferenceProxy on: adoptee
			"self error: 'Child of a proxy should be a proxy too.'"].
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
	| projects interesting subProjects |
	"projects (.sln), subprojects (.csproj), sourceFiles (.cs)"
	projects := self adoptAllChildrenMatching: '*.sln'.
	interesting := { self } , projects.
	"Add subprojects (*.csproj)"
	projects do: [:subproject |
		subProjects := OrderedCollection new. 
		subProjects addAll: 
			(subproject adoptAllChildrenMatching: '*.csProj' lookIn: subproject componentParent ).
		interesting := interesting , subProjects	 ]. 
	^ interesting 

"projects do: [:project | project children do: [:subproject | subproject adoptAllChildrenMatching: '*.csProj']"
"csProjProxies := rootProxy allChildrenMatching: '*.csProj'."
"csProxies :=  adoptAllChildrenMatching: '*.cs'."
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
