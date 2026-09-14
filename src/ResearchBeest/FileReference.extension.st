Extension { #name : 'FileReference' }

{ #category : '*ResearchBeest' }
FileReference >> asExperiment [
	^ ResExperiment onDir: self
]
