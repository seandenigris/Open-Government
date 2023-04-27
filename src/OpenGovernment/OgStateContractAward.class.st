Class {
	#name : #OgStateContractAward,
	#superclass : #LlAuthoredWork,
	#instVars : [
		'awardNumber',
		'classificationCodes',
		'startDate',
		'endDate',
		'url'
	],
	#category : #OpenGovernment
}

{ #category : #accessing }
OgStateContractAward class >> all [
	| response url urlSpecified records rows safeString soup cells header |
	response := ZnEasy
			get: 'https://ogs.ny.gov/procurement/ogs-centralized-awards-list'.
	safeString := String
			streamContents: [ :str | response contents do: [ :e | e asciiValue <= 256 ifTrue: [ str nextPut: e ] ] ].
	soup := Soup fromString: safeString.
	rows := soup // 'tr'.
	header := rows first.
	records := rows allButFirst.
	^ records asOrderedCollection
		collect: [ :e | 
			cells := e / 'td'.
			url := [ 
				urlSpecified := cells first a attributeAt: 'href'.
				'https://ogs.ny.gov/' asUrl withRelativeReference: urlSpecified  ]
					on: Error
					do: [ nil ].
			self new
				awardNumber: cells first text;
				title: cells third text;
				url: url;
				yourself ]
]

{ #category : #accessing }
OgStateContractAward >> awardNumber [
	^ awardNumber
]

{ #category : #accessing }
OgStateContractAward >> awardNumber: anObject [
	awardNumber := anObject
]

{ #category : #accessing }
OgStateContractAward >> classificationCodes [
	^ classificationCodes
]

{ #category : #accessing }
OgStateContractAward >> classificationCodes: anObject [
	classificationCodes := anObject
]

{ #category : #accessing }
OgStateContractAward >> endDate [
	^ endDate
]

{ #category : #accessing }
OgStateContractAward >> endDate: anObject [
	endDate := anObject
]

{ #category : #accessing }
OgStateContractAward >> printOn: aStream [

	self awardNumber ifNotNil: [ :num |
		aStream 
			nextPutAll: num;
			nextPutAll: ': ' ].
	super printOn: aStream
]

{ #category : #accessing }
OgStateContractAward >> startDate [
	^ startDate
]

{ #category : #accessing }
OgStateContractAward >> startDate: anObject [
	startDate := anObject
]

{ #category : #accessing }
OgStateContractAward >> url [
	^ url
]

{ #category : #accessing }
OgStateContractAward >> url: anObject [
	url := anObject
]

{ #category : #accessing }
OgStateContractAward >> webBrowseGtActionFor: anAction [
	<gtAction>
	
		^ anAction button
		  icon: BrGlamorousVectorIcons link;
		  tooltip: 'Browse on web';
		  action: [ self url open ]
]
