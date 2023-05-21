Class {
	#name : #WAS2AppRoot,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #SemanticScholarWeb
}

{ #category : #rendering }
WAS2AppRoot class >> canBeRoot [

	^ true
]

{ #category : #'class initialization' }
WAS2AppRoot class >> initialize [
	"self initialize"
	| app |
	app := WAAdmin register:  self asApplicationAt: 'papers'.
	app
		addLibrary: JQDeploymentLibrary ;
		addLibrary: JQUiDeploymentLibrary.
		"addLibrary: TBSDeployment""this was mentioned in TineBlogEN-gitc55a88d.pdf, 
		but does not seem to exist?"  
]

{ #category : #'class initialization' }
WAS2AppRoot class >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot .
	anHtmlRoot 
		beHtml5
		title: 'Papers Network'
]

{ #category : #initialization }
WAS2AppRoot >> children [ 
	^ { main }
]

{ #category : #initialization }
WAS2AppRoot >> initialize [ 
	super initialize .
	main := WAS2ScreenComponent new
]

{ #category : #rendering }
WAS2AppRoot >> renderContentOn: html [
	html render: main
]
