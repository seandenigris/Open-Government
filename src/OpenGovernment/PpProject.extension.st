Extension { #name : #PpProject }

{ #category : #'*OpenGovernment' }
PpProject >> ogBidSpec [

	^ self 
		propertyAt: #bidSpec 
		ifAbsentPut:OgBidSpec new.
]

{ #category : #'*OpenGovernment' }
PpProject >> ogTravelRequest [

	^ self
		propertyAt: #travelRequest
		ifAbsentPut: [ OgTravelRequest defaultClass forClient: self ].
]

{ #category : #'*OpenGovernment' }
PpProject >> requisition [

	^ self
		propertyAt: #requisition
		ifAbsentPut: [ OgRequisition forClient: self ].
]
