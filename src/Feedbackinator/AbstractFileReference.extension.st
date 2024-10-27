Extension { #name : #AbstractFileReference }

{ #category : #'*Feedbackinator' }
AbstractFileReference >> gtFeedbackFor: aView [
	<gtView>
	| eventLoop |
	self isDirectory
		ifFalse: [ ^ aView empty ].
		
	eventLoop := self watcher startLoop.

	^ aView columnedList
		title: 'Feedback' translated;
		priority: 8;
		updateWhen: GtFileWatcherChangeAnnouncement in: eventLoop announcer;
		items: [ self gtChildrenWithParent ];
		column: 'Icon' translated 
			icon: [ :each | 
				each isDirectory
					ifTrue: [ BrGlamorousIcons folder ]
					ifFalse: [ BrGlamorousIcons file ] ];
		column: 'Name' translated text: [ :each | 
			(self isChildOf: each)
				ifTrue: [ '..' ]
				ifFalse: [ each basename asString ] ];
		column: 'Size' translated
			text: [ :each | 
				[ each isDirectory 
					ifTrue: [ '--' ]
					ifFalse: [ each humanReadableSize asString ] ]
				on: FileException, FileSystemError
				do: [ :anException | anException return: '' ] ]
			width: 100;
		column: 'Creation' translated
			text: [ :each | 
				[ String
					streamContents: [ :s | 
						each creationTime printYMDOn: s.
						s nextPut: Character space.
						each creationTime printHMSOn: s ] ]
				on: FileException, FileSystemError
				do: [ :anException | anException return: '' ] ]
			width: 150;
		actionUpdateButton
]

{ #category : #'*Feedbackinator' }
AbstractFileReference >> gtPythonFor: aView [
	<gtView>
	| eventLoop |
	self isFile ifFalse: [ ^ aView empty ].
	[ self readStreamDo: [ :s | s next: 1000 ] ]
		on: ZnInvalidUTF8
		do: [ ^ aView empty ].

	eventLoop := self watcher startLoop.

	^ aView explicit
		title: 'Python' translated;
		priority: 60;
		updateWhen: GtFileWatcherModificationAnnouncement in: eventLoop announcer;
		stencil: [ self gtTextView: self ]
]

{ #category : #'*Feedbackinator' }
AbstractFileReference >> gtTextView: aText [
	| pane editor editorPane changeBlock originalText toolbar saveBlock pre |
	pre := 'This is a summary'.
	originalText := BlRunRopedText file: aText asFileReference.
	pane := BrVerticalPane new matchParent.
	editorPane := BrHorizontalPane new matchParent.
	editorPane padding: (BlInsets all: 5).
	editor := BrEditor new matchParent.
	changeBlock := [ editorPane
			childNamed: #modificationBar
			ifFound: [ :elmt | 
				elmt
					inUIProcessDo: [ elmt
							background: ((editor editor text equalsIgnoringAttributes: originalText)
									ifTrue: [ Color transparent ]
									ifFalse: [ elmt theme status changesBackgroundColor ]) ] ] ].
	saveBlock := [ aText gtSaveContents: editor text asString.
		originalText := BlRunRopedText file: aText.
		changeBlock value ].
	editor editor
		when: BrTextEditorInsertedEvent do: changeBlock;
		when: BrTextEditorDeletedEvent do: changeBlock;
		when: BlInfiniteDataSourceChanged do: changeBlock.
	editor
		addShortcut: (BlShortcutWithAction new
				combination: BlKeyCombination primaryS;
				action: saveBlock).
	editor editor text: (BlRunRopedText file: aText) glamorousRegularFont.
	editorPane
		addChild: (BlElement new
					width: 5;
					constraintsDo: [ :c | c vertical matchParent ];
					yourself)
			as: #modificationBar;
		addChild: editor as: #editor.
	toolbar := BrToolbar new
			aptitude: (BrGlamorousToolbarAptitude new spacing: 5);
			fitContent;
			margin: (BlInsets bottom: 5).
	toolbar
		addChild: (BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				beSmallSize;
				icon: BrGlamorousVectorIcons accept;
				label: 'Save';
				action: saveBlock)
		as: #saveButton.
	toolbar
		addChild: (BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				beSmallSize;
				icon: BrGlamorousVectorIcons cancel;
				label: 'Cancel';
				action: [ editor editor text: (BlRunRopedText file: aText) glamorousRegularFont.
					changeBlock value ])
		as: #cancelButton.
	pane addChild: editorPane.
	pane addChild: toolbar as: #toolbar.
	pane addAptitude: (BrGlamorousWithVerticalScrollbarAptitude new scrollableName: #editor).
	^ pane
]

{ #category : #'*Feedbackinator' }
AbstractFileReference >> summarized [
	^ 37
]

{ #category : #'*Feedbackinator' }
AbstractFileReference >> summary [
self halt.
	^ 'this is only a summary...'
]
