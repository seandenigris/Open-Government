Class {
	#name : 'NYSenate',
	#superclass : 'Object',
	#instVars : [
		'apiKey'
	],
	#classVars : [
		'ApiKey'
	],
	#category : 'OpenGovernment-NYSenate'
}

{ #category : 'accessing' }
NYSenate class >> apiKey [
	^ ApiKey
]

{ #category : 'accessing' }
NYSenate class >> apiKey: aString [
	ApiKey := aString
]

{ #category : 'accessnig' }
NYSenate >> apiKey [
	"For testing to provide dummy key"
	^ apiKey ifNil: [ self class apiKey ]
]

{ #category : 'accessnig' }
NYSenate >> apiKey: aString [ 
	apiKey := aString
]

{ #category : 'as yet unclassified' }
NYSenate >> bills [
	^ NySenateListBills new
			apiKey: self class apiKey;
			yourself
]

{ #category : 'as yet unclassified' }
NYSenate >> billsFrom: sessionYearNumber [
	^ (NySenateListBills from: sessionYearNumber)
			apiKey: self apiKey;
			yourself
]
