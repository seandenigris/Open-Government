Class {
	#name : #OgFloorVote,
	#superclass : #Object,
	#instVars : [
		'date',
		'description',
		'votes'
	],
	#category : #OpenGovernment
}

{ #category : #accessing }
OgFloorVote >> date [
	^ date
]

{ #category : #accessing }
OgFloorVote >> date: anObject [
	date := anObject
]

{ #category : #accessing }
OgFloorVote >> dateDescription [
	<magritteDescription>
	^ MADateDescription new
		accessor: #date;
		yourself
]

{ #category : #accessing }
OgFloorVote >> description [
	^ description
]

{ #category : #accessing }
OgFloorVote >> description: anObject [
	description := anObject
]

{ #category : #accessing }
OgFloorVote >> descriptionDescription [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #description;
		yourself
]

{ #category : #'as yet unclassified' }
OgFloorVote >> record: member voted: vote [ 
	self votes at: member put: vote
]

{ #category : #accessing }
OgFloorVote >> votes [
	^ votes ifNil: [ votes := Dictionary new ]
]

{ #category : #accessing }
OgFloorVote >> votes: anObject [
	votes := anObject
]

{ #category : #accessing }
OgFloorVote >> votesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		accessor: #votes;
		yourself
]
