"
# wKLDJHFKJSDHF
SDFG
DSFGDSFG

"
Class {
	#name : #S2AGArticle,
	#superclass : #S2AGBase,
	#instVars : [
		'paperId',
		'title'
	],
	#category : #SemanticScholar
}

{ #category : #accessing }
S2AGArticle class >> citedPaper: aCitedPaperDictionary [
	^ self new
		paperId: ( aCitedPaperDictionary at: 'paperId');
		title: ( aCitedPaperDictionary at: 'title')
]

{ #category : #accessing }
S2AGArticle class >> on: someRawData [
	^ self new rawData: someRawData
]

{ #category : #accessing }
S2AGArticle >> at: aStringOrSymbol default: aDefaultStringOrSymbol [
^
	rawData
		ifNil: aDefaultStringOrSymbol asSymbol
		ifNotNil: [ :data | data at: aStringOrSymbol asSymbol ifAbsent: aDefaultStringOrSymbol asSymbol ]
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
	^ paperId ifNil: [ 
		rawData 
			at: 'id' 
			ifAbsent: [ rawData halt ] ]
]

{ #category : #accessing }
S2AGArticle >> paperId: aPaperId [
	paperId := aPaperId asSymbol 
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
		nextPutAll: (self at: #paperId default: #'?');
		nextPutAll: ']'
]

{ #category : #accessing }
S2AGArticle >> rawData: someRawData [ 
	rawData := someRawData
]

{ #category : #accessing }
S2AGArticle >> referencedpapers [
	| json array url |
	url := 'https://api.semanticscholar.org/graph/v1/paper/649def34f8be52c8b66281af98ae884c09aef38b/references'.
	json := ZnClient new get: url.
	array := (STON fromString: json) at: 'data'.
	^ array collect: [ :dict | S2AGArticle citedPaper: (dict at: 'citedPaper') ]
]

{ #category : #accessing }
S2AGArticle >> title [
	^ self at: #title default: #'?'
]

{ #category : #accessing }
S2AGArticle >> title: aString [
	title := aString
	
]
