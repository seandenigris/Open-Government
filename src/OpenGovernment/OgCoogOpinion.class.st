Class {
	#name : #OgCoogOpinion,
	#superclass : #Object,
	#instVars : [
		'url',
		'date',
		'quotes'
	],
	#classVars : [
		'DB'
	],
	#category : #OpenGovernment
}

{ #category : #accessing }
OgCoogOpinion class >> db [
	^ DB ifNil: [ DB := OrderedCollection new ]
]

{ #category : #accessing }
OgCoogOpinion class >> db: anObject [
	DB := anObject
]

{ #category : #persistence }
OgCoogOpinion class >> restoreFrom: anObject [

	DB := anObject.
]

{ #category : #persistence }
OgCoogOpinion class >> spData [
	^ DB
]

{ #category : #accessing }
OgCoogOpinion >> date [
	| soup contentTag paragraphs dateLine |
	date ifNotNil: [ ^ date ].
	soup := self soup.
	contentTag := soup findTag: [ :t | t id = 'mainContent' ].
	dateLine := contentTag text lines detect: [ :l | l includesSubstring: 'InstanceBeginEditable' ].
	"Pages are not all same format, so try first way to find date…"
	[ ^ date := (dateLine copyAfterLast: $") trimBoth asDate translateToUTC ]
			on: Error do: [ ].
	"If that didn't work, the page must be the other format"
	[ ^ ((contentTag / #p) second) text trimBoth asDate translateToUTC ] on: Error do: [ ].
	"Final attempt"
	^ ((contentTag / #p) third) text trimBoth asDate translateToUTC
]

{ #category : #'as yet unclassified' }
OgCoogOpinion >> dateHtmlLink [
	^ HtmlLink new
		destination: self url;
		text: self date mmddyyyy;
		yourself
]

{ #category : #'as yet unclassified' }
OgCoogOpinion >> number [
	^ self url file asFileReference base allButFirst asNumber
]

{ #category : #accessing }
OgCoogOpinion >> present [
	self url open
]

{ #category : #printing }
OgCoogOpinion >> printOn: aStream [

	aStream
		nextPutAll: 'COOG Op ';
		print: self number;
		space;
		print: self date
]

{ #category : #accessing }
OgCoogOpinion >> quotes [
	^ quotes ifNil: [ quotes := OrderedCollection new ]
]

{ #category : #accessing }
OgCoogOpinion >> quotes: anObject [
	quotes := anObject
]

{ #category : #'as yet unclassified' }
OgCoogOpinion >> soup [
	^ Soup fromUrl: self url
]

{ #category : #accessing }
OgCoogOpinion >> url [
	^ url
]

{ #category : #accessing }
OgCoogOpinion >> url: anObject [
	url := anObject
]
