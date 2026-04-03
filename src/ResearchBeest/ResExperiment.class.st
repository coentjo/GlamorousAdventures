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
		column: 'File' text: [ :each | each ];
		actionButtonIcon: BrGlamorousVectorIcons classicon
			tooltip: 'open in cursor'
			action: [ :aButton | 
				| process |
				[ process := GtExternalProcessBuilder new
						command: 'openInCursor';
						arg: self resObjectDir pathString;
						pipeStdout;
						spawn ]
					onErrorDo: [ self inform: 'Check from CLI there is a runnable script openInCursor in PATH' ] ]
]

{ #category : 'as yet unclassified' }
ResExperiment >> refChildrenClass [

	^ nil class
]

{ #category : 'as yet unclassified' }
ResExperiment >> researchChildren [
	^ {}
]

{ #category : 'as yet unclassified' }
ResExperiment >> resultBackgroundColor [
	^ Color orange
]
