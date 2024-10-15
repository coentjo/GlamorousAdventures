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
