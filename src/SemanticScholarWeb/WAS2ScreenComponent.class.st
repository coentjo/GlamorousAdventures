Class {
	#name : #WAS2ScreenComponent,
	#superclass : #WAComponent,
	#category : #SemanticScholarWeb
}

{ #category : #rendering }
WAS2ScreenComponent >> renderContentOn: html [

	html
		text: 'Don''t use me (#WAS2ScreenComponent) directly';
		break;
		text: 'BTW, there are ' ;
		text: 42 asString;
		text: 'articles in the system now.'
]
