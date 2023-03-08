Class {
	#name : #OgBill,
	#superclass : #Object,
	#traits : 'MATPropertyOwner',
	#classTraits : 'MATPropertyOwner classTrait',
	#instVars : [
		'name',
		'number',
		'body',
		'term'
	],
	#classVars : [
		'DB'
	],
	#category : #OpenGovernment
}

{ #category : #accessing }
OgBill class >> DB [
	^ DB ifNil: [ DB := OrderedCollection new ]
]

{ #category : #accessing }
OgBill class >> DB: anOrderedCollection [
	DB := anOrderedCollection
]

{ #category : #persistence }
OgBill class >> restoreFrom: anObject [

	DB := anObject
]

{ #category : #persistence }
OgBill class >> spData [

	^ DB
]

{ #category : #accessing }
OgBill >> term [

	^ term
]

{ #category : #accessing }
OgBill >> term: anObject [

	term := anObject
]
