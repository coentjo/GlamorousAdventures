Extension { #name : 'ByteString' }

{ #category : '*ResearchBeest' }
ByteString >> asExperiment [
	"Open a directory as a ResExperiment"

	"Self should be an existing path.
	 if not existing: return FileRef, so user can (choose to) create path in inspector. "

	^ self asFileReference
		ifExists: [ :fileRef | fileRef asExperiment ]
		ifAbsent: [ :fileRef | 
			self inform: 'Path does not exist: Create if you want'.
			fileRef ]
]

{ #category : '*ResearchBeest' }
ByteString >> asProgram [
	"Open a directory as a ResProgram"

	"Self should be an existing path.
	 if not existing: return FileRef, so user can (choose to) create path in inspector. "

	^ self asFileReference
		ifExists: [ :fileRef | fileRef asProgram ]
		ifAbsent: [ :fileRef | 
			self inform: 'Path does not exist: Create if you want'.
			fileRef ]
]

{ #category : '*ResearchBeest' }
ByteString >> asProject [
	"Open a directory as a ResProject"

	"Self should be an existing path.
	 if not existing: return FileRef, so user can (choose to) create path in inspector. "

	^ self asFileReference
		ifExists: [ :fileRef | fileRef asProject ]
		ifAbsent: [ :fileRef | 
			self inform: 'Path does not exist: Create if you want'.
			fileRef ]
]
