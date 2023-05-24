Class {
	#name : #WAS2HeaderComponent,
	#superclass : #WAComponent,
	#category : #SemanticScholarWeb
}

{ #category : #rendering }
WAS2HeaderComponent >> renderContentOn: html [

	html heading level2 with: 'Examples'.
	html button
		with: 'Pri'
]
