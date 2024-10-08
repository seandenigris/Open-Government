Class {
	#name : #OgNysCodesClass,
	#superclass : #PpEvent,
	#instVars : [
		'number',
		'topic'
	],
	#category : #OpenGovernment
}

{ #category : #accessing }
OgNysCodesClass >> number [
	^ number
]

{ #category : #accessing }
OgNysCodesClass >> number: anObject [
	number := anObject
]

{ #category : #accessing }
OgNysCodesClass >> numberDescription [

	<magritteDescription>
	^ MAStringDescription new
		  accessor: #number;
		  yourself
]

{ #category : #accessing }
OgNysCodesClass >> topic [
	^ topic
]

{ #category : #accessing }
OgNysCodesClass >> topic: anObject [
	topic := anObject
]

{ #category : #accessing }
OgNysCodesClass >> topicDescription [

	<magritteDescription>
	^ MANumberDescription new
		  accessor: #topic;
		  yourself
]
