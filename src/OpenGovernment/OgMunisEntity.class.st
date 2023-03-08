Class {
	#name : #OgMunisEntity,
	#superclass : #Object,
	#instVars : [
		'code',
		'description'
	],
	#category : #'OpenGovernment-Munis'
}

{ #category : #accessing }
OgMunisEntity class >> allFromCSV: aResourceable [

	^ aResourceable asRlResource neoCSVReaderDo: [ :r |
		r
			skipHeader;
			recordClass: self;
			addField: #code:;
			addField: #description:;
			upToEnd ].
]

{ #category : #accessing }
OgMunisEntity >> code [
	^ code
]

{ #category : #accessing }
OgMunisEntity >> code: anObject [
	code := anObject
]

{ #category : #accessing }
OgMunisEntity >> description [
	^ description
]

{ #category : #accessing }
OgMunisEntity >> description: anObject [
	description := anObject
]

{ #category : #accessing }
OgMunisEntity >> displayStringOn: aStream [

	code ifNotNil: [ aStream << self code ].
	
	description ifNotNil: [ 
		aStream space << self description ].
]

{ #category : #accessing }
OgMunisEntity >> munis [

	^ OgMunis uniqueInstance
]

{ #category : #accessing }
OgMunisEntity >> printOn: aStream [

	code ifNotNil: [ aStream << self code ].
	
	description ifNotNil: [ 
		aStream space << self description ].
		
	aStream nextPutAll: ' ('.
	super printOn: aStream.
	aStream nextPutAll: ')'.
]
