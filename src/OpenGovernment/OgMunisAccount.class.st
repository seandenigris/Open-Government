Class {
	#name : #OgMunisAccount,
	#superclass : #Object,
	#instVars : [
		'organization',
		'object',
		'project',
		'budgetLines'
	],
	#category : #'OpenGovernment-Munis'
}

{ #category : #'as yet unclassified' }
OgMunisAccount >> addBudgetLine: anOgMunisBudgetLine [ 
	
	^ self budgetLines add: anOgMunisBudgetLine
]

{ #category : #accessing }
OgMunisAccount >> budgetLines [
	^ budgetLines ifNil: [ budgetLines := SortedCollection sortUsing: #year descending ]
]

{ #category : #accessing }
OgMunisAccount >> budgetLines: anObject [
	budgetLines := anObject
]

{ #category : #accessing }
OgMunisAccount >> budgetLinesGtViewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Budget';
		priority: 50;
		items: [ self budgetLines ];
		column: 'Year' 
			text: [ :line | 
				line year asString ]
			width: 45;
		column: 'Available' 
			text: [ :line | 
				line class stringFromMoney: line available ]
			width: 100;
		column: 'Opening' 
			text: [ :line | 
				line class stringFromMoney: line revised ]
			width: 100;
		column: '% Used' 
			text: [ :line | 
				line percentUsedString ]
			width: 100;
		column: 'Spent' 
			text: [ :line | 
				line class stringFromMoney: line actual ]
			width: 100;
		column: 'Encumbrances' 
			text: [ :line | 
				line class stringFromMoney: line encumbrances ]
			width: 100.
]

{ #category : #accessing }
OgMunisAccount >> displayStringOn: aStream [

	self organization ifNotNil: [ aStream << self organization displayString ].
	
	self object ifNotNil: [ 
		aStream << ' > ' << self object displayString ].
		
	aStream << self projectDisplayString
]

{ #category : #accessing }
OgMunisAccount >> gtDisplayOn: aStream [

	self organization ifNotNil: [ aStream << self organization description ].
	
	self object ifNotNil: [ 
		aStream space << self object description ].
		
	self project ifNotNil: [ 
		aStream space << self project description ].
		
	aStream nextPutAll: ' ('.
	super printOn: aStream.
	aStream nextPutAll: ')'.
]

{ #category : #accessing }
OgMunisAccount >> printOn: aStream [

	self displayStringOn: aStream.
		
	aStream nextPutAll: ' ('.
	super printOn: aStream.
	aStream nextPutAll: ')'.
]

{ #category : #accessing }
OgMunisAccount >> projectDisplayString [
		
	^ self project 
		ifNotNil: [ self project displayString ]
		ifNil: [ '' ].
]
