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
Research >> allPrograms [
	| prgs |
	prgs := OrderedCollection new.
	self programsDirectories
		do: [ :whenDir | prgs addAll: whenDir directories ].
	^ prgs collect: [ :each | ResProgram onDir: each ]
]

{ #category : 'as yet unclassified' }
Research >> allProjects [
	| prjs |
	prjs := OrderedCollection new.
	self projectsDirectories do: [ :each | 
		each directories do: [ :file | 
			prjs add: file ] ].
	^ prjs collect: [ :each | ResProject onDir: each ]
]

{ #category : 'as yet unclassified' }
Research >> connectedTo: allNodes [
	^ [ :each | 
	allNodes
		select: [ :node | 
			"node class = each refClass and: [ node name < each name ] " 
			self  class =  node refChildrenClass
			] ]
]

{ #category : 'accessing' }
Research >> createConnectionDictionaries [
	"A program is connected to several projects and a project in its turn can be connected to several experiments. To set up an initial connection repository, this method will create a complete linked set of dictionaries. so that means that every program is connected to every project and also where every project is connected to every experiment so that's for an initial setting ."

	<gtExample>
	| research |
	research := self exampleDefaultResearch.
	self createConnectionDictionariesFor: research
]

{ #category : 'accessing' }
Research >> createConnectionDictionariesFor: research [
	| connectProgramToProject allProjectNames allExperimentNames connectProjectToExperiment allProgramNames |
	connectProgramToProject := Dictionary new.
	connectProjectToExperiment := Dictionary new.
	allProgramNames := research allPrograms collect: [ :each | each name ].
	allProjectNames := research projects collect: [ :each | each name ].
	allExperimentNames := research experiments collect: [ :each | each name ].
	allProgramNames
		do: [ :programName | connectProgramToProject at: programName put: allProjectNames ].
	allProjectNames
		do: [ :projectName | connectProjectToExperiment at: projectName put: allProjectNames ].
	{connectProgramToProject.
		connectProjectToExperiment}
]

{ #category : 'as yet unclassified' }
Research >> createExperiment [
	self experimentsDirectories 
]

{ #category : 'accessing' }
Research >> exampleDefaultResearch [
	<gtExample>
	"yes I know this is not exactly an example as it is meant to be because I use specific specific directories which on my laptop contain specific structure. so for another person on another laptop it won't work this way. But well, it's agile. Let's keep it going. "
	| programsDirs projectsDirs experimentsDirs |
	programsDirs := (FileLocator home / 'Programs') directories
			reject: [ :each | each basename beginsWith: '.' ].
	projectsDirs := (FileLocator home / 'Projects') directories
			reject: [ :each | each basename beginsWith: '.' ].
	experimentsDirs := (FileLocator home / 'Experiments') directories
			reject: [ :each | each basename beginsWith: '.' ].

	^ Research new
		addProgramsDirs: programsDirs;
		addProjectsDirs: projectsDirs;
		addExperimentsDirs: experimentsDirs;
		yourself
]

{ #category : 'as yet unclassified' }
Research >> exampleSimpleResearch [
	<gtExample>
	| aResearch |
	aResearch := Research new
		addProgramsDirs: { FileReference gtExampleDirectory }
		.
	self assert: aResearch allPrograms size equals: aResearch allPrograms size.
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
	| experiments |
	experiments := self experiments sort: [ :a :b | a when >= b when ].
	^ aView columnedList
		title: 'Experiments';
		priority: 18;
		items: experiments;
		column: 'name'
			text: [ :each | each when ]
			width: 50;
		column: 'name' text: [ :each | each name ];
		actionButtonIcon: BrGlamorousVectorIcons add
			label: 'add'
			tooltip: 'create new experiment'
			action: [ :aButton | self createExperiment ];
		actionButtonLabel: 'copy all paths'
			tooltip: 'copy all paths of all potential children; to be used in file ResearchObjectChildren.md'
			action: [ :aButton | 
				| allPaths |
				allPaths :=  experiments collect: [ :each | each resObjectDir pathString ].
				Clipboard clipboardText: (Character lf join: allPaths)];
		actionButtonIcon: BrGlamorousVectorIcons browse
			tooltip: 'open page'
			action: [ :aButton | 
				| fileRef |
				fileRef := self experimentsDirectories.
				Clipboard clipboardText: fileRef first name.
				WebBrowser openOn: fileRef ]
				
]

{ #category : 'as yet unclassified' }
Research >> gtLiveFor: aView [
	<gtView>
	^ aView list
		title: 'Program';
		priority: 4;
		items: { self name}
		
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
		items: self allPrograms ;
		"column: 'parent' text: [ :each | each firstPropty parent basename ] width: 50;"
		column: 'name' text: [ :each | each when ] width: 50;
		column: 'name' text: [ :each | each name ]
]

{ #category : 'as yet unclassified' }
Research >> gtProjectsFor: aView [
	<gtView>

	| allProjects |
	allProjects := self allProjects.
	^ aView columnedList
		title: 'Projects';
		priority: 16;
		items: allProjects;
		"column: 'parent' text: [ :each | each firstPropty parent basename ] width: 50;"
		column: 'name' text: [ :each | each when ] width: 50;
		column: 'name' text: [ :each | each name ];
				actionButtonLabel: 'copy all paths'
			tooltip: 'copy all paths of all potential children; to be used in file ResearchObjectChildren.md'
			action: [ :aButton | 
				| allPaths |
				allPaths :=  allProjects collect: [ :each | each resObjectDir pathString ].
				Clipboard clipboardText: (Character lf join: allPaths)]

]

{ #category : 'as yet unclassified' }
Research >> gtStagesMapFor: aView [
	"copied from JcPipelineRun>>gtStagesMapFor: aView"

	<gtView>
	| connections |
	connections := Dictionary new.
	^ aView mondrian
		title: 'map 1' translated;
		priority: 4;
		painting: [ :mondrian | 
			| allNodes |
			allNodes := self nodes.
			mondrian nodes
				shape: [ :anItem | self itemContainer: anItem ];
				with: allNodes.
			mondrian edges
				shape: [ BlSigmoidElement new
						zIndex: 0;
						beHorizontal;
						bendingPoint: 0.3;
						sharpness: 0.1;
						border: (BlBorder paint: (Color gray alpha: 0.2) width: 2) ];
				fromRightCenter;
				toLeftCenter;
				connectFrom: #yourself
					toAll: [ :each | 
						allNodes
							select: [  :node | 
							"node class = each refClass and: [ node name < each name ] "
							"b := node childNames contains: each name ."
							| b |
							b := node class = each refChildrenClass.
							"b ifTrue: [
					connections 
						at: node name 
						update: [ :childrenNameList | childrenNameList halt; add: each name ] 
						initial: [ | col |
						col := OrderedCollection new.
						col halt; add: each name.
						col ] ] ."
							b
							] ].
			mondrian layout horizontalDominanceTree
				nodesAlignment: GtGradTreeNodesCenterAlignment new;
				levelDistance: 20;
				nodeDistance: 20.
			mondrian ];
		actionButtonIcon: BrGlamorousVectorIcons refresh
			tooltip: 'Update'
			action: [ :aButton "self refreshNodesDictionary." :aTab | aTab viewContentElement phlow update ]
]

{ #category : 'as yet unclassified' }
Research >> itemContainer: anItem [
	| container |
	container := BrHorizontalPane new
			hExact: 200;
			vFitContent;
			aptitude: BrShadowAptitude;
			clipChildren: false;
			margin: (BlInsets all: 10);
			background: Color white;
			zIndex: 1;
			when: BlClickEvent do: [ :e | e target phlow spawnObject: anItem ].
	^ container
		addChild: (BrVerticalPane new
				vMatchParent;
				hExact: 15;
				background: anItem resultBackgroundColor);
		addChild: (self itemInfoContainer: anItem)
]

{ #category : 'as yet unclassified' }
Research >> itemInfoContainer: anItem [
	| container |
	container := BrVerticalPane new
			hMatchParent;
			vFitContent;
			clipChildren: false.
	container
		addChild: (BrEditor new
				text: anItem name asRopedText;
				aptitude: BrGlamorousRegularEditorAptitude).
	^ container
]

{ #category : 'as yet unclassified' }
Research >> mooseModel [
	^ self
]

{ #category : 'as yet unclassified' }
Research >> nodes [
	^ self allPrograms , self projects , self experiments
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

{ #category : 'accessing' }
Research >> simpleResearch [
]
