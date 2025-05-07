"
Class: TimAdm

Responsibility: Help me administer my time spendings.
"
Class {
	#name : #TimAdm,
	#superclass : #Object,
	#instVars : [
		'days',
		'currentDay'
	],
	#category : #cmbTimeTimeTime
}

{ #category : #accessing }
TimAdm >> day: aDayInteger [
	"find day with id anInteger (or create)"

	currentDay := self days
		detect: [ :day | day isDayWithId: aDayInteger ]
		ifNone: [ self days add: (TADay newWithId: aDayInteger) ].
	^ self
]

{ #category : #accessing }
TimAdm >> days [
	^ days ifNil: [ days := OrderedCollection new ]
]

{ #category : #accessing }
TimAdm >> from: anObject to: anObject1 name: aString [ 
	currentDay add: (TADuration from: anObject to: anObject1 name: aString) 
]

{ #category : #accessing }
TimAdm >> from: anObject to: anObject1 name: aString description: aString1 [ 
	self from: anObject to: anObject1 name: aString1
]
