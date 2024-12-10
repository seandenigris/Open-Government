Class {
	#name : #OgBudgetTransferForm,
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
OgBudgetTransferForm class >> formClass [

	^ RlPDF
]

{ #category : #'as yet unclassified' }
OgBudgetTransferForm >> clientPropertyKey [

	^ #budgetTransfer
]

{ #category : #accessing }
OgBudgetTransferForm >> newFormFilename [
	^ 'Budget transfer request ' , Date today yyyymmdd , ' ' , self client title , '.pdf'
]
