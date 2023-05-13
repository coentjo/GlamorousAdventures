Class {
	#name : #S2AGResponse,
	#superclass : #S2AGBase,
	#category : #SemanticScholar
}

{ #category : #accessing }
S2AGResponse >> authorsYear [
	^ rawData at: 'authorsYear'
]

{ #category : #accessing }
S2AGResponse >> exampleQueryFakenews [
	<gtExample>
	| query url json |
	query := 'fakenews'.
	url := 'https://api.semanticscholar.org/graph/v1/paper/autocomplete?query=', query.
	json := ZnClient new get: url.
	rawData := STON fromString: json.
	^ S2AGResponse new rawData: rawData
]

{ #category : #accessing }
S2AGResponse >> gtItemsFor: aView [
	<gtView>
	^ aView list
		title: 'Matches';
		priority: 25;
		items: [self responseItems]
]

{ #category : #accessing }
S2AGResponse >> printOn: aStream [
	aStream nextPutAll: 'asd'
]

{ #category : #accessing }
S2AGResponse >> responseItems [
	| matches |
	matches := rawData at: 'matches'.
	^ matches collect: [:each | S2AGArticle on: each]
]

{ #category : #accessing }
S2AGResponse >> semanticId [
	^ rawData at: 'id'
]
