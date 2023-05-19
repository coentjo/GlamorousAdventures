Class {
	#name : #WAS2AppRoot,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #SemanticScholarWeb
}

{ #category : #rendering }
WAS2AppRoot class >> canBeRoot [

	^ true
]

{ #category : #initialization }
WAS2AppRoot >> children [ 
	^ { main }
]

{ #category : #initialization }
WAS2AppRoot >> initialize [ 
	super initialize .
	main := WAS2ScreenComponent new
]

{ #category : #rendering }
WAS2AppRoot >> renderContentOn: html [
	html render: main
]
