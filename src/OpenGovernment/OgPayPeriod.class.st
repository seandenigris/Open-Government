Class {
	#name : #OgPayPeriod,
	#superclass : #Object,
	#instVars : [
		'endDate'
	],
	#category : #'OpenGovernment-Budgeting'
}

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
OgPayPeriod >> endDateDescription [
	<magritteDescription>
	
	^ MADateDescription new
		accessor: #endDate;
		csvFieldName: 'Period End';
		priority: 30;
		yourself
]
