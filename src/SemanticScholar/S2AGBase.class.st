Class {
	#name : #S2AGBase,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'symbolizedRawData'
	],
	#category : #SemanticScholar
}

{ #category : #accessing }
S2AGBase >> atSym: aKey putSym: aValue [
	self symbolizedRawData at: aKey put: aValue
]

{ #category : #accessing }
S2AGBase >> rawData: someRawData [
	
	someRawData
		keysAndValuesDo: [ :k :v | 
			self atSym: k asSymbol putSym: v asSymbol ]
]

{ #category : #accessing }
S2AGBase >> symbolizedRawData [
	^ symbolizedRawData ifNil: [ symbolizedRawData := SmallIdentityDictionary new ]
]
