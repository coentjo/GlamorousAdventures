Class {
	#name : #S2AGBase,
	#superclass : #Object,
	#instVars : [
		'symbolizedRawData'
	],
	#category : #SemanticScholar
}

{ #category : #accessing }
S2AGBase >> at: aStringOrSymbol default: aDefaultStringOrSymbol [
^
	symbolizedRawData
		ifNil: aDefaultStringOrSymbol asSymbol
		ifNotNil: [ :data | data at: aStringOrSymbol asSymbol ifAbsent: aDefaultStringOrSymbol asSymbol ]
]

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
