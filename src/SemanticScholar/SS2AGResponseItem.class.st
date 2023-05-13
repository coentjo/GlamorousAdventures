Class {
	#name : #SS2AGResponseItem,
	#superclass : #S2AGBase,
	#category : #SemanticScholar
}

{ #category : #accessing }
SS2AGResponseItem class >> for: match [ 
	
	^ self new
		rawData: match;
		yourself
]

{ #category : #accessing }
SS2AGResponseItem >> printOn: aStream [
	aStream 
		nextPutAll: '[';	
		nextPutAll: (self at: #id default: #'?');
		nextPutAll: ']';
		nextPut: Character cr;
		nextPutAll: (self at: #title default: #'?');
		nextPut: Character cr;
		nextPutAll: '[';	
		nextPutAll: (self at: #authorsYear default: #'?');
		nextPutAll: ']'

]
