Class {
	#name : #OgMunisAccount,
	#superclass : #Object,
	#instVars : [
		'organization',
		'object',
		'project',
		'budgetLines',
		'municipality'
	],
	#category : #'OpenGovernment-Munis'
}

{ #category : #accessing }
OgMunisAccount class >> exportToCSVAllAccounts: aCollection [

	| destination |
	destination := FileSystem memory / ('account-export-', DateAndTime now asString asFilename), 'csv'.
	
	destination writeStreamDo: [ :str |
		(NeoCSVWriter on: str)
			addField: [ :acc | acc object displayString ];
			addField: [ :acc | acc projectDisplayString ];
			nextPutAll: aCollection ].
			
	^ destination
]

{ #category : #accessing }
OgMunisAccount class >> ofMunicipality: anMpMunicipality [

	^ self new
		municipality: anMpMunicipality;
		yourself
]

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
	
	| result |
	result := aView columnedList
		title: 'Budget';
		priority: 50;
		items: [ self budgetLines ].
		
	OgMunisBudgetLine new magritteDescription do: [ :desc |
		result column: desc label text: [ :line | desc readToString: line ] ].
				
	^ result
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
OgMunisAccount >> municipality [
	^ municipality
]

{ #category : #accessing }
OgMunisAccount >> municipality: anObject [
	municipality := anObject
]

{ #category : #accessing }
OgMunisAccount >> object [
	^ object
]

{ #category : #accessing }
OgMunisAccount >> object: anObject [
	object := anObject
]

{ #category : #accessing }
OgMunisAccount >> objectDescription [
	<magritteDescription>
	
	^ MAToOneRelationDescription new
		accessor: #object;
		classes: { OgMunisObject };
		yourself
]

{ #category : #accessing }
OgMunisAccount >> organization [
	^ organization
]

{ #category : #accessing }
OgMunisAccount >> organization: anObject [
	organization := anObject
]

{ #category : #accessing }
OgMunisAccount >> organizationDescription [
	<magritteDescription>
	
	^ MAToOneRelationDescription new
		accessor: #organization;
		classes: { OgMunisOrganization };
		yourself
]

{ #category : #accessing }
OgMunisAccount >> printOn: aStream [

	self displayStringOn: aStream.
		
	aStream nextPutAll: ' ('.
	super printOn: aStream.
	aStream nextPutAll: ')'.
]

{ #category : #accessing }
OgMunisAccount >> project [
	^ project
]

{ #category : #accessing }
OgMunisAccount >> project: anObject [
	project := anObject
]

{ #category : #accessing }
OgMunisAccount >> projectDescription [
	<magritteDescription>
	
	^ MAToOneRelationDescription new
		accessor: #project;
		classes: { OgMunisProject };
		yourself
]

{ #category : #accessing }
OgMunisAccount >> projectDisplayString [
		
	^ self project 
		ifNotNil: [ self project displayString ]
		ifNil: [ '' ].
]
