Class {
	#name : #FeedbackItem,
	#superclass : #Object,
	#instVars : [
		'text',
		'about'
	],
	#category : #PortfolioInsight
}

{ #category : #accessing }
FeedbackItem class >> text: aFeedbackText about: aContentText [
	^ self new
		text: aFeedbackText;
		about: aContentText;
		yourself
]

{ #category : #accessing }
FeedbackItem >> about: aContentText [ 
]

{ #category : #accessing }
FeedbackItem >> text: aFeedbackText [ 
]
