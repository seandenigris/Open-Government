Extension { #name : #MpMunicipality }

{ #category : #'*OpenGovernment' }
MpMunicipality >> munis [

	^ OgMunis uniqueInstance
		municipality: self;
		yourself
]

{ #category : #'*OpenGovernment' }
MpMunicipality >> payPeriodEnding: aDate [

	^ self payPeriods detect: [ :period | period endDate = aDate translateToUTC ]
]

{ #category : #'*OpenGovernment' }
MpMunicipality >> payPeriods [

	^ self
		propertyAt: #payPeriods
		ifAbsentPut: [ OrderedCollection new ]
]
