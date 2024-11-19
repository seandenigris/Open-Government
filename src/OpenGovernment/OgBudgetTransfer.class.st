Class {
	#name : #OgBudgetTransfer,
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
OgBudgetTransfer class >> formClass [

	^ RlPDF
]

{ #category : #accessing }
OgBudgetTransfer >> newFormFilename [
	^ 'Budget transfer request ' , Date today yyyymmdd , ' ' , self client title , '.pdf'
]
