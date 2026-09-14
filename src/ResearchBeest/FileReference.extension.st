Extension { #name : 'FileReference' }

{ #category : '*ResearchBeest' }
FileReference >> asExperiment [
	^ ResExperiment onDir: self
]

{ #category : '*ResearchBeest' }
FileReference >> asProgram [
	^ ResProgram onDir: self
]

{ #category : '*ResearchBeest' }
FileReference >> asProject [
	^ ResProject onDir: self
]
