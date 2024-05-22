Class {
	#name : #OgBidSpec,
	#superclass : #Object,
	#instVars : [
		'lines'
	],
	#category : #'OpenGovernment-Public Works'
}

{ #category : #accessing }
OgBidSpec >> lines [
	^ lines ifNil: [ lines := OrderedCollection new ]
]

{ #category : #accessing }
OgBidSpec >> lines: anObject [
	lines := anObject
]

{ #category : #accessing }
OgBidSpec >> linesAdd: aLine [
	^ self lines add: aLine
]

{ #category : #accessing }
OgBidSpec >> linesGtViewFor: aView [
	<gtView>
	
	^ (aView maColumnedListOf: OgBidSpecInventoriedLine)
		title: 'Lines';
		priority: 25;
		items: [ self lines ];
		actionUpdateButton
]
