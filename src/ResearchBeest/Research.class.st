Class {
	#name : 'Research',
	#superclass : 'Object',
	#instVars : [
		'programsDirectories',
		'projectsDirectories',
		'experimentsDirectories'
	],
	#category : 'ResearchBeest',
	#package : 'ResearchBeest'
}

{ #category : 'accessing' }
Research >> addExperimentsDirs: experimentsDir [ 
	^ self experimentsDirectories addAll: experimentsDir
]

{ #category : 'accessing' }
Research >> addProgramsDirs: programsDirs [ 
	^ self programsDirectories addAll: programsDirs
]

{ #category : 'accessing' }
Research >> addProjectsDirs: projectsDir [ 
	^ self projectsDirectories addAll: projectsDir
]

{ #category : 'as yet unclassified' }
Research >> exampleSimpleResearch [
	<gtExample>
	| aResearch |
	aResearch := Research new
		addProgramsDirs: { FileReference gtExampleDirectory }
		.
	self assert: aResearch programs size equals: aResearch programs size.
	^ aResearch
]

{ #category : 'as yet unclassified' }
Research >> experiments [
	| prgs |
	prgs := OrderedCollection new.
	self experimentsDirectories
		do: [ :whenDir | prgs addAll: whenDir directories ].
	^ prgs collect: [ :each | ResExperiment onDir: each ]
]

{ #category : 'accessing' }
Research >> experimentsDirectories [
	^ experimentsDirectories ifNil: [experimentsDirectories := OrderedCollection new]
]

{ #category : 'as yet unclassified' }
Research >> gtDirsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'dirs';
		priority: 25;
		items: self programsDirectories , self projectsDirectories
				, self experimentsDirectories;
		column: 'name' text: [ :each | each name ]	"column: 'parent' text: [ :each | each firstPropty parent basename ] width: 50;"
]

{ #category : 'as yet unclassified' }
Research >> gtExperimentsFor: aView [
	<gtView>

	^ aView columnedList
		title: 'Experiments';
		priority: 18;
		items: self experiments ;
		"column: 'parent' text: [ :each | each firstPropty parent basename ] width: 50;"
		column: 'name' text: [ :each | each when ] width: 50;
		column: 'name' text: [ :each | each name ]
]

{ #category : 'as yet unclassified' }
Research >> gtProgramsFor: aView [
	<gtView>

	^ aView columnedList
		title: 'Programs';
		priority: 14;
		items: self programs ;
		"column: 'parent' text: [ :each | each firstPropty parent basename ] width: 50;"
		column: 'name' text: [ :each | each when ] width: 50;
		column: 'name' text: [ :each | each name ]
]

{ #category : 'as yet unclassified' }
Research >> gtProjectsFor: aView [
	<gtView>

	^ aView columnedList
		title: 'Projects';
		priority: 16;
		items: self projects;
		"column: 'parent' text: [ :each | each firstPropty parent basename ] width: 50;"
		column: 'name' text: [ :each | each when ] width: 50;
		column: 'name' text: [ :each | each name ]
]

{ #category : 'as yet unclassified' }
Research >> programs [
	| prgs |
	prgs := OrderedCollection new.
	self programsDirectories
		do: [ :whenDir | prgs addAll: whenDir directories ].
	^ prgs collect: [ :each | ResProgram onDir: each ]
]

{ #category : 'accessing' }
Research >> programsDirectories [
	^ programsDirectories ifNil: [ programsDirectories := OrderedCollection new ]
]

{ #category : 'as yet unclassified' }
Research >> projects [
	| prjs |
	prjs := OrderedCollection new.
	self projectsDirectories do: [ :each | 
		each directories do: [ :file | 
			prjs add: file ] ].
	^ prjs collect: [ :each | ResProject onDir: each ]
]

{ #category : 'accessing' }
Research >> projectsDirectories [
	^ projectsDirectories ifNil: [projectsDirectories := OrderedCollection new]
]
