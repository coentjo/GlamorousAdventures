Class {
	#name : 'ResExperiment',
	#superclass : 'ResObject',
	#category : 'ResearchBeest',
	#package : 'ResearchBeest'
}

{ #category : 'as yet unclassified' }
ResExperiment >> gtFilesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Files';
		priority: 5;
		items: self files;
		column: 'File' text: [ :each | each  ]
]

{ #category : 'as yet unclassified' }
ResExperiment >> refClass [

	^ nil class
]

{ #category : 'as yet unclassified' }
ResExperiment >> resultBackgroundColor [
	^ Color orange
]
