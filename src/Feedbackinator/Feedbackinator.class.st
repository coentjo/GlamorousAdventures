Class {
	#name : #Feedbackinator,
	#superclass : #Object,
	#category : #Feedbackinator
}

{ #category : #accessing }
Feedbackinator class >> letsChat [
	^ FeedbackinatorConfigurinator chat_guru new
		model: FeedbackinatorConfigurinator chatModel;
		yourself
]
