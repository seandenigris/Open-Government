Extension { #name : #PpProject }

{ #category : #'*OpenGovernment' }
PpProject >> requisition [

	| newReq |
	
	self
		propertyAt: #requisition
		ifPresent: [ :aReq | ^ aReq ].

	newReq := self newRequisition import.
	self supportMaterials add: newReq.

	^ self
		propertyAt: #requisition
		put: newReq
]
