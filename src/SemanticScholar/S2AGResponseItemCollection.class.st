Class {
	#name : #S2AGResponseItemCollection,
	#superclass : #S2AGCollectionBase,
	#instVars : [
		'articles'
	],
	#category : #SemanticScholar
}

{ #category : #accessing }
S2AGResponseItemCollection >> addResponseItemFor: match [ 
	self responseItems add: (S2AGArticle  on: match)
]

{ #category : #accessing }
S2AGResponseItemCollection >> exampleQueryFakenews [
	<gtExample>
	<script: 'self new exampleQueryFakenews'> 
	| query url json rawData |
	query := 'fakenews'.
	url := 'https://api.semanticscholar.org/graph/v1/paper/autocomplete?query=', query.
	json := ZnClient new get: url.
	rawData := STON fromString: json.
	^ (self rawData: rawData) inspect
]

{ #category : #accessing }
S2AGResponseItemCollection >> gtItemsFor: aView [
	<gtView>
	^ aView list
		title: 'Matches';
		priority: 25;
		items: [self responseItems]
]

{ #category : #accessing }
S2AGResponseItemCollection >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll: ' (';
		nextPutAll: self responseItems size asString;
		nextPutAll: ')'
]

{ #category : #accessing }
S2AGResponseItemCollection >> rawData: someRawData [
	"A response gets an array of S2AGResponseItems"
	(someRawData at: 'matches') do: [ :match | 
		self addResponseItemFor: match ].

]

{ #category : #accessing }
S2AGResponseItemCollection >> responseItems [
	^ articles ifNil: [ articles := OrderedCollection new]
]
