Extension { #name : #PpProject }

{ #category : #'*OpenGovernment' }
PpProject >> requisition [

	^ self
		propertyAt: #requisition
		ifAbsentPut: [ self newRequisition ]
]
