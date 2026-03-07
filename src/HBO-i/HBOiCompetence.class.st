Class {
	#name : 'HBOiCompetence',
	#superclass : 'Object',
	#instVars : [
		'json'
	],
	#category : 'HBO-i',
	#package : 'HBO-i'
}

{ #category : 'accessing' }
HBOiCompetence class >> level: aLevel activity: anActivity architectureLayer: anArchLayer [
]

{ #category : 'accessing' }
HBOiCompetence class >> on: aJsonObject [
	^ self new
		json: aJsonObject;
		yourself
]

{ #category : 'accessing' }
HBOiCompetence >> json: aJsonObject [ 
	json := aJsonObject

]

{ #category : 'as yet unclassified' }
HBOiCompetence >> name [
	^ json at: 'value'
]

{ #category : 'as yet unclassified' }
HBOiCompetence >> printOn: aStream [
	aStream nextPutAll: self name
]
