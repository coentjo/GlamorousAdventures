Class {
	#name : 'FontysSemesterOverview',
	#superclass : 'Object',
	#instVars : [
		'weeks',
		'name'
	],
	#category : 'SemesterCalendarOverview',
	#package : 'SemesterCalendarOverview'
}

{ #category : 'accessing' }
FontysSemesterOverview class >> datums202602 [
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
	}.
	^ self new
]

{ #category : 'datums' }
FontysSemesterOverview class >> datums202608 [
	"which week-nr starts at which Date (Monday)"
	| mondayWk01 |
	mondayWk01 := Date year: 2026 month: 08 day: 31 .
	^ OrderPreservingDictionary withAll: 
	{ #wk01 -> mondayWk01
	. #wk02 -> (mondayWk01 addDays: 7 * 1)
	. #wk03 -> (mondayWk01 addDays: 7 * 2)
	. #wk04 -> (mondayWk01 addDays: 7 * 3)
	. #wk05 -> (mondayWk01 addDays: 7 * 4)
	. #wk06 -> (mondayWk01 addDays: 7 * 5)
	. #wk07 -> (mondayWk01 addDays: 7 * 6)
	. #wk08 -> (mondayWk01 addDays: 7 * 8)
	. #wk09 -> (mondayWk01 addDays: 7 * 9)
	. #wk10 -> (mondayWk01 addDays: 7 * 10)
	. #wk11 -> (mondayWk01 addDays: 7 * 11)
	. #wk12 -> (mondayWk01 addDays: 7 * 12)
	. #wk13 -> (mondayWk01 addDays: 7 * 13)
	. #wk14 -> (mondayWk01 addDays: 7 * 14)
	. #wk15 -> (mondayWk01 addDays: 7 * 15)
	. #wk16 -> (mondayWk01 addDays: 7 * 18)
	. #wk17 -> (mondayWk01 addDays: 7 * 19)
	. #wk18 -> (mondayWk01 addDays: 7 * 20)
	. #wk19 -> (mondayWk01 addDays: 7 * 21)
	. #wk20 -> (mondayWk01 addDays: 7 * 22)
	}.

]

{ #category : 'datums' }
FontysSemesterOverview class >> for202602_vj [
	"Feb202602 - Jul2026, vj: Voorjaar"
	^self new
		useDateScheme: self datums202602 ; 
		name: '202602_vj';
		yourself
]

{ #category : 'datums' }
FontysSemesterOverview class >> for202608_nj [
	"Fontys year overview"
	"Aug202608 - Jan2027, nj: Najaar"
	^self new
		useDateScheme: self datums202608 ; 
		name: '202608_vj';
		yourself
]

{ #category : 'accessing' }
FontysSemesterOverview >> addWeek: weekNr startingat: startDate [
	self weeks add: (FontysSemesterWeek named: weekNr startingAt: startDate)
]

{ #category : 'datums' }
FontysSemesterOverview >> gtWeekFor: aView [
	<gtView>
	^ aView columnedList
		priority: 15;
		title: 'weeks';
		column: 'wk' text: [ :each | each name ] width: 40 ;
		column: 'd' text: [ :each | each startDate yyyymmdd ] width: 80;
		column: 'date' text: [ :each | each startDate ];
		items: [self weeks]
		
		
]

{ #category : 'accessing' }
FontysSemesterOverview >> name [
	^ name
]

{ #category : 'accessing' }
FontysSemesterOverview >> name: aString [ 
	name := aString
]

{ #category : 'as yet unclassified' }
FontysSemesterOverview >> printOn: aStream [
	aStream nextPutAll: self name
]

{ #category : 'accessing' }
FontysSemesterOverview >> useDateScheme: aDateScheme [
	aDateScheme
		keysAndValuesDo: [ :weekNr :startDate | self addWeek: weekNr startingat: startDate ]
]

{ #category : 'accessing' }
FontysSemesterOverview >> weeks [
	^ weeks ifNil: [weeks := OrderedCollection new]
]
