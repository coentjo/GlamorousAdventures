Class {
	#name : #TADuration,
	#superclass : #Object,
	#instVars : [
		'from',
		'to',
		'name'
	],
	#category : #cmbTimeTimeTime
}

{ #category : #accessing }
TADuration class >> from: aFromTime to: aToTime name: aSymbol [ 
	^ self new
		from: aFromTime;
		to: aToTime;
		name: aSymbol;
		yourself
]

{ #category : #accessing }
TADuration >> from: aFromTime [ 
	from := aFromTime
]

{ #category : #accessing }
TADuration >> name: aSymbol [ 
	name := aSymbol
]

{ #category : #accessing }
TADuration >> to: aToTime [ 
	to := aToTime
]
