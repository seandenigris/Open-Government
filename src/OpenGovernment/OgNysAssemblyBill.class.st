Class {
	#name : #OgNysAssemblyBill,
	#superclass : #OgBill,
	#instVars : [
		'actions',
		'affectedLegislation',
		'chamber',
		'committeeVotes',
		'cosponsors',
		'mltSponsors',
		'floorVotes',
		'memo',
		'senateBill',
		'sponsor',
		'text',
		'summary'
	],
	#category : #OpenGovernment
}

{ #category : #accessing }
OgNysAssemblyBill class >> number: aNumber [
	^ self new
			number: aNumber;
			pull;
			yourself
]

{ #category : #accessing }
OgNysAssemblyBill class >> number: aNumber term: yearConvertible [
	^ self new
			number: aNumber;
			term: yearConvertible asYear
			yourself
]

{ #category : #accessing }
OgNysAssemblyBill >> actions [
	^ actions
]

{ #category : #accessing }
OgNysAssemblyBill >> actions: anObject [
	actions := anObject
]

{ #category : #accessing }
OgNysAssemblyBill >> affectedLegislation [
	^ affectedLegislation
]

{ #category : #accessing }
OgNysAssemblyBill >> affectedLegislation: anObject [
	affectedLegislation := anObject
]

{ #category : #accessing }
OgNysAssemblyBill >> chamber [
	^ chamber
]

{ #category : #accessing }
OgNysAssemblyBill >> chamber: anObject [
	chamber := anObject
]

{ #category : #accessing }
OgNysAssemblyBill >> committeeVotes [
	^ committeeVotes
]

{ #category : #accessing }
OgNysAssemblyBill >> committeeVotes: anObject [
	committeeVotes := anObject
]

{ #category : #accessing }
OgNysAssemblyBill >> cosponsors [
	^ cosponsors
]

{ #category : #accessing }
OgNysAssemblyBill >> cosponsors: anObject [
	cosponsors := anObject
]

{ #category : #accessing }
OgNysAssemblyBill >> floorVotes [
	^ floorVotes
]

{ #category : #accessing }
OgNysAssemblyBill >> floorVotes: anObject [
	floorVotes := anObject
]

{ #category : #accessing }
OgNysAssemblyBill >> memo [
	^ memo
]

{ #category : #accessing }
OgNysAssemblyBill >> memo: anObject [
	memo := anObject
]

{ #category : #accessing }
OgNysAssemblyBill >> mltSponsors [
	^ mltSponsors
]

{ #category : #accessing }
OgNysAssemblyBill >> mltSponsors: anObject [
	mltSponsors := anObject
]

{ #category : #accessing }
OgNysAssemblyBill >> number [
	^ number
]

{ #category : #accessing }
OgNysAssemblyBill >> number: anObject [
	number := anObject
]

{ #category : #accessing }
OgNysAssemblyBill >> numberString [
	^ 'A', (self number printStringPadded: 5)
]

{ #category : #printing }
OgNysAssemblyBill >> printOn: aStream [
	aStream 
		nextPutAll: 'NYS Bill ';
		nextPutAll: self numberString;
		nextPutAll: ' of ';
		print: term start year
]

{ #category : #'as yet unclassified' }
OgNysAssemblyBill >> pull [
	self webPage push
]

{ #category : #accessing }
OgNysAssemblyBill >> senateBill [
	^ senateBill
]

{ #category : #accessing }
OgNysAssemblyBill >> senateBill: anObject [
	senateBill := anObject
]

{ #category : #accessing }
OgNysAssemblyBill >> senateUrl [
	| baseUrl |
	baseUrl := 'https://www.nysenate.gov/legislation/bills' asUrl.
	^ baseUrl / self term start year asString / ('a', self number asString)
]

{ #category : #accessing }
OgNysAssemblyBill >> sponsor [
	^ sponsor
]

{ #category : #accessing }
OgNysAssemblyBill >> sponsor: anObject [
	sponsor := anObject
]

{ #category : #accessing }
OgNysAssemblyBill >> summary [
	^ summary
]

{ #category : #accessing }
OgNysAssemblyBill >> summary: anObject [
	summary := anObject
]

{ #category : #accessing }
OgNysAssemblyBill >> text [
	^ text
]

{ #category : #accessing }
OgNysAssemblyBill >> text: anObject [
	text := anObject
]

{ #category : #accessing }
OgNysAssemblyBill >> url [
	| template urlString |
	template := 'http://nyassembly.gov/leg/?default_fld=&leg_video=&bn={billNumber}&term={term}&Summary=Y&Actions=Y&Committee%26nbspVotes=Y&Floor%26nbspVotes=Y&Memo=Y&Text=Y&LFIN=Y&Chamber%26nbspVideo%2FTranscript=Y'.
	urlString := template format: { 
		#term -> self term start year.
		#billNumber -> self number } asDictionary.
	^ urlString asUrl
]

{ #category : #accessing }
OgNysAssemblyBill >> viewWebpage [
	self url open.
	
]

{ #category : #'as yet unclassified' }
OgNysAssemblyBill >> webPage [
	^ OgNysAssemblyBillWebpage for: self
]
