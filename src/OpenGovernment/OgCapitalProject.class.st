Class {
	#name : #OgCapitalProject,
	#superclass : #PpProject,
	#instVars : [
		'number',
		'expenses',
		'currentPrice',
		'startYear',
		'endYear',
		'frequency',
		'category'
	],
	#category : #'OpenGovernment-Budgeting'
}

{ #category : #accessing }
OgCapitalProject >> category [
	^ category
]

{ #category : #accessing }
OgCapitalProject >> category: anObject [
	category := anObject
]

{ #category : #accessing }
OgCapitalProject >> categoryDescription [
	<magritteDescription>
	
	^ MAStringDescription new
		accessor: #category;
		priority: 200;
		yourself
]

{ #category : #accessing }
OgCapitalProject >> currentPrice [
	^ currentPrice
]

{ #category : #accessing }
OgCapitalProject >> currentPrice: anObject [
	currentPrice := anObject
]

{ #category : #accessing }
OgCapitalProject >> currentPriceDescription [
	<magritteDescription>
	
	^ MAMoneyDescription vsNew
		accessor: #currentPrice;
		priority: 200;
		yourself
]

{ #category : #'as yet unclassified' }
OgCapitalProject >> ensureExpenseIn: yearNumber [

	^ self expenses
		detect: [ :exp | exp year = yearNumber ]
		ifNone: [ 
			| newExp |
			newExp := OgCapitalExpense new
				project: self;
				year: yearNumber;
				yourself.
				
			self expenses add: newExp ]
]

{ #category : #accessing }
OgCapitalProject >> expenses [

	| expenseYears |
	
	expenses ifNotNil: [ ^ expenses ].
	
	expenses := OrderedCollection new.
	
	expenseYears := self startYear to: Year currentYearNumber by: self frequency.
	
	^ expenseYears
		select: [ :yr | yr >= self startYear and: [ yr <= Year currentYearNumber ] ]
		thenCollect: [ :yr | self ensureExpenseIn: yr ]
]

{ #category : #accessing }
OgCapitalProject >> expenses: anObject [
	expenses := anObject
]

{ #category : #accessing }
OgCapitalProject >> expensesGtViewFor: aView [
	<gtView>
	
	| result |
	result := aView columnedList
		title: 'Expenses';
		priority: 10;
		items: [ self expenses ];
		actionUpdateButton.
		
	OgCapitalExpense magritteTemplate magritteDescription do: [ :desc |
		result column: desc label text: [ :line | desc readToString: line ] ].
				
	^ result
]

{ #category : #accessing }
OgCapitalProject >> frequency [
	^ frequency
]

{ #category : #accessing }
OgCapitalProject >> frequency: anObject [
	frequency := anObject
]

{ #category : #accessing }
OgCapitalProject >> frequencyDescription [
	<magritteDescription>
	
	^ MANumberDescription new
		accessor: #frequency;
		priority: 200;
		yourself
]

{ #category : #accessing }
OgCapitalProject >> number [
	^ number
]

{ #category : #accessing }
OgCapitalProject >> number: anObject [
	number := anObject
]

{ #category : #accessing }
OgCapitalProject >> numberDescription [
	<magritteDescription>
	
	^ MANumberDescription new
		accessor: #number;
		priority: 200;
		yourself
]

{ #category : #testing }
OgCapitalProject >> ogIsBudgetary [

	^ true
]

{ #category : #accessing }
OgCapitalProject >> planGtViewFor: aView [
	<gtView>
	
	| result |
	result := aView columnedList
		title: 'Plan';
		priority: 10;
		items: [ self plannedExpenses ];
		actionUpdateButton.
		
	OgCapitalExpense magritteTemplate magritteDescription do: [ :desc |
		result column: desc label text: [ :line | desc readToString: line ] ].
				
	^ result
]

{ #category : #accessing }
OgCapitalProject >> plannedExpenses [

	| nextYear finalYear expenseYears |
	nextYear := Year currentYearNumber + 1.
	finalYear := nextYear + 9.
	expenseYears := self startYear to: finalYear by: self frequency.
	^ expenseYears
		select: [ :yr | yr >= nextYear and: [ yr <= finalYear ] ]
		thenCollect: [ :yr | self ensureExpenseIn: yr ]
]

{ #category : #accessing }
OgCapitalProject >> printOn: aStream [

	self displayStringOn: aStream.
]

{ #category : #accessing }
OgCapitalProject >> startYear [
	^ startYear
]

{ #category : #accessing }
OgCapitalProject >> startYear: anObject [
	startYear := anObject
]

{ #category : #accessing }
OgCapitalProject >> startYearDescription [
	<magritteDescription>
	
	^ MANumberDescription new
		accessor: #startYear;
		priority: 200;
		yourself
]
