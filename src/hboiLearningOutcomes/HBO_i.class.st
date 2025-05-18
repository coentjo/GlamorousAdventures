Class {
	#name : #'HBO_i',
	#superclass : #Object,
	#classInstVars : [
		'architectureLayer',
		'allCompetences'
	],
	#category : #hboiLearningOutcomes
}

{ #category : #accessing }
HBO_i class >> allCompetences [
	| sw |
	allCompetences ifNil: [ 
		allCompetences := OrderedCollection new.
		sw := HBO_i software.
		allCompetences add: 
		(Competence new layer: sw;
		activity: #analyse;
		level: 3;
		description: 'NL
Analyseer zelfstandig softwareontwikkelingsprocessen, producten en informatiestromen in hun onderlinge samenhang en context in een gestructureerde maar onvoorspelbare omgeving waar problemen vaag zijn en de aanpak en oplossingsruimte open zijn. Dit vereist een combinatie van geavanceerde concepten gericht op diepere verkenning en innovatie in lokale situaties.'  )
	]
	.
	^ allCompetences
]

{ #category : #accessing }
HBO_i class >> archLayerSoftware [
]

{ #category : #accessing }
HBO_i class >> architectureLayer: aSymbol [
	architectureLayer := aSymbol
]

{ #category : #accessing }
HBO_i class >> software [
	^ HboiLayer software
]
