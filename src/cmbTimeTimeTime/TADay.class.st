Class {
	#name : #TADay,
	#superclass : #Object,
	#instVars : [
		'dayId',
		'durations'
	],
	#category : #cmbTimeTimeTime
}

{ #category : #accessing }
TADay class >> newWithId: aDayInteger [ 
	^ TADay new
		dayId: aDayInteger;
		yourself
]

{ #category : #accessing }
TADay >> add: anObject [ 
	self durations add: anObject
]

{ #category : #accessing }
TADay >> dayId: aDayInteger [ 
	dayId := aDayInteger
]

{ #category : #accessing }
TADay >> durations [
	^ durations ifNil: [ durations := OrderedCollection new]
]

{ #category : #'as yet unclassified' }
TADay >> isDayWithId: aDayInteger [
	^ dayId = aDayInteger
]

{ #category : #'as yet unclassified' }
TADay >> printOn: aStream [
	aStream
		nextPutAll: dayId asString;
		nextPutAll: ': '.
	self durations
		do: [ :dur | 
			aStream
				nextPutAll: dur totalHours asString;
				nextPutAll: '>' ].
	aStream
		nextPutAll: '> ';
		nextPutAll: self totalHours asString
]

{ #category : #'as yet unclassified' }
TADay >> totalHours [
	^ (self durations collect: [ :each | each totalHours ]) 
		sum
]
