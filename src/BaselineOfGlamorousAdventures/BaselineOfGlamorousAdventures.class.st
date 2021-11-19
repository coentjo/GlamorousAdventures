Class {
	#name : #BaselineOfGlamorousAdventures,
	#superclass : #BaselineOf,
	#category : #BaselineOfGlamorousAdventures
}

{ #category : #accessing }
BaselineOfGlamorousAdventures >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		"spec 
			baseline: 'GToolkitPager' with: [
				spec repository: 'github://feenkcom/gtoolkit-pager:main/src' ];
			baseline: 'GToolkitSpotter' with: [
				spec repository: 'github://feenkcom/gtoolkit-spotter:main/src' ];
			baseline: 'GToolkitCompleter' with: [
				spec repository: 'github://feenkcom/gtoolkit-completer:main/src' ];
			baseline: 'GToolkit4Pharo' with: [
				spec repository: 'github://feenkcom/gt4pharo:main/src' ];
			baseline: 'GToolkitExamples' with: [
				spec repository: 'github://feenkcom/gtoolkit-examples:main/src' ]."
				
		spec package: 'PortfolioInsight' ].

]
