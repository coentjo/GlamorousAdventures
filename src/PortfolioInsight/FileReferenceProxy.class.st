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

{ #category : #'as yet unclassified' }
FileReferenceProxy >> component [
	^ component
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

{ #category : #accessing }
FileReferenceProxy >> solutionProxies [
	^ component allChildrenMatching: '*.sln'.
]
