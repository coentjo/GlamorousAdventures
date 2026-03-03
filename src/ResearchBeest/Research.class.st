Class {
	#name : 'Research',
	#superclass : 'Object',
	#instVars : [
		'programsDirectories',
		'projectsDirectories',
		'experimentsDirectories'
	],
	#category : 'ResearchBeest',
	#package : 'ResearchBeest'
}

{ #category : 'accessing' }
Research >> addExperimentsDirs: experimentsDir [ 
	^ self experimentsDirectories addAll: experimentsDir
]

{ #category : 'accessing' }
Research >> addProgramsDirs: programsDirs [ 
	^ self programsDirectories addAll: programsDirs
]

{ #category : 'accessing' }
Research >> addProjectsDirs: projectsDir [ 
	^ self projectsDirectories addAll: projectsDir
]

{ #category : 'as yet unclassified' }
Research >> exampleSimpleResearch [
	<gtExample>
	| aResearch |
	aResearch := Research new
		addProgramsDirs: { FileReference gtExampleDirectory }
		.
	self assert: aResearch programs size equals: aResearch programs size.
	^ aResearch
]

{ #category : 'as yet unclassified' }
Research >> experiments [
	| prgs |
	prgs := OrderedCollection new.
	self experimentsDirectories
		do: [ :whenDir | prgs addAll: whenDir directories ].
	^ prgs collect: [ :each | ResExperiment onDir: each ]
]

{ #category : 'accessing' }
Research >> experimentsDirectories [
	^ experimentsDirectories ifNil: [experimentsDirectories := OrderedCollection new]
]

{ #category : 'as yet unclassified' }
Research >> gtDirsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'dirs';
		priority: 25;
		items: self programsDirectories , self projectsDirectories
				, self experimentsDirectories;
		column: 'name' text: [ :each | each name ]	"column: 'parent' text: [ :each | each firstPropty parent basename ] width: 50;"
]

{ #category : 'as yet unclassified' }
Research >> gtExperimentsFor: aView [
	<gtView>

	^ aView columnedList
		title: 'Experiments';
		priority: 18;
		items: self experiments ;
		"column: 'parent' text: [ :each | each firstPropty parent basename ] width: 50;"
		column: 'name' text: [ :each | each when ] width: 50;
		column: 'name' text: [ :each | each name ]
]

{ #category : 'as yet unclassified' }
Research >> gtMap2For: aView [
"Copied from GtReactFunctionComponentGroup>>gtReactDependenciesFor: aView"

	<gtView>
	^ aView mondrian
		  title: 'map 2';
		  priority: 8;
		  painting: [ :m | 
			  m nodes
				  stencil: [ :c | 
					  BrLabel new
						  when: BlClickEvent do: [ :e | e target phlow spawnObject: c ];
						  aptitude: BrGlamorousLabelAptitude + (BrStyleCommonAptitude new
										hovered: [ :aStyle | aStyle background: (BrGlamorousColors selectedListItemColor) ]);
						  text: c name ];
				  with: self.

			  "React calls"
			  m edges
				  toLeftCenter;
				  fromRightCenter;
				  stencil: [ :r | 
					  BlParabollaArcElement new
						  when: BlClickEvent do: [ :e | e target phlow spawnObject: r ];
						  zIndex: -1;
						  curvatureFraction: 0.3;
						  border: (BlBorder paint: (Color orange alpha: 0.5) width: 1);
						  toHead: (BlArrowheadSimpleArrow new border: (BlBorder builder
										    paint: (Color orange alpha: 0.5);
										    width: 1;
										    build)) ];
				  connect: self mooseModel allReactComponentReferences
				  from: #sender
				  to: [ :r | 
					  r candidates isEmpty
						  ifTrue: [ nil ]
						  ifFalse: [ r candidates anyOne ] ].

			  "JavaScript calls"
			  m edges
				  toLeftCenter;
				  fromRightCenter;
				  stencil: [ :r | 
					  BlParabollaArcElement new
						  when: BlClickEvent do: [ :e | e target phlow spawnObject: r ];
						  zIndex: -1;
						  curvatureFraction: 0.3;
						  border: (BlBorder paint: (Color blue alpha: 0.5) width: 2);
						  toHead: (BlArrowheadSimpleArrow new border: (BlBorder builder
										    paint: (Color blue alpha: 0.5);
										    width: 2;
										    build)) ];
				  connect: self
				  fromAll: [ :r | r incomingInvocations collect: #from ]
				  to: #yourself.

			  m layout custom: GtGraphHorizontalDominanceTreeLayout new layered ]
]

{ #category : 'as yet unclassified' }
Research >> gtProgramsFor: aView [
	<gtView>

	^ aView columnedList
		title: 'Programs';
		priority: 14;
		items: self programs ;
		"column: 'parent' text: [ :each | each firstPropty parent basename ] width: 50;"
		column: 'name' text: [ :each | each when ] width: 50;
		column: 'name' text: [ :each | each name ]
]

{ #category : 'as yet unclassified' }
Research >> gtProjectsFor: aView [
	<gtView>

	^ aView columnedList
		title: 'Projects';
		priority: 16;
		items: self projects;
		"column: 'parent' text: [ :each | each firstPropty parent basename ] width: 50;"
		column: 'name' text: [ :each | each when ] width: 50;
		column: 'name' text: [ :each | each name ]
]

{ #category : 'as yet unclassified' }
Research >> gtStagesMapFor: aView [
"copied from JcPipelineRun>>gtStagesMapFor: aView"
	<gtView>
	^ aView mondrian
		title: 'map 1' translated;
		priority: 4;
		painting: [ :mondrian | 
			| allNodes |
			allNodes := self nodes.
			mondrian nodes
				shape: [ :aStage | 
					| container statusColor programContainer duration |
					statusColor := aStage resultBackgroundColor.
					container := BrHorizontalPane new
							hExact: 200 ;
							vFitContent;
							aptitude: BrShadowAptitude;
							clipChildren: false;
							margin: (BlInsets all: 10);
							background: Color white;
							zIndex: 1;
							when: BlClickEvent do: [ :e | e target phlow spawnObject: aStage ].
							
					programContainer := BrVerticalPane new
							hMatchParent;
							vFitContent;
							clipChildren: false.
					programContainer
						addChild: (BrEditor new
								text: aStage name asRopedText;
								aptitude: BrGlamorousRegularEditorAptitude).
								
					duration := 4 second "aStage duration".
					duration < 1 second
						ifFalse: [ programContainer
								addChild: (BrLabel new
										margin: (BlInsets
												top: 0
												left: 5
												bottom: 5
												right: 5);
										text: duration gtHumanReadableString asRopedText;
										aptitude: (BrGlamorousLabelAptitude new foreground: Color gray)) ].
					"failedExamples := 5 ""aStage failedTests size"".
					failedExamples > 0
						ifTrue: [ labelContainer
								addChild: (BrLabel new
										text: 'sometext';
										margin: (BlInsets
												top: 0
												left: 5
												bottom: 5
												right: 5);
										aptitude: (BrGlamorousLabelAptitude new foreground: Color gray)) ]."
					container
						addChild: (BrVerticalPane new
								vMatchParent;
								hExact: 15;
								background: statusColor);
						addChild: programContainer ];
				with: allNodes.
			mondrian edges
				shape: [ BlSigmoidElement new
						zIndex: 0;
						beVertical;
						bendingPoint: 0.3;
						sharpness: 0.1;
						border: (BlBorder paint: (Color gray alpha: 0.2) width: 2) ];
				fromCenterBottom;
				toCenterTop;
				connectFrom: #yourself
					toAll: [ :each | 
						allNodes
							select: [ :node |  | b |
							b := node class = each refClass ] ].
			mondrian layout dominanceTree
				nodesAlignment: GtGradTreeNodesCenterAlignment new;
				levelDistance: 20;
				nodeDistance: 20.
			mondrian ];
		actionButtonIcon: BrGlamorousVectorIcons refresh
			tooltip: 'Update'
			action: [ :aButton :aTab | 
				"self refreshNodesDictionary."
				aTab viewContentElement phlow update ]
]

{ #category : 'as yet unclassified' }
Research >> mooseModel [
	^ self
]

{ #category : 'as yet unclassified' }
Research >> nodes [
	^ self programs , self projects , self experiments
]

{ #category : 'as yet unclassified' }
Research >> programs [
	| prgs |
	prgs := OrderedCollection new.
	self programsDirectories
		do: [ :whenDir | prgs addAll: whenDir directories ].
	^ prgs collect: [ :each | ResProgram onDir: each ]
]

{ #category : 'accessing' }
Research >> programsDirectories [
	^ programsDirectories ifNil: [ programsDirectories := OrderedCollection new ]
]

{ #category : 'as yet unclassified' }
Research >> projects [
	| prjs |
	prjs := OrderedCollection new.
	self projectsDirectories do: [ :each | 
		each directories do: [ :file | 
			prjs add: file ] ].
	^ prjs collect: [ :each | ResProject onDir: each ]
]

{ #category : 'accessing' }
Research >> projectsDirectories [
	^ projectsDirectories ifNil: [projectsDirectories := OrderedCollection new]
]
