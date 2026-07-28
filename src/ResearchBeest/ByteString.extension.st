Extension { #name : 'ByteString' }

{ #category : '*ResearchBeest' }
ByteString >> asExperiment [
	"Open a directory as a ResExperiment"

	"Self should be an existing path.
	 if not existing: return FileRef, so user can (choose to) create path in inspector. "

	^ self asFileReference
		ifExists: [ :fileRef | ResExperiment onDir: fileRef ]
		ifAbsent: [ :fileRef | 
			self inform: 'Path does not exist: Create if you want'.
			fileRef ]
]
