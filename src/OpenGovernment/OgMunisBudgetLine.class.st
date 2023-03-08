Class {
	#name : #OgMunisBudgetLine,
	#superclass : #Object,
	#instVars : [
		'original',
		'revised',
		'available',
		'actual',
		'encumbrances',
		'year'
	],
	#category : #'OpenGovernment-Munis'
}

{ #category : #accessing }
OgMunisBudgetLine class >> moneyFromString: aString [

	| withoutCommas |
	withoutCommas := aString copyWithout: $,.
	^ withoutCommas vsAsUSD
]

{ #category : #accessing }
OgMunisBudgetLine class >> stringFromMoney: aMeasure [

	^ String streamContents: [ :str |
		aMeasure amount < 0 ifTrue: [ 
			str << $- ].
		str << $$ << aMeasure amount rounded asStringWithCommas ]
]

{ #category : #accessing }
OgMunisBudgetLine >> actualDescription [
	<magritteDescription>
	
	^ MANumberDescription new
		accessor: #actual;
		csvFieldName: 'Actual';
		csvReader: [ :str | self class moneyFromString: str ];
		yourself
]

{ #category : #accessing }
OgMunisBudgetLine >> availableDescription [
	<magritteDescription>
	
	^ MANumberDescription new
		accessor: #available;
		csvFieldName: 'Available';
		csvReader: [ :str | self class moneyFromString: str ];
		yourself
]

{ #category : #accessing }
OgMunisBudgetLine >> encumbrancesDescription [
	<magritteDescription>
	
	^ MANumberDescription new
		accessor: #encumbrances;
		csvFieldName: 'Encumbrances';
		csvReader: [ :str | self class moneyFromString: str ];
		yourself
]

{ #category : #accessing }
OgMunisBudgetLine >> originalDescription [
	<magritteDescription>
	
	^ MANumberDescription new
		accessor: #original;
		csvFieldName: 'Original Budget';
		csvReader: [ :str | self class moneyFromString: str ];
		yourself
]

{ #category : #accessing }
OgMunisBudgetLine >> percentUsed [
	
	self revised = 0 ifTrue: [ ^ 0 ].

	^ (self actual + self encumbrances) / self revised
]

{ #category : #accessing }
OgMunisBudgetLine >> percentUsedString [

	^ String streamContents: [ :str |
		str << self percentUsed integerPart asString.
		self percentUsed fractionPart = 0 ifFalse: [ 
			str << $. << ((self percentUsed fractionPart * 100) rounded asString first: 2) ].
		str << $% ]
]

{ #category : #accessing }
OgMunisBudgetLine >> revisedDescription [
	<magritteDescription>
	
	^ MANumberDescription new
		accessor: #revised;
		csvFieldName: 'Revised Budget';
		csvReader: [ :str | self class moneyFromString: str ];
		yourself
]

{ #category : #accessing }
OgMunisBudgetLine >> year [
	^ year
]

{ #category : #accessing }
OgMunisBudgetLine >> year: anObject [
	year := anObject
]

{ #category : #accessing }
OgMunisBudgetLine >> yearDescription [
	<magritteDescription>
	
	^ MANumberDescription new
		accessor: #year;
		yourself
]
