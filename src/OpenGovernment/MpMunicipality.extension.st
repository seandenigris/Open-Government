Extension { #name : #MpMunicipality }

{ #category : #'*OpenGovernment' }
MpMunicipality >> munis [

	^ OgMunis uniqueInstance
		municipality: self;
		yourself
]

{ #category : #'*OpenGovernment' }
MpMunicipality >> payPeriods [

	^ self
		propertyAt: #payPeriods
		ifAbsentPut: [ OrderedCollection new ]
]
