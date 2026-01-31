Class {
	#name : 'SemesterWeek',
	#superclass : 'Object',
	#instVars : [
		'name',
		'startDate'
	],
	#category : 'SemesterCalendarOverview',
	#package : 'SemesterCalendarOverview'
}

{ #category : 'accessing' }
SemesterWeek class >> named: weekNr startingAt: startDate [ 
	^ self new
		name: weekNr;
		startingAt: startDate;
		yourself
]

{ #category : 'as yet unclassified' }
SemesterWeek >> name [
	^ name
]

{ #category : 'accessing' }
SemesterWeek >> name: weekNr [ 
	name := weekNr
]

{ #category : 'as yet unclassified' }
SemesterWeek >> printOn: aStream [
	aStream nextPutAll: self name asString
]

{ #category : 'accessing' }
SemesterWeek >> startingAt: aStartDate [ 
	startDate := aStartDate
]
