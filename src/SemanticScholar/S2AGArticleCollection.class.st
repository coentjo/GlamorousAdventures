Class {
	#name : #S2AGArticleCollection,
	#superclass : #S2AGCollectionBase,
	#instVars : [
		'articles'
	],
	#classInstVars : [
		'articlesCollection'
	],
	#category : #SemanticScholar
}

{ #category : #'as yet unclassified' }
S2AGArticleCollection class >> allArticles [

	^ articlesCollection ifNil: [
		  articlesCollection := IdentityDictionary ]
]

{ #category : #accessing }
S2AGArticleCollection >> addResponseItemFor: match [ 
	self responseItems add: (S2AGArticle  on: match)
]

{ #category : #accessing }
S2AGArticleCollection >> exampleQueryFakenews [
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
S2AGArticleCollection >> gtItemsFor: aView [
	<gtView>
	^ aView list
		title: 'Matches';
		priority: 25;
		items: [self responseItems]
]

{ #category : #accessing }
S2AGArticleCollection >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll: ' (';
		nextPutAll: self responseItems size asString;
		nextPutAll: ')'
]

{ #category : #accessing }
S2AGArticleCollection >> rawData: someRawData [
	"A response gets an array of S2AGResponseItems"
	(someRawData at: 'matches') do: [ :match | 
		self addResponseItemFor: match ].

]

{ #category : #accessing }
S2AGArticleCollection >> responseItems [
	^ articles ifNil: [ articles := OrderedCollection new]
]
