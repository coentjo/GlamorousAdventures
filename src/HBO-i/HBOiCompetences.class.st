Class {
	#name : 'HBOiCompetences',
	#superclass : 'Object',
	#instVars : [
		'rawData'
	],
	#category : 'HBO-i',
	#package : 'HBO-i'
}

{ #category : 'accessing' }
HBOiCompetences >> loadAll [
	| x allData  |
	x := ZnClient new
			url: 'https://api.domeinbeschrijving.hbo-i.nl/api/descriptions?' , 'search='
					, '&grouping=architecture_layers%2Cactivities%2Clevels';
			get.
	allData := (JSONParser parse: x) values.
	rawData := allData collect: [ :each |  HBOiCompetence on: each ]. 
	
]
