Class {
	#name : #OgPayPeriod,
	#superclass : #Object,
	#instVars : [
		'endDate'
	],
	#category : #'OpenGovernment-Budgeting'
}

{ #category : #'as yet unclassified' }
OgPayPeriod >> averageHourlyRateOfJobTitles: aCollection [ 
	
	| payrollLines rateSum |
	payrollLines := self payroll scenarios select: [ :scen | aCollection includes: scen jobTitle ].
	rateSum := payrollLines sum: [ :line | line hourlyRate ].
	^ rateSum / payrollLines size
]

{ #category : #accessing }
OgPayPeriod >> displayStringOn: aStream [

	aStream
		nextPutAll: 'Pay period ending ';
		nextPutAll: self endDate mmddyyyy
]

{ #category : #accessing }
OgPayPeriod >> endDate [
	^ endDate
]

{ #category : #accessing }
OgPayPeriod >> endDate: aDate [
	endDate := aDate translateToUTC
]

{ #category : #accessing }
OgPayPeriod >> endDateDescription [
	<magritteDescription>
	
	^ MADateDescription new
		accessor: #endDate;
		csvFieldName: 'Period End';
		priority: 30;
		yourself
]

{ #category : #accessing }
OgPayPeriod >> payrollGtViewOn: aView [
	<gtView>
	
	^ aView forward
		title: 'Payroll Detail';
		priority: 75;
		object: [ self payroll ];
		view: #detailGtViewOn:;
		inspectButtonFor: [ self payroll ];
		yourself
]

{ #category : #accessing }
OgPayPeriod >> printOn: aStream [

	aStream
		nextPutAll: 'Pay period from ';
		nextPutAll: self startDate mmddyyyy;
		nextPutAll: ' to ';
		nextPutAll: self endDate mmddyyyy
]

{ #category : #accessing }
OgPayPeriod >> timespan [

	^ self startDate to: self endDate
]
