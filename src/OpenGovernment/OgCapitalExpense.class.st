Class {
	#name : #OgCapitalExpense,
	#superclass : #Object,
	#instVars : [
		'year',
		'fundingSource',
		'price',
		'project',
		'priority',
		'contingency',
		'quotedPrice'
	],
	#category : #'OpenGovernment-Budgeting'
}

{ #category : #accessing }
OgCapitalExpense >> contingency [
	^ contingency
]

{ #category : #accessing }
OgCapitalExpense >> contingency: anObject [
	contingency := anObject
]

{ #category : #accessing }
OgCapitalExpense >> contingencyDescription [
	<magritteDescription>
	
	^ MANumberDescription new
		accessor: #contingency;
		priority: 100;
		yourself
]

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
OgCapitalExpense >> hasPrice [
	^ price isNotNil or: [ self quotedPrice isNotNil ]
]

{ #category : #accessing }
OgCapitalExpense >> lastPricedSibling [
	^ self project expenses
		detectMax: [ :exp | 
			| yearsToMe |
			yearsToMe := self year - exp year.
			(yearsToMe > 0 and: [ exp hasPrice ])
				ifTrue: [ 1 / (self year - exp year) ]
				ifFalse: [ 0 ] ]
		overThreshold: 0
]

{ #category : #accessing }
OgCapitalExpense >> price [

	price ifNotNil: [ ^ price ].
	
	self quotedPrice ifNotNil: [ :qp | 
		self contingency ifNil: [ ^ qp total ].
		self contingency isInteger ifTrue: [ ^ qp total + self contingency dollars ].
		"Treat as a percentage"
		^ qp total * (1 + self contingency) ].
	
	^ self priceProjected ifNotNil: [ :projPrice | projPrice roundTo: 1 ]
]

{ #category : #accessing }
OgCapitalExpense >> price: anObject [
	price := anObject
]

{ #category : #accessing }
OgCapitalExpense >> priceDescription [
	<magritteDescription>
	
	^ MAMoneyDescription vsNew
		accessor: #price;
		priority: 200;
		yourself
]

{ #category : #accessing }
OgCapitalExpense >> priceList [

	^ VsPriceList uniqueInstance
]

{ #category : #accessing }
OgCapitalExpense >> priceProjected [

	| lastPricedExpense |
	lastPricedExpense := self lastPricedSibling.

	lastPricedExpense ifNil: [ ^ nil ].

	^ lastPricedExpense price compoundingFormula
		nominalRate: 3 percent;
		timeUnits: self year - lastPricedExpense year;
		calculate
]

{ #category : #'as yet unclassified' }
OgCapitalExpense >> priceProjectedExcelFormula [

	^ self priceProjectionFormula excelFormula
]

{ #category : #accessing }
OgCapitalExpense >> priceProjectionFormula [

	^ self lastPricedSibling price compoundingFormula
		nominalRate: 3 percent;
		timeUnits: self year - self lastPricedSibling year;
		yourself
]

{ #category : #'as yet unclassified' }
OgCapitalExpense >> printOn: aStream [

	self maPrintOn: aStream
]

{ #category : #accessing }
OgCapitalExpense >> priority [
	^ priority
]

{ #category : #accessing }
OgCapitalExpense >> priority: anObject [
	priority := anObject
]

{ #category : #'as yet unclassified' }
OgCapitalExpense >> priorityDescription [
	<magritteDescription>
	
	^ MAStringDescription new
		accessor: #priority;
		priority: 200;
		yourself
]

{ #category : #accessing }
OgCapitalExpense >> project [
	^ project
]

{ #category : #accessing }
OgCapitalExpense >> project: anObject [
	project := anObject
]

{ #category : #accessing }
OgCapitalExpense >> quotedPrice [
	^ quotedPrice
]

{ #category : #accessing }
OgCapitalExpense >> quotedPrice: anObject [
	quotedPrice := anObject
]

{ #category : #accessing }
OgCapitalExpense >> quotedPriceDescription [
	<magritteDescription>
	
	^ MAToOneRelationDescription new
		accessor: #quotedPrice;
		gtSearchSource: (MessageSend receiver: self selector: #priceList); 
		classes: VsPrice allSubclasses;
		priority: 200;
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
