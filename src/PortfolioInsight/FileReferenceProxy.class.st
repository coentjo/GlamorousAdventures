Class {
	#name : #FileReferenceProxy,
	#superclass : #Object,
	#instVars : [
		's',
		'component'
	],
	#category : #PortfolioInsight
}

{ #category : #accessing }
FileReferenceProxy class >> on: aFileReference [ 
	^ self new 
		component: aFileReference;
		yourself

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
FileReferenceProxy >> classHierarchyHorizontalTreeWithClassNames [
	"inspi comes from: GtMondrianClassHierarchyExamples"
	<gtExample>
	| targetClass view |
	targetClass := GtPhlowView .
	view := self emptyView.
	view nodes
		shape: [ :aClass |
			BlTextElement new
				text: aClass name asRopedText.
				"border: (BlBorder paint: Color gray width: 1);"
				"constraintsDo: [ :c |
					c padding: (BlInsets all: 1) ]" ]; 
		with: targetClass withAllSubclasses.
	"view edges
		fromRightCenter;
		toLeftCenter;
		connectToAll: #subclasses."
	view layout horizontalTree.
	^view
]

{ #category : #accessing }
FileReferenceProxy >> component: aFileReference [ 
	component := aFileReference
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
FileReferenceProxy >> resolve [
]
