Class {
	#name : 'ResProgram',
	#superclass : 'ResObject',
	#category : 'ResearchBeest',
	#package : 'ResearchBeest'
}

{ #category : 'as yet unclassified' }
ResProgram >> gtProjectsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Projects';
		priority: 12;
		items: self children
]

{ #category : 'as yet unclassified' }
ResProgram >> refClass [

	^ ResProject
]

{ #category : 'as yet unclassified' }
ResProgram >> resultBackgroundColor [
	^ Color darkGray
]
