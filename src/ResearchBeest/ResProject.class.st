Class {
	#name : 'ResProject',
	#superclass : 'ResObject',
	#category : 'ResearchBeest',
	#package : 'ResearchBeest'
}

{ #category : 'as yet unclassified' }
ResProject >> gtLiveFor: aView [
	<gtView>
	^ aView list
		title: 'Project';
		priority: 4;
		items: { self name}
		
]

{ #category : 'as yet unclassified' }
ResProject >> refChildrenClass [

	^ ResExperiment
]

{ #category : 'as yet unclassified' }
ResProject >> resultBackgroundColor [
	^ Color blue
]
