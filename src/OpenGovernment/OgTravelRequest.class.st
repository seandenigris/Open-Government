Class {
	#name : #OgTravelRequest,
	#superclass : #RlSignableForm,
	#instVars : [
		'requestDate',
		'account',
		'applicant',
		'eventTitle',
		'location',
		'startDate',
		'endDate'
	],
	#category : #'OpenGovernment-Budgeting'
}

{ #category : #accessing }
OgTravelRequest >> account [
	^ account
]

{ #category : #accessing }
OgTravelRequest >> account: anObject [
	account := anObject.
	self form account: anObject
]

{ #category : #accessing }
OgTravelRequest >> applicant [
	^ applicant
]

{ #category : #accessing }
OgTravelRequest >> applicant: anObject [
	applicant := anObject
]

{ #category : #accessing }
OgTravelRequest >> endDate [
	^ endDate
]

{ #category : #accessing }
OgTravelRequest >> endDate: anObject [
	endDate := anObject
]

{ #category : #accessing }
OgTravelRequest >> eventTitle [
	^ eventTitle
]

{ #category : #accessing }
OgTravelRequest >> eventTitle: anObject [
	eventTitle := anObject
]

{ #category : #accessing }
OgTravelRequest >> location [
	^ location
]

{ #category : #accessing }
OgTravelRequest >> location: anObject [
	location := anObject
]

{ #category : #private }
OgTravelRequest >> newFormFilename [
	^ 'Travel request ' , Date today yyyymmdd, ' ' , self applicant nameForAlphabetization , '.xlsx'
]

{ #category : #accessing }
OgTravelRequest >> requestDate [
	^ requestDate
]

{ #category : #accessing }
OgTravelRequest >> requestDate: anObject [
	requestDate := anObject
]

{ #category : #accessing }
OgTravelRequest >> startDate [
	^ startDate
]

{ #category : #accessing }
OgTravelRequest >> startDate: anObject [
	startDate := anObject
]

{ #category : #accessing }
OgTravelRequest >> travelMethodDescription [
	"<magritteDescription>"
	
	^ MASingleOptionDescription new
		accessor: #travelMethod;
		options: self travelMethodOptions;
		yourself
]
