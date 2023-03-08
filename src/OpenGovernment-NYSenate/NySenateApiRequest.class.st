Class {
	#name : 'NySenateApiRequest',
	#superclass : 'Object',
	#instVars : [
		'apiKey'
	],
	#category : 'OpenGovernment-NYSenate'
}

{ #category : 'accessing' }
NySenateApiRequest >> apiKey [
	^ self maLazyFromDescriptionOf: #apiKey
]

{ #category : 'accessing' }
NySenateApiRequest >> apiKey: anObject [
	apiKey := anObject
]

{ #category : 'accessing-magritte' }
NySenateApiRequest >> descriptionApiKey [
	<magritteDescription>
	^ MAPasswordDescription new
		accessor: #apiKey;
		yourself
]

{ #category : 'command' }
NySenateApiRequest >> get [
	^ NeoJSONReader fromString: self url retrieveContents
]

{ #category : 'accessing' }
NySenateApiRequest >> url [

	| url requiredParameters |
	url := 'https://legislation.nysenate.gov/api/3/bills' asUrl
		queryAt: 'key' put: self apiKey;
		yourself.
	requiredParameters := self magritteDescription select: [ :desc | desc propertyAt: 'parameterType' ifPresent: [ :prop | prop = 'required' ] ifAbsent: [ false ] ].
	requiredParameters do: [ :paramDesc | url addPathSegment: (self readUsing: paramDesc) asString ].
	^ url
]
