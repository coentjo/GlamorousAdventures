Class {
	#name : #S2AGArticle,
	#superclass : #S2AGBase,
	#category : #SemanticScholar
}

{ #category : #accessing }
S2AGArticle class >> citedPaper: aCitedPaperDictionary [
	^ self new
		rawData: aCitedPaperDictionary
]

{ #category : #accessing }
S2AGArticle class >> on: someRawData [
	^ self new rawData: someRawData
]

{ #category : #accessing }
S2AGArticle >> authorsYear [
	^ rawData ifNotNil: [ :data | data at: 'authorsYear' ifAbsent: 0] ifNil: ['']
]

{ #category : #accessing }
S2AGArticle >> citedPaper: aCitedPaperDictionary [ 
]

{ #category : #accessing }
S2AGArticle >> gtCitesFor: aView [
	<gtView>
	^ aView list
		title: 'Cites';
		priority: 25;
		items: [ #(1 2 3)];
		itemText: [ :each | each asString]
		
]

{ #category : #accessing }
S2AGArticle >> gtRefsFor: aView [
	<gtView>
	^ aView list
		title: 'Refs';
		priority: 25;
		items: self referencedpapers;
		itemText: [ :each | each asString]
		
]

{ #category : #accessing }
S2AGArticle >> paperId [
	^ symbolizedRawData at: #paperId ifAbsent: [ symbolizedRawData at: #id ]
]

{ #category : #accessing }
S2AGArticle >> printOn: aStream [
	aStream
		nextPutAll: '[';
		nextPutAll: (self at: #authorsYear default: #'?');
		nextPutAll: ']';
		nextPut: Character cr;
		nextPutAll: (self at: #title default: #'?');
		nextPut: Character cr;
		nextPutAll: '[';
		nextPutAll: (self paperId);
		nextPutAll: ']';
		nextPut: Character cr";
		nextPutAll: '[refs:';
		nextPutAll: (self referencedpapers size asString);
		nextPutAll: ']'"
]

{ #category : #accessing }
S2AGArticle >> referencedpapers [
	| json array url |
	url := 'https://api.semanticscholar.org/graph/v1/paper/',
		self paperId asString,
		'/references'.
	json := ZnClient new get: url.
	array := (STON fromString: json) at: 'data'.
	^ array collect: [ :dict | S2AGArticle citedPaper: (dict at: 'citedPaper') ]
]
