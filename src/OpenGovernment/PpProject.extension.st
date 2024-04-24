Extension { #name : #PpProject }

{ #category : #'*OpenGovernment' }
PpProject >> requisition [

	^ self
		propertyAt: #requisition
		ifAbsentPut: [ OgRequisition forClient: self ].
]
