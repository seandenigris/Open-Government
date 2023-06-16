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
		str << $$ << aMeasure amount abs rounded asStringWithCommas ]
]

{ #category : #accessing }
OgMunisBudgetLine >> actual [
	^ actual
]

{ #category : #accessing }
OgMunisBudgetLine >> actual: anObject [
	actual := anObject
]

{ #category : #accessing }
OgMunisBudgetLine >> actualDescription [
	<magritteDescription>
	
	^ OgMunisMAMoneyDescription new
		accessor: #actual;
		csvReader: [ :str | self class moneyFromString: str ];
		yourself
]

{ #category : #accessing }
OgMunisBudgetLine >> available [
	^ available
]

{ #category : #accessing }
OgMunisBudgetLine >> available: anObject [
	available := anObject
]

{ #category : #accessing }
OgMunisBudgetLine >> availableDescription [
	<magritteDescription>
	
	^ OgMunisMAMoneyDescription new
		accessor: #available;
		csvReader: [ :str | self class moneyFromString: str ];
		yourself
]

{ #category : #accessing }
OgMunisBudgetLine >> encumbrances [
	^ encumbrances
]

{ #category : #accessing }
OgMunisBudgetLine >> encumbrances: anObject [
	encumbrances := anObject
]

{ #category : #accessing }
OgMunisBudgetLine >> encumbrancesDescription [
	<magritteDescription>
	
	^ OgMunisMAMoneyDescription new
		accessor: #encumbrances;
		csvReader: [ :str | self class moneyFromString: str ];
		yourself
]

{ #category : #accessing }
OgMunisBudgetLine >> original [
	^ original
]

{ #category : #accessing }
OgMunisBudgetLine >> original: anObject [
	original := anObject
]

{ #category : #accessing }
OgMunisBudgetLine >> originalDescription [
	<magritteDescription>
	
	^ OgMunisMAMoneyDescription new
		accessor: #original;
		csvReader: [ :str | self class moneyFromString: str ];
		yourself
]

{ #category : #accessing }
OgMunisBudgetLine >> percentUsed [
	
	self revised = 0 ifTrue: [ ^ 0 ].

	^ (self actual + self encumbrances) / self revised * 100
]

{ #category : #accessing }
OgMunisBudgetLine >> percentUsedString [

	| fractionPart roundedFractionPart digitsRemaining suffix |
	^ String streamContents: [ :str |
		str << self percentUsed integerPart asString.
		fractionPart := self percentUsed fractionPart.
		fractionPart = 0 ifFalse: [ 
			str << $..
			roundedFractionPart := (self percentUsed fractionPart * 100) rounded.
			digitsRemaining := roundedFractionPart < 10 
				ifTrue: [ 
					str << $0.
					1 ]
				ifFalse: [ 2 ].
			suffix := roundedFractionPart asString first: digitsRemaining.
			str << suffix ].
		str << $% ]
]

{ #category : #accessing }
OgMunisBudgetLine >> revised [
	^ revised
]

{ #category : #accessing }
OgMunisBudgetLine >> revised: anObject [
	revised := anObject
]

{ #category : #accessing }
OgMunisBudgetLine >> revisedDescription [
	<magritteDescription>
	
	^ OgMunisMAMoneyDescription new
		accessor: #revised;
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
