Class {
	#name : #OgMunisMAMoneyStringWriter,
	#superclass : #MAStringWriter,
	#category : #'OpenGovernment-Munis'
}

{ #category : #visiting }
OgMunisMAMoneyStringWriter >> visitMoneyDescription: aMeasure [
	 
	aMeasure amount < 0 ifTrue: [ self stream << $- ].
	self stream << $$ << aMeasure amount abs rounded asStringWithCommas
]
