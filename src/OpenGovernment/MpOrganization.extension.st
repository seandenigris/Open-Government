Extension { #name : #MpOrganization }

{ #category : #'*OpenGovernment' }
MpOrganization >> grants [

	^ self
		propertyAt: #grants
		ifAbsentPut: [ OrderedCollection new ]
]
