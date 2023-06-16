Class {
	#name : #OgMunisMAMoneyStringReader,
	#superclass : #MAStringReader,
	#category : #'OpenGovernment-Munis'
}

{ #category : #accessing }
OgMunisMAMoneyStringReader >> visitMoneyDescription: anObject [
	| money |
	money := AmDollar readFrom: self stream.
	self object: money
]
