Class {
	#name : #OgCapitalProject,
	#superclass : #PpProject,
	#instVars : [
		'number',
		'expenses',
		'currentPrice'
	],
	#category : #'OpenGovernment-Budgeting'
}

{ #category : #accessing }
OgCapitalProject >> = rhs [

	self species = rhs species ifFalse: [ ^ false ].
	
	^ self title = rhs title and: [ self number = rhs number ]
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
OgCapitalProject >> expenses [
	^ expenses ifNil: [ expenses := OrderedCollection new ]
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
		items: [ self expenses ].
		
	OgCapitalExpense magritteTemplate magritteDescription do: [ :desc |
		result column: desc label text: [ :line | desc readToString: line ] ].
				
	^ result
]

{ #category : #accessing }
OgCapitalProject >> hash [

	^ self description hash bitXor: self number hash
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

{ #category : #accessing }
OgCapitalProject >> printOn: aStream [

	self displayStringOn: aStream.
]
