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
Research >> addExperimentsDir: experimentsDir [ 
	^ self experimentsDirectories add: experimentsDir
]

{ #category : 'accessing' }
Research >> addProgramsDir: programsDir [ 
	^ self programsDirectories add: programsDir
]

{ #category : 'accessing' }
Research >> addProjectsDir: projectsDir [ 
	^ self projectsDirectories add: projectsDir
]

{ #category : 'accessing' }
Research >> experimentsDirectories [
	^ experimentsDirectories ifNil: [experimentsDirectories := OrderedCollection new]
]

{ #category : 'accessing' }
Research >> programsDirectories [
	^ programsDirectories ifNil: [programsDirectories := OrderedCollection new]
]

{ #category : 'accessing' }
Research >> projectsDirectories [
	^ projectsDirectories ifNil: [projectsDirectories := OrderedCollection new]
]
