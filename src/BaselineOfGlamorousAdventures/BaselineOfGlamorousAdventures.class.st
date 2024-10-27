Class {
	#name : #BaselineOfGlamorousAdventures,
	#superclass : #BaselineOf,
	#category : #BaselineOfGlamorousAdventures
}

{ #category : #'as yet unclassified' }
BaselineOfGlamorousAdventures class >> loadLepiter [
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase properties.
	currentProperties
		addRegisteredDirectory: FileLocator imageDirectory
			/ 'pharo-local'
			/ 'iceberg'
			/ 'coentjo'
			/ 'GlamorousAdventures'
			/ 'lepiter'.
	LeDatabasesRegistry default defaultLogicalDatabase reload.
	

]

{ #category : #baselines }
BaselineOfGlamorousAdventures >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: #PortfolioInsight;
				package: #Feedbackinator ;
				package: #Portflowionator]
]
