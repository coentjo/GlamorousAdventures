Class {
	#name : #FeedbackItem,
	#superclass : #Object,
	#instVars : [
		'text',
		'about',
		'timeStamp'
	],
	#category : #PortfolioInsight
}

{ #category : #accessing }
FeedbackItem class >> on: anObject [ 
	^ self new 
		about: anObject;
		datetime: DateAndTime now;
		yourself
]

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
FeedbackItem >> datetime: aDateAndTime [
	timeStamp := aDateAndTime
]

{ #category : #accessing }
FeedbackItem >> text: aFeedbackText [ 
]
