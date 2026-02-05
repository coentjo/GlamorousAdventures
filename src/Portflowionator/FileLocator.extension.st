Extension { #name : 'FileLocator' }

{ #category : '*Portflowionator' }
FileLocator >> predecessor [
	"predecessor of plan_v1.docx.md should be plan_v1.docx"
	"So predecessor of 'title'++'something' should be the longest one with 'title' "
	
]

{ #category : '*Portflowionator' }
FileLocator >> predecessorFrom: aCollection [
	"predecessor of plan_v1.docx.md should be plan_v1.docx"
	"So predecessor of 'title'++'something' should be the longest one with 'title' "
	
	| col predecessor |
	self basename.
	col := aCollection select: [ :item | 
		self ~= item
		and: [self basename beginsWith: item basename ] ].
	predecessor := col first.
	col do: [ :item | item basename size > predecessor basename size ifTrue: [predecessor := item]].
	^ predecessor
	
]
