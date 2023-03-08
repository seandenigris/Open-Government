Class {
	#name : 'NySenateListBills',
	#superclass : 'NySenateApiRequest',
	#instVars : [
		'sessionYear'
	],
	#category : 'OpenGovernment-NYSenate'
}

{ #category : 'instance creation' }
NySenateListBills class >> from: anInteger [
	^ self new
			sessionYear: anInteger;
			yourself
]

{ #category : 'accessing-magritte' }
NySenateListBills >> descriptionSessionYear [
	<magritteDescription>
	^ MANumberDescription new
		accessor: #sessionYear;
		propertyAt: 'parameterType' put: 'required';
		yourself
]

{ #category : 'accessing' }
NySenateListBills >> sessionYear [
	^ sessionYear
]

{ #category : 'parameters-required' }
NySenateListBills >> sessionYear: anInteger [ 
	sessionYear := anInteger
]
