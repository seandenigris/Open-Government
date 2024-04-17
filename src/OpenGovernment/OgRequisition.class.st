Class {
	#name : #OgRequisition,
	#superclass : #Object,
	#instVars : [
		'date',
		'department',
		'destination',
		'account',
		'vendor',
		'form',
		'signedCopy',
		'project'
	],
	#category : #'OpenGovernment-Budgeting'
}

{ #category : #accessing }
OgRequisition class >> forProject: aPpProject [

	^ self new
		project: aPpProject;
		yourself
]

{ #category : #accessing }
OgRequisition >> account [
	^ account
]

{ #category : #accessing }
OgRequisition >> account: anObject [
	account := anObject.
	self form account: anObject
]

{ #category : #accessing }
OgRequisition >> date [
	^ date
]

{ #category : #accessing }
OgRequisition >> date: aDate [
	date := aDate.
	self form date: aDate
]

{ #category : #accessing }
OgRequisition >> department [
	^ department
]

{ #category : #accessing }
OgRequisition >> department: anObject [
	department := anObject
]

{ #category : #accessing }
OgRequisition >> destination [
	^ destination
]

{ #category : #accessing }
OgRequisition >> destination: aString [
	destination := aString.
	self form destination: aString
]

{ #category : #accessing }
OgRequisition >> destinationDescription [
	<magritteDescription>
	
	^ MASingleOptionDescription new
		accessor: #destination;
		options: self destinationOptions;
		yourself
]

{ #category : #accessing }
OgRequisition >> form [
	
	^ form ifNil: [ form := self newForm import ]
]

{ #category : #accessing }
OgRequisition >> form: anObject [
	form := anObject
]

{ #category : #private }
OgRequisition >> newForm [

	| copy |
	copy := Tempfile named: 'Requisition ', Date today yyyymmdd, ' ', self project title, '.xlsx'.
	self blankForm file copyTo: copy.
	^ (self class formClass on: copy)
		name: 'Requisition Form';
		yourself
]

{ #category : #accessing }
OgRequisition >> project [
	^ project
]

{ #category : #accessing }
OgRequisition >> project: anObject [
	project := anObject
]

{ #category : #accessing }
OgRequisition >> signedCopy [
	^ signedCopy
]

{ #category : #accessing }
OgRequisition >> signedCopy: anObject [
	signedCopy := anObject
]

{ #category : #accessing }
OgRequisition >> vendor [
	^ vendor
]

{ #category : #accessing }
OgRequisition >> vendor: anObject [
	vendor := anObject.
	self form vendor: anObject
]
