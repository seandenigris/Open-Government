Class {
	#name : #OgMunisMAMoneyDescription,
	#superclass : #MAMoneyDescription,
	#category : #'OpenGovernment-Munis'
}

{ #category : #initialization }
OgMunisMAMoneyDescription >> initialize [

	super initialize.
	self
		stringReader: OgMunisMAMoneyStringReader;
		stringWriter: OgMunisMAMoneyStringWriter.
]
