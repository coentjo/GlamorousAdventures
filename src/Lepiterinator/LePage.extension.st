Extension { #name : 'LePage' }

{ #category : '*Lepiterinator' }
LePage >> gtResearchPagesMapFor: aView [
	"Inspired by: LePage>>gtReachablePagesMapFor: "

	<gtView>
	^ aView mondrian
		title: 'Research';
		painting: [ :m | self researchPagesMapFor: m from: self ]
]

{ #category : '*Lepiterinator' }
LePage >> researchPagesMapFor: aMondrian from: aStartPage [
"reachablePagesMapFor: aMondrian from: aStartPage"
	"Inspired by: Optimizing the links in the book for first time readers
	The map shows the current page in blue, reachable pages in dark green, and unreachable pages in red. To avoid clutter, the ToC page is not included, but is considered for reachability. Nodes are scaled according to their word count.
	Only named pages are included."

	| nonTocPages allReachedPages minSize maxSize maxWordVal |
	nonTocPages := self database pagesByName reject: #isTableOfContents.

	allReachedPages := aStartPage
			deepCollect: [ :each | 
				each allChildOutgoingTextualLinks
					collectAsSet: [ :x | x target ifNotNil: #page ] ].
	maxWordVal := (self database pages collect: #wordCount) max sqrt.
	minSize := 5.
	maxSize := 25.

	aMondrian nodes
		stencil: [ :each | 
			| element color size scaledSize |
			color := (allReachedPages includes: each)
					ifTrue: [ Color green darker ]
					ifFalse: [ Color red  ].
			scaledSize := ((maxSize - minSize) * each wordCount sqrt / maxWordVal)
					truncated + minSize.
			size := scaledSize @ scaledSize.
			(each title matches: '*experiment*') ifTrue: [color := Color blue].
			(each title matches: '*?*') ifTrue: [color := Color orange].
			each = aStartPage
				ifTrue: [ color := Color yellow.
					size := 30 @ 30 ].
			element := BlElement new
				background: color;
				size: size;
				geometry: BlCircleGeometry new;
				when: BlClickEvent
					do: [ :e | e currentTarget phlow spawnTool: each asPhlowTool ];
				aptitude: (self hoverPage: each forNodeElement: element) ];
		with: nonTocPages.
	aMondrian edges
		stencil: [ BlLineElement new
				border: Color veryLightGray;
				toHead: (BlArrowheadSimpleArrow new border: Color veryLightGray);
				zIndex: -1 ];
		connectToAll: [ :page | page allOutgoingTextualLinks collectAsSet: #target ].
"	aMondrian layout  force
		nbIterations: 30;
		charge: -50."
	aMondrian layout sugiyama.
	^ aMondrian
]
