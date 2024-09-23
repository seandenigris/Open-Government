Class {
	#name : #OgLegalDecision,
	#superclass : #LlAuthoredWork,
	#instVars : [
		'petitioners',
		'respondents',
		'caseNumber',
		'date',
		'forum'
	],
	#category : #OpenGovernment
}

{ #category : #accessing }
OgLegalDecision >> caseNumber [
	^ caseNumber
]

{ #category : #accessing }
OgLegalDecision >> caseNumber: anObject [
	caseNumber := anObject
]

{ #category : #accessing }
OgLegalDecision >> caseNumberDescription [
	<magritteDescription>
	
	^ MAStringDescription new
		accessor: #caseNumber;
		priority: 100;
		yourself
]

{ #category : #accessing }
OgLegalDecision >> date [
	^ date
]

{ #category : #accessing }
OgLegalDecision >> date: anObject [
	date := anObject
]

{ #category : #accessing }
OgLegalDecision >> dateDescription [
	<magritteDescription>
	
	^ MADateDescription new
		accessor: #date;
		priority: 100;
		yourself
]

{ #category : #'as yet unclassified' }
OgLegalDecision >> displayStringOn: aStream [

	self petitioners ifNotEmpty: [ :aCol | aStream << aCol first fullName ].
	self respondents ifNotEmpty: [ :aCol | aStream << ' v. ' << aCol first fullName ].
	
	self forum ifNotNil: [ :anOrg | aStream << ' (' << anOrg fullName ].
	
	self date ifNotNil: [ :aDate | aStream << ' [' << aDate year asString << '])' ]
	
	"Reference: https://law.stackexchange.com/questions/39252/perb-citation-elements"
]

{ #category : #accessing }
OgLegalDecision >> forum [
	^ forum
]

{ #category : #accessing }
OgLegalDecision >> forum: anObject [
	forum := anObject
]

{ #category : #accessing }
OgLegalDecision >> forumDescription [
	<magritteDescription>
	
	^ MAToOneRelationDescription new
		accessor: #forum;
		priority: 100;
		gtSearchSource: self addressBook;
		classes: MpRelatableEntity allSubclasses;
		yourself
]

{ #category : #accessing }
OgLegalDecision >> petitioners [
	^ petitioners ifNil: [ petitioners := OrderedCollection new ]
]

{ #category : #accessing }
OgLegalDecision >> petitioners: aCollection [
	petitioners := aCollection
]

{ #category : #accessing }
OgLegalDecision >> petitionersDescription [
	<magritteDescription>
	
	^ MAToManyRelationDescription new
		accessor: #petitioners;
		priority: 100;
		gtSearchSource: self addressBook;
		classes: MpRelatableEntity allSubclasses;
		yourself
]

{ #category : #'as yet unclassified' }
OgLegalDecision >> printOn: aStream [

	self printFromDisplayStringOn: aStream
]

{ #category : #accessing }
OgLegalDecision >> respondents [
	^ respondents ifNil: [ respondents := OrderedCollection new ]
]

{ #category : #accessing }
OgLegalDecision >> respondents: aCollection [
	respondents := aCollection
]

{ #category : #accessing }
OgLegalDecision >> respondentsDescription [
	<magritteDescription>
	
	^ MAToManyRelationDescription new
		accessor: #respondents;
		priority: 100;
		gtSearchSource: self addressBook;
		classes: MpRelatableEntity allSubclasses;
		yourself
]

{ #category : #'as yet unclassified' }
OgLegalDecision >> title [

	^ self displayString
]
