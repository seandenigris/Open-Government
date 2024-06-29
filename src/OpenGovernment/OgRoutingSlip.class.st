Class {
	#name : #OgRoutingSlip,
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
OgRoutingSlip class >> formClass [

	^ NdRoutingSlipForm
]

{ #category : #accessing }
OgRoutingSlip >> newFormFilename [
	^ 'Routing Slip ' , Date today yyyymmdd , ' ' , self client title , '.pdf'
]
