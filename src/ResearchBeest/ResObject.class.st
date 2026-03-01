Class {
	#name : 'ResObject',
	#superclass : 'Object',
	#instVars : [
		'resProperty'
	],
	#category : 'ResearchBeest',
	#package : 'ResearchBeest'
}

{ #category : 'as yet unclassified' }
ResObject class >> onDir: aDirRef [ 
	"nog nie helemaal netjes... :-( "
	^ self new
		programDir: aDirRef;
		yourself
]

{ #category : 'as yet unclassified' }
ResObject >> name [
	^ self programDir asFileReference name
]

{ #category : 'as yet unclassified' }
ResObject >> printOn: aStream [
	aStream nextPutAll: self programDir asString
]

{ #category : 'as yet unclassified' }
ResObject >> programDir [
	^ self researchProperty first
]

{ #category : 'as yet unclassified' }
ResObject >> programDir: each [ 
	^ self researchProperty add: each
]

{ #category : 'as yet unclassified' }
ResObject >> researchProperty [
	^ resProperty ifNil: [resProperty := OrderedCollection new]
]

{ #category : 'as yet unclassified' }
ResObject >> when [
	^ self programDir parent name
]
