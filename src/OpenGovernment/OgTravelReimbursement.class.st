Class {
	#name : #OgTravelReimbursement,
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
OgTravelReimbursement class >> formClass [

	^ NdTravelReimbursementForm
]

{ #category : #accessing }
OgTravelReimbursement >> account [
	^ account
]

{ #category : #accessing }
OgTravelReimbursement >> account: anObject [
	account := anObject
]

{ #category : #accessing }
OgTravelReimbursement >> applicant [

	^ applicant
]

{ #category : #accessing }
OgTravelReimbursement >> applicant: anObject [

	applicant := anObject
]

{ #category : #accessing }
OgTravelReimbursement >> applicantDescription [
	<magritteDescription>
	
	| searchSource |
	searchSource := PeGtDelegatedSearch
		to: self organization 
		message: #affiliationsGtSearchFor:.
		
	^ MAToOneRelationDescription new
		  accessor: #applicant;
		  morphicClass: MADropListMorph;
		  gtSearchSource: searchSource;
		  classes: MpAffiliation withAllSubclasses;
		  priority: 200;
		  beRequired;
		  yourself
]

{ #category : #accessing }
OgTravelReimbursement >> endDate [
	^ endDate
]

{ #category : #accessing }
OgTravelReimbursement >> endDate: anObject [
	endDate := anObject
]

{ #category : #accessing }
OgTravelReimbursement >> eventTitle [
	^ eventTitle
]

{ #category : #accessing }
OgTravelReimbursement >> eventTitle: anObject [
	eventTitle := anObject
]

{ #category : #accessing }
OgTravelReimbursement >> location [
	^ location
]

{ #category : #accessing }
OgTravelReimbursement >> location: anObject [
	location := anObject
]

{ #category : #accessing }
OgTravelReimbursement >> newFormFilename [
	^ 'Travel reimbursement ' , Date today yyyymmdd, ' ' , self applicant nameForAlphabetization , '.xlsx'
]

{ #category : #accessing }
OgTravelReimbursement >> requestDate [
	^ requestDate
]

{ #category : #accessing }
OgTravelReimbursement >> requestDate: anObject [
	requestDate := anObject
]

{ #category : #accessing }
OgTravelReimbursement >> startDate [
	^ startDate
]

{ #category : #accessing }
OgTravelReimbursement >> startDate: anObject [
	startDate := anObject
]
