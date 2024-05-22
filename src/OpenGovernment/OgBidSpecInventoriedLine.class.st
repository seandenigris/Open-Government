Class {
	#name : #OgBidSpecInventoriedLine,
	#superclass : #OgBidSpecAbstractLine,
	#instVars : [
		'quantity',
		'items'
	],
	#category : #'OpenGovernment-Public Works'
}

{ #category : #accessing }
OgBidSpecInventoriedLine class >> allFromCSV: convertibleToRlResource [
	| records lines |
	lines := convertibleToRlResource asRlResource asArraysOfStrings.
	records := lines allButFirst.
	^ records collect: [ :rec | self fromArray: rec ]
]

{ #category : #accessing }
OgBidSpecInventoriedLine class >> fromArray: anArray [

	^ self new
		stationNumber: anArray first asNumber;
		number: anArray second asNumber;
		originalDescription: anArray third;
		quantity: anArray fourth asNumber;
		yourself
]

{ #category : #accessing }
OgBidSpecInventoriedLine >> description [
	description ifNotNil: [ ^ description ].

	^ 'Remove and install ', self quantity asString, ' new ', self items atRandom replacementString
]

{ #category : #accessing }
OgBidSpecInventoriedLine >> items [
	^ items
]

{ #category : #accessing }
OgBidSpecInventoriedLine >> items: anObject [
	items := anObject
]

{ #category : #accessing }
OgBidSpecInventoriedLine >> itemsGtViewFor: aView [
	<gtView>
	
	^ aView list
		title: 'Items';
		priority: 25;
		items: [ self items ];
		actionUpdateButton
]

{ #category : #accessing }
OgBidSpecInventoriedLine >> quantity [
	^ self items size
]
