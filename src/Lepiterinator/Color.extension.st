Extension { #name : 'Color' }

{ #category : '*Lepiterinator' }
Color >> gtVariationsFor: aView [
	<gtView>
	<gtViewDescription: 'Displays lighter and darker variations of this color.'>

	^ aView explicit
		title: 'Variations';
		priority: 8;
		stencil: [
			| variations palette |
			variations := { self veryMuchLighter. self muchLighter.
				self lighter. self. self darker. self muchDarker }.

			palette := BlElement new
				layout: BlLinearLayout horizontal;
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical matchParent ].

			variations do: [ :aColor |
				palette addChild: (BlElement new
					background: aColor;
					constraintsDo: [ :c |
						c horizontal matchParent.
						c vertical matchParent ]) ].
			palette ]
]
