Extension { #name : #AbstractFileReference }

{ #category : #'*Portflowionator' }
AbstractFileReference >> createMarkdownForMyself [
	"call shell process (uses Pandoc!), I only tested in MacOS at this moment"

	"Copied from the Class Comment from the used class"

	| proc |
	"pandoc -s plan_v1.docx -t md -o plan_v1.docx.md"
	proc := GtSubprocessWithInMemoryOutput
			command: 'pandoc'
			arguments: { '-s' . self pathString . '-t' . 'markdown' . '-o' . self pathString, '.md' }.
	proc errorBlock: [ :prc | self halt; error: 'External process failed, see proc' ].
	proc runAndWait.
	proc stdout.

	^ self
]

{ #category : #'*Portflowionator' }
AbstractFileReference >> createSummaryForMySelf [
	"call shell process (uses Pandoc!), I only tested in MacOS at this moment"

	"Copied from the Class Comment from the used class"

	| proc |
	"cat ~/git/tools/fabric/system.md | fabric --pattern summarize > "
	"pandoc -s plan_v1.docx -t md -o plan_v1.docx.md"
	proc := GtSubprocessWithInMemoryOutput
			command: 'pandoc'
			arguments: { '-s' . self pathString . '-t' . 'markdown' . '-o' . self pathString, '.summary.md' }.
	proc errorBlock: [ :prc | self halt; error: 'External process failed, see proc' ].
	proc runAndWait.
	proc stdout.

	^ self
]

{ #category : #'*Portflowionator' }
AbstractFileReference >> gtDiffFor: aView [
	<gtView>
	| eventLoop |
	self isFile ifFalse: [ ^ aView empty ].
	[ self readStreamDo: [ :s | s next: 1000 ] ]
		on: ZnInvalidUTF8
		do: [ ^ aView empty ].

	eventLoop := self watcher startLoop.

	^ aView diff
		title: 'diff' translated;
		priority: 60;
		from: [ (self parent / 'plan_v1.docx.md' ) contents ];
		to: [self contents]
]

{ #category : #'*Portflowionator' }
AbstractFileReference >> gtPandoc [
	| details |
	details := {
		{ #self . self }.
		{ #printString. self printString }.
		{ #gtDisplayString. self gtDisplayString }.
		{ #pathString . self pathString }.
		{ #URL . 
			(self isAbsolute and: [ self path isAbsolute ]) 
				ifTrue: [ self asUrl ] 
				ifFalse: [ '' ] }.
		{ #base . self base }.
		{ #basename . self basename }.
		{ #extension . self extension }.
		{ #parent . self parent }.
		{ #path . self path }.
		{ #fullPath . self fullPath }.
		{ #absolutePath . self absolutePath }. 
		{ #fileSystem . self fileSystem }.
		{ #exists . self exists }.
		{ #isFile . self isFile }.
		{ #isDirectory . self isDirectory }.
		{ #isAbsolute . self isAbsolute }.
		{ #isRelative . [self inform: 'asd'] }.
	}.
	^ details
]

{ #category : #'*Portflowionator' }
AbstractFileReference >> gtPandocFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Pandoc';
		priority: 52;
		actionButtonIcon: BrGlamorousIcons bothsides 
			action: [ :aButton |  | md |
				md :=  self createMarkdownForMyself.
				aButton phlow spawnObject: md];

		items: [ self gtPandoc ];
		column: 'key' text: #first;
		column: 'value' text: #second weight: 3;
		send: #last
]

{ #category : #'*Portflowionator' }
AbstractFileReference >> gtSummaryFor: aView [
	<gtView>
	| eventLoop |
	self isFile ifFalse: [ ^ aView empty ].
	[ self readStreamDo: [ :s | s next: 1000 ] ]
		on: ZnInvalidUTF8
		do: [ ^ aView empty ].

	eventLoop := self watcher startLoop.

	^ aView explicit
		title: 'Summary' translated;
		priority: 53;
		actionButtonIcon: BrGlamorousIcons bothsides
			action: [ :aButton | 
				| md |
				md := self createSummaryForMySelf.
				aButton phlow spawnObject: md ];
		updateWhen: GtFileWatcherModificationAnnouncement in: eventLoop announcer;
		stencil: [ self gtTextView: self ]
]
