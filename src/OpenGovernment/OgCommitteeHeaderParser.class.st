Class {
	#name : #OgCommitteeHeaderParser,
	#superclass : #PP2CompositeNode,
	#category : 'OpenGovernment-Support'
}

{ #category : #accessing }
OgCommitteeHeaderParser >> addParserFor: link to: result [
	| valueParser label |
	valueParser := link nextLink ifNotNil: [ :next | next value asParser negate ] ifNil: [ #any asParser ].
	label := link value asParser ==> [ :lab | lab asLowercase ].
	^ result, label, (valueParser plus flatten ==> #trim)
]

{ #category : #accessing }
OgCommitteeHeaderParser >> labels [
	^ LinkedList withAll: #('Committee:' 'Chair:' 'DATE:' 'AYE/NAY:' 'Action:').
]

{ #category : #accessing }
OgCommitteeHeaderParser >> newCommitteeVoteFrom: fieldMap [
	| result |
	result := OgCommitteeVote new.
	result magritteDescription do: [ :desc |
		fieldMap associationAt: desc accessor writeSelector ifPresent: [ :a | desc accessor write: (desc fromString: a value) to: result ] ].
	^ result
]

{ #category : #accessing }
OgCommitteeHeaderParser >> start [
	| result |
	"Provide a default parse so we don't have to special-case the first element"
	result := nil asParser.
	self labels linksDo: [ :l | result := (self addParserFor: l to: result) ].
	^ result ==> [ :r | 
		| fieldMap |
		fieldMap := Dictionary newFromPairs: r allButFirst.
		self newCommitteeVoteFrom: fieldMap ].
]
