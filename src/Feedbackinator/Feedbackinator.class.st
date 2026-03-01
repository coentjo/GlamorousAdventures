Class {
	#name : 'Feedbackinator',
	#superclass : 'Object',
	#category : 'Feedbackinator',
	#package : 'Feedbackinator'
}

{ #category : 'accessing' }
Feedbackinator class >> letsChat [
	^ FeedbackinatorConfigurinator chat_guru new
		model: FeedbackinatorConfigurinator chatModel;
		yourself
]
