Class {
	#name : #OgCommitteeVote,
	#superclass : #Object,
	#instVars : [
		'committee',
		'chair',
		'date',
		'action',
		'votes'
	],
	#category : #OpenGovernment
}

{ #category : #accessing }
OgCommitteeVote >> action [
	^ action
]

{ #category : #accessing }
OgCommitteeVote >> action: anObject [
	action := anObject
]

{ #category : #accessing }
OgCommitteeVote >> actionDescription [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #action;
		yourself
]

{ #category : #accessing }
OgCommitteeVote >> chair [
	^ chair
]

{ #category : #accessing }
OgCommitteeVote >> chair: anObject [
	chair := anObject
]

{ #category : #accessing }
OgCommitteeVote >> chairDescription [
	<magritteDescription>
	^ MAStringDescription new
			accessor: #chair;
			yourself
]

{ #category : #accessing }
OgCommitteeVote >> committee [
	^ committee
]

{ #category : #accessing }
OgCommitteeVote >> committee: anObject [
	committee := anObject
]

{ #category : #accessing }
OgCommitteeVote >> committeeDescription [
	<magritteDescription>
	^ MAStringDescription new
			accessor: #committee;
			yourself
]

{ #category : #accessing }
OgCommitteeVote >> date [
	^ date
]

{ #category : #accessing }
OgCommitteeVote >> date: anObject [
	date := anObject
]

{ #category : #accessing }
OgCommitteeVote >> dateDescription [
	<magritteDescription>
	^ MADateDescription new
		accessor: #date;
		yourself
]

{ #category : #'as yet unclassified' }
OgCommitteeVote >> record: member voted: vote [ 
	self votes at: member put: vote
]

{ #category : #accessing }
OgCommitteeVote >> votes [
	^ votes ifNil: [ votes := Dictionary new ]
]

{ #category : #accessing }
OgCommitteeVote >> votes: anObject [
	votes := anObject
]

{ #category : #accessing }
OgCommitteeVote >> votesDescription [
	<magritteDescription>
	^ MAToManyRelationDescription new
		accessor: #votes;
		yourself
]
