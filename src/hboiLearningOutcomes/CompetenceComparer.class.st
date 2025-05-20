Class {
	#name : #CompetenceComparer,
	#superclass : #Object,
	#instVars : [
		'competences'
	],
	#category : #hboiLearningOutcomes
}

{ #category : #accessing }
CompetenceComparer >> compare: aCompetence to: anotherCompetence [ 
	competences := { aCompetence . anotherCompetence }
]

{ #category : #'as yet unclassified' }
CompetenceComparer >> gtRawFor: aView [
	<gtView>
	^ aView explicit
		title: 'Diff';
		priority: 19;
		stencil: [ GtDiffElementWithLabelStencil new
				fromLabelText: 'one:';
				toLabelText: 'other:';
				change: ((competences at: 1) description ) ];
		yourself
]
