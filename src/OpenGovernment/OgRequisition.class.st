Class {
	#name : #OgRequisition,
	#superclass : #RlSignableForm,
	#instVars : [
		'date',
		'department',
		'destination',
		'account',
		'vendor'
	],
	#category : #'OpenGovernment-Budgeting'
}

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

{ #category : #private }
OgRequisition >> newFormFilename [
	^ 'Requisition ' , Date today yyyymmdd , ' ' , self project title , '.xlsx'
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
