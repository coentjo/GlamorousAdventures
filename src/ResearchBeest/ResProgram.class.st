Class {
	#name : 'ResProgram',
	#superclass : 'ResObject',
	#category : 'ResearchBeest',
	#package : 'ResearchBeest'
}

{ #category : 'accessing' }
ResProgram >> potentialChildren [
	"for a Program the children are of type Project, For a Project the type of the children is an Experiment , The method >>refClass gives you the type of your children "
	| childClass |
	childClass := self refChildrenClass.
	
]

{ #category : 'as yet unclassified' }
ResProgram >> refChildrenClass [

	^ ResProject
]

{ #category : 'as yet unclassified' }
ResProgram >> resultBackgroundColor [
	^ Color darkGray
]
