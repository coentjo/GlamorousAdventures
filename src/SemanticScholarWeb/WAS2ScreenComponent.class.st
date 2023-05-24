Class {
	#name : #WAS2ScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #SemanticScholarWeb
}

{ #category : #hooks }
WAS2ScreenComponent >> children [ 
	^ {  header  }
]

{ #category : #'as yet unclassified' }
WAS2ScreenComponent >> createHeaderComponent [
	^ WAS2HeaderComponent new
]

{ #category : #initialization }
WAS2ScreenComponent >> initialize [
	super initialize .
	header := self createHeaderComponent 
]

{ #category : #rendering }
WAS2ScreenComponent >> renderContentOn: html [

	html
		render: header;
		text: 'Don''t use me (#WAS2ScreenComponent) directly';
		break;
		text: 'BTW, there are ';
		text: 42 asString;
		text: 'articles in the system now.'
]
