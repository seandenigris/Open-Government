Extension { #name : #MpMunicipality }

{ #category : #'*OpenGovernment' }
MpMunicipality >> munis [

	^ OgMunis uniqueInstance
		municipality: self;
		yourself
]
