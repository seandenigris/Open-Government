Extension { #name : #PpProject }

{ #category : #'*OpenGovernment' }
PpProject >> ogBidSpec [

	^ self 
		propertyAt: #bidSpec 
		ifAbsentPut:OgBidSpec new.
]

{ #category : #'*OpenGovernment' }
PpProject >> requisition [

	^ self
		propertyAt: #requisition
		ifAbsentPut: [ OgRequisition forClient: self ].
]
