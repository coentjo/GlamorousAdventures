Class {
	#name : 'SemesterOverview',
	#superclass : 'Object',
	#instVars : [
		'weeks',
		'name'
	],
	#category : 'SemesterCalendarOverview',
	#package : 'SemesterCalendarOverview'
}

{ #category : 'accessing' }
SemesterOverview class >> datums202602 [
	"which week-nr starts at which Date (Monday)"
	| mondayWk01 |
	mondayWk01 := Date year: 2026 month: 02 day: 9 .
	^ OrderPreservingDictionary withAll: 
	{ #wk01 -> mondayWk01
	. #wk02 -> (mondayWk01 addDays: 7)
	. #wk03 -> (mondayWk01 addDays: 14)
	. #wk04 -> (mondayWk01 addDays: 21)
	. #wk05 -> (mondayWk01 addDays: 28)
	. #wk06 -> (mondayWk01 addDays: 35)
	. #wk07 -> (mondayWk01 addDays: 42)
	. #wk08 -> (mondayWk01 addDays: 49)
	. #wk09 -> (mondayWk01 addDays: 56)
	. #wk10 -> (mondayWk01 addDays: 63)
	. #wk11 -> (mondayWk01 addDays: 70)
	. #wk12 -> (mondayWk01 addDays: 77)
	. #wk13 -> (mondayWk01 addDays: 84)
	. #wk14 -> (mondayWk01 addDays: 91)
	. #wk15 -> (mondayWk01 addDays: 98)
	. #wk16 -> (mondayWk01 addDays: 105)
	. #wk17 -> (mondayWk01 addDays: 112)
	. #wk18 -> (mondayWk01 addDays: 119)
	. #wk19 -> (mondayWk01 addDays: 126)
	. #wk20 -> (mondayWk01 addDays: 133)
	}
]

{ #category : 'accessing' }
SemesterOverview class >> for202602_vj [
	"Feb202602 - Jul2026, vj: Voorjaar"
	^self new
		useDateScheme: self datums202602 ; 
		name: '202602_vj';
		yourself
]

{ #category : 'accessing' }
SemesterOverview >> addWeek: weekNr startingat: startDate [
	self weeks add: (SemesterWeek named: weekNr startingAt: startDate)
]

{ #category : 'as yet unclassified' }
SemesterOverview >> gtWeekFor: aView [
	<gtView>
	^ aView columnedTree
		priority: 15;
		title: 'weeks';
		items: [self weeks]
		
		
]

{ #category : 'accessing' }
SemesterOverview >> name: aString [ 
	name := aString
]

{ #category : 'accessing' }
SemesterOverview >> useDateScheme: aDateScheme [
	aDateScheme
		keysAndValuesDo: [ :weekNr :startDate | self addWeek: weekNr startingat: startDate ]
]

{ #category : 'accessing' }
SemesterOverview >> weeks [
	^ weeks ifNil: [weeks := OrderedCollection new]
]
