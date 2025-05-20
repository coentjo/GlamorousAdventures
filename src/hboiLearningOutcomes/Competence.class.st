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

{ #category : #'as yet unclassified' }
Competence >> activity [
	^ activity
]

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

{ #category : #printing }
Competence >> printOn: aStream [
	aStream 
		nextPutAll: layer asString;
		nextPutAll: ', ';
		nextPutAll: level asString;
		nextPutAll: ', ';
		nextPutAll: activity asString;
		nextPutAll: ', ';
		nextPutAll: self description
]
