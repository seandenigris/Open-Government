Class {
	#name : #OgBidSpecTextLine,
	#superclass : #OgBidSpecAbstractLine,
	#instVars : [
		'quantity',
		'items'
	],
	#category : #'OpenGovernment-Public Works'
}

{ #category : #accessing }
OgBidSpecTextLine class >> allFromCSV: convertibleToRlResource [
	| records lines |
	lines := convertibleToRlResource asRlResource asArraysOfStrings.
	records := lines allButFirst.
	^ records collect: [ :rec | self fromArray: rec ]
]

{ #category : #accessing }
OgBidSpecTextLine class >> fromArray: anArray [

	^ self new
		stationNumber: anArray first asNumber;
		number: anArray second asNumber;
		originalDescription: anArray third;
		quantity: anArray fourth asNumber;
		yourself
]

{ #category : #accessing }
OgBidSpecTextLine >> quantity [
	^ quantity
]

{ #category : #accessing }
OgBidSpecTextLine >> quantity: anObject [
	quantity := anObject
]
