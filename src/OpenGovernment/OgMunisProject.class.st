Class {
	#name : #OgMunisProject,
	#superclass : #OgMunisEntity,
	#category : #'OpenGovernment-Munis'
}

{ #category : #accessing }
OgMunisProject >> printOn: aStream [

	"code ifNotNil: [ aStream << self code ].
	
	description ifNotNil: [ 
		aStream space << self description ]."
		
	aStream nextPutAll: ' ('.
	super printOn: aStream.
	aStream nextPutAll: ')'.
]
