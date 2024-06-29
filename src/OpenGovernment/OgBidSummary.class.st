Class {
	#name : #OgBidSummary,
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
OgBidSummary class >> formClass [

	^ NdBidSummaryForm
]

{ #category : #accessing }
OgBidSummary >> newFormFilename [
	^ 'Bid Summary ' , Date today yyyymmdd , ' ' , self client title , '.pdf'
]
