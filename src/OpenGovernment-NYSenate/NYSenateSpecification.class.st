Class {
	#name : 'NYSenateSpecification',
	#superclass : 'TestCase',
	#category : 'OpenGovernment-NYSenate-Tests'
}

{ #category : 'setup' }
NYSenateSpecification >> dummyApiKey [
	^ 'DummyApiKey'
]

{ #category : 'tests' }
NYSenateSpecification >> testListBills [
	| senate sessionYear command |
	senate := NYSenate new
		apiKey: self dummyApiKey;
		yourself.
		
	sessionYear := 2017.
	
	command := senate billsFrom: sessionYear.
	command url asString should equal: 
	'https://legislation.nysenate.gov/api/3/bills/', sessionYear asString, '?key=', self dummyApiKey
]
