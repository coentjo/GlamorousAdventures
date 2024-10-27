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
