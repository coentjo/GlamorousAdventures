Class {
	#name : #Competence,
	#superclass : #Object,
	#instVars : [
		'layer',
		'activity',
		'level',
		'description'
	],
	#category : #hboiLearningOutcomes
}

{ #category : #accessing }
Competence >> activity: aString [ 
	activity := aString
]

{ #category : #'as yet unclassified' }
Competence >> description [
	^ description
]

{ #category : #accessing }
Competence >> description: aString [ 
	description := aString
]

{ #category : #accessing }
Competence >> layer: aLayer [
	layer := aLayer
	
]

{ #category : #accessing }
Competence >> level: anInteger [ 
	level := anInteger
]

{ #category : #'as yet unclassified' }
Competence >> printOn: aStream [
	aStream nextPutAll: self description
]
