Class {
	#name : #FeedbackinatorConfigurinator,
	#superclass : #Object,
	#classInstVars : [
		'config'
	],
	#category : #Feedbackinator
}

{ #category : #'as yet unclassified' }
FeedbackinatorConfigurinator class >> chatModel [
	^ config at: #chat_model ifAbsent: 'phi3'
]

{ #category : #'as yet unclassified' }
FeedbackinatorConfigurinator class >> chat_guru [
	^ config at: #chat_guru ifAbsent: GtOllamaChat
]

{ #category : #accessing }
FeedbackinatorConfigurinator class >> from: anObject chose: anInteger [ 
]

{ #category : #accessing }
FeedbackinatorConfigurinator class >> from: aCollection chose: anInteger as: anOptionSymbol [

	config ifNil: [ config := Dictionary new].
	config at: anOptionSymbol put: (aCollection at: anInteger)
]
