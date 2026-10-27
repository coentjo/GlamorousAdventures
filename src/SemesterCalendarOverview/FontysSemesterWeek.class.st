Class {
	#name : 'FontysSemesterWeek',
	#superclass : 'Object',
	#instVars : [
		'name',
		'startDate'
	],
	#category : 'SemesterCalendarOverview',
	#package : 'SemesterCalendarOverview'
}

{ #category : 'accessing' }
FontysSemesterWeek class >> named: weekNr startingAt: startDate [ 
	^ self new
		name: weekNr;
		startingAt: startDate;
		yourself
]

{ #category : 'as yet unclassified' }
FontysSemesterWeek >> name [
	^ name
]

{ #category : 'accessing' }
FontysSemesterWeek >> name: weekNr [ 
	name := weekNr
]

{ #category : 'as yet unclassified' }
FontysSemesterWeek >> printOn: aStream [
	aStream nextPutAll: self name asString
]

{ #category : 'accessing' }
FontysSemesterWeek >> startDate [
	^ startDate
]

{ #category : 'accessing' }
FontysSemesterWeek >> startingAt: aStartDate [ 
	startDate := aStartDate
]
