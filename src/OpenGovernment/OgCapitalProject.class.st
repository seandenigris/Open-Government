Class {
	#name : #OgCapitalProject,
	#superclass : #Object,
	#instVars : [
		'description',
		'number',
		'expenses',
		'currentPrice'
	],
	#category : #'OpenGovernment-Budgeting'
}

{ #category : #accessing }
OgCapitalProject >> = rhs [

	^ self description = rhs description and: [ self number = rhs number ]
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
OgCapitalProject >> description [
	^ description
]

{ #category : #accessing }
OgCapitalProject >> description: anObject [
	description := anObject
]

{ #category : #accessing }
OgCapitalProject >> descriptionDescription [
	<magritteDescription>
	
	^ MAStringDescription new
		accessor: #description;
		priority: 100;
		yourself
]

{ #category : #accessing }
OgCapitalProject >> displayStringOn: aStream [

	self description ifNotNil: [ :desc |
		aStream nextPutAll: desc ]
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
		priority: 50;
		items: [ self expenses ].
		
	NdCapitalExpense new magritteDescription do: [ :desc |
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
