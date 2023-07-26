Class {
	#name : #OgCapitalExpense,
	#superclass : #Object,
	#instVars : [
		'year',
		'fundingSource',
		'price'
	],
	#category : #'OpenGovernment-Budgeting'
}

{ #category : #accessing }
OgCapitalExpense >> fundingSource [
	^ fundingSource
]

{ #category : #accessing }
OgCapitalExpense >> fundingSource: anObject [
	fundingSource := anObject
]

{ #category : #accessing }
OgCapitalExpense >> fundingSourceDescription [
	<magritteDescription>
	
	^ MAStringDescription new
		accessor: #fundingSource;
		priority: 300;
		yourself
]

{ #category : #accessing }
OgCapitalExpense >> price [
	^ price
]

{ #category : #accessing }
OgCapitalExpense >> price: anObject [
	price := anObject
]

{ #category : #accessing }
OgCapitalExpense >> priceDescription [
	<magritteDescription>
	
	^ MAMoneyDescription new
		accessor: #price;
		priority: 200;
		beRequired;
		stringReader: VsMAMoneyStringReader;
		yourself
]

{ #category : #accessing }
OgCapitalExpense >> year [
	^ year
]

{ #category : #accessing }
OgCapitalExpense >> year: anObject [
	year := anObject
]

{ #category : #accessing }
OgCapitalExpense >> yearDescription [
	<magritteDescription>
	
	^ MANumberDescription new
		accessor: #year;
		priority: 100;
		beRequired;
		yourself
]
