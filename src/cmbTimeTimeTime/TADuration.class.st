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

{ #category : #'as yet unclassified' }
TADuration >> printOn: aStream [
	aStream 
		nextPutAll: 'Duration: ';
		nextPutAll: self totalHours asString;
		nextPutAll: ' hours.'
]

{ #category : #accessing }
TADuration >> to: aToTime [ 
	to := aToTime
]

{ #category : #'as yet unclassified' }
TADuration >> totalHours [
	"time is represented as Point, so 
	 >>x gives hours and
	 >>y gives minutes"
	^ (to x - from x) + ((to y - from y) / 60 ).
]
