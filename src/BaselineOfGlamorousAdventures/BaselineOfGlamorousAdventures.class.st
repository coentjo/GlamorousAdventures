Class {
	#name : #BaselineOfGlamorousAdventures,
	#superclass : #BaselineOf,
	#category : #BaselineOfGlamorousAdventures
}

{ #category : #accessing }
BaselineOfGlamorousAdventures >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec baseline: 'canvasinator' with: [ spec repository: 'https://github.com/coentjo/canvasinator/src' ].
			
			"spec package: 'X' with: [ spec requires: 'canvasinator' ]."
			spec package: 'PortfolioInsight' with: [ spec requires: 
				#( 'SmaCC_Runtime' ) ] .
			spec group: 'Core' with: #('PortfolioInsight' )
	
		]
]
