Class {
	#name : #OgMunisObject,
	#superclass : #OgMunisEntity,
	#category : #'OpenGovernment-Munis'
}

{ #category : #accessing }
OgMunisObject >> accounts [

	^ self munis accounts select: [ :act | act object = self ]
]

{ #category : #accessing }
OgMunisObject >> accountsGtViewFor: aView [
	<gtView>
	
	| result lineDescription |
	result := aView columnedList
		title: 'Accounts';
		priority: 50;
		items: [ self accounts ];
		column: 'Account'
				text: #number.
		
	lineDescription := OgMunisBudgetLine new magritteDescription select: [ :e | e isKindOf: OgMunisMAMoneyDescription ].	
	
	lineDescription do: [ :desc |
		result column: desc label
			text: [ :act | desc readToString: act budgetLines first ] ].
				
	^ result
]

{ #category : #accessing }
OgMunisObject >> printOn: aStream [

	"code ifNotNil: [ aStream << self code ].
	
	description ifNotNil: [ 
		aStream space << self description ]."
		
	aStream nextPutAll: ' ('.
	super printOn: aStream.
	aStream nextPutAll: ')'.
]
