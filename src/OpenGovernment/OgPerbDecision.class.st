Class {
	#name : #OgPerbDecision,
	#superclass : #OgLegalDecision,
	#category : #OpenGovernment
}

{ #category : #accessing }
OgPerbDecision >> chargingParty [
	^ self petitioners first
]

{ #category : #'as yet unclassified' }
OgPerbDecision >> displayStringOn: aStream [

	aStream << 'Matter of '.
	self petitioners ifNotEmpty: [ :aCol | aStream << aCol first fullName ].
	self respondents ifNotEmpty: [ :aCol | aStream << ' [' << aCol first fullName << ']' ].
	self date ifNotNil: [ :aDate | aStream << ' [' << aDate year asString << ']' ]
	
	"Reference: https://law.stackexchange.com/questions/39252/perb-citation-elements"
]
