Extension { #name : 'ByteString' }

{ #category : '*ResearchBeest' }
ByteString >> asExperiment [
	^ ResExperiment onDir: self asFileReference
]
