Class {
	#name : #OgMunisMAMoneyStringWriter,
	#superclass : #MAStringWriter,
	#category : #'OpenGovernment-Munis'
}

{ #category : #visiting }
OgMunisMAMoneyStringWriter >> visitMoneyDescription: aDescription [
	 
	self object amount < 0 ifTrue: [ self stream << $- ].
	self stream << $$ << self object amount abs rounded asStringWithCommas
]
