Extension { #name : 'MAElementDescription' }

{ #category : '*OpenGovernment-NYSenate' }
MAElementDescription >> descriptionOgParameterType [
	"<magritteDescription>"
	^ MAStringDescription new
		accessor: #ogParameterType;
		label: 'OG Parameter Type';
		priority: 100;
		yourself
]

{ #category : '*OpenGovernment-NYSenate' }
MAElementDescription >> ogBeRequiredParameter [
	self propertyAt: #parameterType put: 'required'
]
