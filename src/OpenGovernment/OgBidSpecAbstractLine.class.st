Class {
	#name : #OgBidSpecAbstractLine,
	#superclass : #Object,
	#instVars : [
		'stationNumber',
		'originalDescription',
		'number',
		'locationName',
		'description',
		'oldNumber'
	],
	#category : #'OpenGovernment-Public Works'
}

{ #category : #accessing }
OgBidSpecAbstractLine >> description [
	description ifNotNil: [ ^ description ].

	^ self items atRandom replacementString
]

{ #category : #accessing }
OgBidSpecAbstractLine >> description: aString [

	self originalDescription = aString ifTrue: [ ^ self ].
	
	description := aString
]

{ #category : #accessing }
OgBidSpecAbstractLine >> descriptionDescription [
	<magritteDescription>
	
	^ MAMemoDescription new
			accessor: #description;
			priority: 300;
			yourself
]

{ #category : #accessing }
OgBidSpecAbstractLine >> descriptionDiff [

	^ PeCharacterDiff comparing: self description to: self originalDescription
]

{ #category : #accessing }
OgBidSpecAbstractLine >> descriptionDiffFor: aView [

	<gtView>
	self hasDescriptionChanged ifFalse: [ ^ aView empty ].
	
	^ aView forward
		title: 'Diff';
		priority: 10;
		object: [ 
			PeCharacterDiff comparing: self description to: self originalDescription ];
			view: #gtViewTextFor:
]

{ #category : #accessing }
OgBidSpecAbstractLine >> descriptionWithLocation [
	^ self description , PpInventoryItem replacementStringSeparator, 'Location: ', self locationName
]

{ #category : #accessing }
OgBidSpecAbstractLine >> descriptionWithLocationDescription [
	<magritteDescription>
	
	^ MAMemoDescription new
			accessor: #descriptionWithLocation;
			priority: 400;
			yourself
]

{ #category : #accessing }
OgBidSpecAbstractLine >> hasDescriptionChanged [

	^ description isNotNil
]

{ #category : #accessing }
OgBidSpecAbstractLine >> locationName [

	locationName ifNotNil: [ ^ locationName ].

	^ String streamContents: [ :str |
		| uniqueLocations |
		uniqueLocations := self items collectAsSet: #location.
		uniqueLocations 
			do: [ :loc | loc ifNotNil: [ str << loc name ] ]
			separatedBy: [ str << ', ' ] ]
]

{ #category : #accessing }
OgBidSpecAbstractLine >> locationName: anObject [
	locationName := anObject
]

{ #category : #accessing }
OgBidSpecAbstractLine >> locationNameDescription [
	<magritteDescription>
	
	^ MAStringDescription new
			accessor: #locationName;
			priority: 500;
			yourself
]

{ #category : #accessing }
OgBidSpecAbstractLine >> number [
	^ number
]

{ #category : #accessing }
OgBidSpecAbstractLine >> number: anObject [
	number := anObject
]

{ #category : #accessing }
OgBidSpecAbstractLine >> numberDescription [
	<magritteDescription>
	
	^ MANumberDescription new
			accessor: #number;
			priority: 200;
			yourself
]

{ #category : #accessing }
OgBidSpecAbstractLine >> oldNumber [
	^ oldNumber
]

{ #category : #accessing }
OgBidSpecAbstractLine >> oldNumber: anObject [
	oldNumber := anObject
]

{ #category : #accessing }
OgBidSpecAbstractLine >> oldNumberDescription [
	<magritteDescription>
	
	^ MANumberDescription new
			accessor: #oldNumber;
			priority: 200;
			yourself
]

{ #category : #'as yet unclassified' }
OgBidSpecAbstractLine >> originalDescription [
	^ originalDescription
]

{ #category : #accessing }
OgBidSpecAbstractLine >> originalDescription: aString [

	originalDescription := aString
]

{ #category : #accessing }
OgBidSpecAbstractLine >> printOn: aStream [

	"nextPutAll: 'Remove and install new '"
	aStream
		print: number;
		space;
		nextPutAll: self description
]

{ #category : #accessing }
OgBidSpecAbstractLine >> quantityDescription [
	<magritteDescription>
	
	^ MANumberDescription new
			accessor: #quantity;
			priority: 400;
			yourself
]

{ #category : #accessing }
OgBidSpecAbstractLine >> stationNumber [
	^ stationNumber
]

{ #category : #accessing }
OgBidSpecAbstractLine >> stationNumber: anObject [
	stationNumber := anObject
]

{ #category : #accessing }
OgBidSpecAbstractLine >> stationNumberDescription [
	<magritteDescription>
	
	^ MANumberDescription new
			accessor: #stationNumber;
			priority: 100;
			yourself
]
