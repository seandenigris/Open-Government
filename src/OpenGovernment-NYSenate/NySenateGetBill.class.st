Class {
	#name : 'NySenateGetBill',
	#superclass : 'NySenateApiRequest',
	#instVars : [
		'printNumber',
		'sessionYear'
	],
	#category : 'OpenGovernment-NYSenate'
}

{ #category : 'as yet unclassified' }
NySenateGetBill class >> defineFromUrl [
	<script>
	
	| variables translationTable fieldName |
	variables := self relativeUrlTemplate pathSegments select: [ :e | (e beginsWith: '{') and: [ e endsWith: '}' ] ] thenCollect: [ :e | e allButFirst allButLast ].
	translationTable := {('printNo' -> 'printNumber')} asDictionary.
	variables
		doWithIndex: [ :var :i | 
			fieldName := translationTable at: var ifAbsent: [ var ].
			self
				maAddField: fieldName asSymbol
				with: [ :desc | 
					desc
						priority: i * 100;
						ogBeRequiredParameter ] ]
]

{ #category : 'as yet unclassified' }
NySenateGetBill class >> relativeUrlTemplate [
	^ '/api/3/bills/{sessionYear}/{printNo}' asUrl.
]

{ #category : 'accessing-magritte' }
NySenateGetBill >> descriptionPrintNumber [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #printNumber;
		priority: 200;
		propertyAt: 'parameterType' put: 'required';
		yourself
]

{ #category : 'accessing-magritte' }
NySenateGetBill >> descriptionSessionYear [
	<magritteDescription>
	^ MANumberDescription new
		accessor: #sessionYear;
		priority: 100;
		propertyAt: 'parameterType' put: 'required';
		yourself
]

{ #category : 'accessing' }
NySenateGetBill >> printNumber [
	^ self maLazyFromDescriptionOf: #printNumber
]

{ #category : 'accessing' }
NySenateGetBill >> printNumber: anObject [
	printNumber := anObject
]

{ #category : 'accessing' }
NySenateGetBill >> sessionYear [
	^ self maLazyFromDescriptionOf: #sessionYear
]

{ #category : 'accessing' }
NySenateGetBill >> sessionYear: anObject [
	sessionYear := anObject
]
