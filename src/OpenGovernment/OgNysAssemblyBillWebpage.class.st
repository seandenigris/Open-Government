Class {
	#name : #OgNysAssemblyBillWebpage,
	#superclass : #Object,
	#instVars : [
		'number',
		'soup',
		'bill'
	],
	#category : #'OpenGovernment-Support'
}

{ #category : #'as yet unclassified' }
OgNysAssemblyBillWebpage class >> exampleScrape [
	
	| summaryHeader summaryRows senateBillRow sponsorRow cosponsorRow cosponsorTokens mltSponsorRow affectedLegislationRow summaryRow actionHeader actionRows committeeHeader floorHeader memoHeader textHeader lfinHeader chamberHeader |
	summaryHeader := self findTag: [ :t | t id = 'jump_to_Summary' ].
	summaryRows := summaryHeader nextSibling / #tr.
	senateBillRow := summaryRows detect: [ :t | t name = #tr and: [ t td text = 'SAME AS' ] ].
	senateBillRow a text.
	sponsorRow := summaryRows detect: [ :t | t name = #tr and: [ t td text = 'SPONSOR' ] ].
	sponsorRow children last text.
	cosponsorRow := summaryRows detect: [ :t | t name = #tr and: [ t td text = 'COSPNSR' ] ].
	cosponsorTokens := cosponsorRow children last text findTokens: ','.
	cosponsorTokens collect: #trimBoth.
	mltSponsorRow := summaryRows detect: [ :t | t name = #tr and: [ t td text = 'MLTSPNSR' ] ].
	mltSponsorRow children last text.
	affectedLegislationRow := summaryRows at: 11.
	affectedLegislationRow text.
	summaryRow := summaryRows at: 13.
	summaryRow text.
	actionHeader := self findTag: [ :t | t id = 'jump_to_Actions' ].
	actionRows := actionHeader nextSibling / #tr.
	actionRows := actionRows allButFirst: 2.
	committeeHeader := self findTag: [ :t | t id = 'jump_to_Committee&nbspVotes' ].
	floorHeader := self findTag: [ :t | t id = 'jump_to_Floor&nbspVotes' ].
	memoHeader := self findTag: [ :t | t id = 'jump_to_Memo' ].
	memoHeader nextSibling.
	textHeader := self findTag: [ :t | t id = 'jump_to_Text' ].
	textHeader nextSibling.
	lfinHeader := self findTag: [ :t | t id = 'jump_to_LFIN' ].
	lfinHeader nextSibling.
	chamberHeader := self findTag: [ :t | t id = 'jump_to_Chamber&nbspVideo/Transcript' ].
	chamberHeader nextSibling
]

{ #category : #'instance creation' }
OgNysAssemblyBillWebpage class >> for: bill [
	^ self new
			bill: bill;
			yourself
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> actions [
	<billField>
	| actionHeader actionRows |
	actionHeader := self soup findTag: [ :t | t id = 'jump_to_Actions' ].
	actionRows := actionHeader nextSibling / #tr.
	self assert: actionRows second text = '&nbsp;/td>'.
	actionRows := actionRows allButFirst: 2.
	"actionRows / [ :t | t name = #td and: [  ] ]"
	^ actionRows collect: [ :r | r td text asDate -> r children last text ] as: OrderedCollection
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> affectedLegislation [
	<billField>
	| affectedLegislationRow |
	affectedLegislationRow := self summaryRows at: 11.
	^ affectedLegislationRow text.
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> bill [
	^ bill
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> bill: aBill [
	bill := aBill
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> chamber [
	<billField>
	| chamberHeader clickHandler linkParser urlString links |
	chamberHeader := self soup findTag: [ :t | t id = 'jump_to_Chamber&nbspVideo/Transcript' ].
	links := chamberHeader nextSibling // #a.
	^ links collect: [ :a |
			clickHandler := a @ #onclick.
			linkParser := 'window.open(''' asParser, $' asParser negate plus flatten ==> #second.
			urlString := linkParser parse: clickHandler.
			urlString asUrl ] as: OrderedCollection
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> committeeVotes [
	<billField>
	| committeeHeader committeeInfo voteCells voteTables |
	committeeHeader := self soup findTag: [ :t | t id = 'jump_to_Committee&nbspVotes' ].
	committeeHeader nextSibling asString = '<pre></pre>' ifTrue: [ ^ nil ].
	voteTables := committeeHeader nextSibling / #table.
	^ voteTables collect: [ :tbl |
			| commVote |
			committeeInfo := tbl caption text.
			commVote := OgCommitteeHeaderParser parse: committeeInfo.
			voteCells := (committeeHeader nextSibling // #td) reject: [ :t | t text isEmpty ].
			voteCells pairsDo: [ :member :vote | commVote record: member text trim voted: vote text trim ].
			commVote ]
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> cosponsors [
	<billField>
	| cosponsorRow cosponsorTokens |
	cosponsorRow := self summaryRows detect: [ :t | t name = #tr and: [ t td text = 'COSPNSR' ] ].
	cosponsorTokens := cosponsorRow children last text findTokens: ','.
	^ cosponsorTokens collect: #trimBoth.
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> floorVotes [
	<billField>
	| floorHeader voteTables |
	floorHeader := self soup findTag: [ :t | t id = 'jump_to_Floor&nbspVotes' ].
	voteTables := floorHeader nextSibling // #table.
	
	voteTables ifEmpty: [ ^ nil ].
	
	^ voteTables collect: [ :tbl |
			| spans floorVote voteCells |
			spans := tbl caption / #span.
			self assert: spans first text = 'DATE:'.
			self assert: (spans fifth text trimLeft beginsWith: 'YEA/NAY').
			floorVote := OgFloorVote new
				date: spans second text asDate;
				description: spans third text, ' ', spans fourth text;
				yourself.
			voteCells := tbl // #td reject: [ :td | td text isEmpty ].
			voteCells pairsDo: [ :member :vote | floorVote record: member text trim voted: vote text trim ].
			floorVote ] as: OrderedCollection.
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> lfin [
	| lfinHeader |
	lfinHeader := self soup findTag: [ :t | t id = 'jump_to_LFIN' ].
	self assert: lfinHeader nextSibling text = '&nbsp;/td>NO LFIN'.
	^ nil"lfinHeader nextSibling."
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> memo [
	<billField>
	| memoHeader |
	memoHeader := self soup findTag: [ :t | t id = 'jump_to_Memo' ].
	^ memoHeader nextSibling asString.
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> mltSponsors [
	<billField>
	| mltSponsorRow mltSponsorTokens |
	mltSponsorRow := self summaryRows detect: [ :t | t name = #tr and: [ t td text = 'MLTSPNSR' ] ].
	mltSponsorTokens := mltSponsorRow children last text findTokens: ','.
	^ mltSponsorTokens collect: #trimBoth.
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> push [
	| fields |
	fields := Pragma allNamed: #billField in: self class.
	fields do: [ :e |
		| value setter |
		value := self perform: e methodSelector.
		setter := (e methodSelector, #':') asSymbol.
		self bill perform: setter with: value ]
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> senateBill [
	<billField>
	| senateBillRow |
	senateBillRow := self summaryRows detect: [ :t | t name = #tr and: [ t td text = 'SAME AS' ] ].
	^ (senateBillRow / #td) last text = 'No Same As'
			ifTrue: [ nil ]
			ifFalse: [ senateBillRow a text ]
]

{ #category : #private }
OgNysAssemblyBillWebpage >> soup [
	^ soup ifNil: [ soup := Soup fromUrl: self url ]
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> sponsor [
	<billField>
	| sponsorRow |
	sponsorRow := self summaryRows detect: [ :t | t name = #tr and: [ t td text = 'SPONSOR' ] ].
	^ sponsorRow children last text.
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> summary [
	<billField>
	| summaryRow |
	summaryRow := self summaryRows at: 13.
	^ summaryRow text.
]

{ #category : #private }
OgNysAssemblyBillWebpage >> summaryRows [
	| summaryHeader |
	summaryHeader := self soup findTag: [ :t | t id = 'jump_to_Summary' ].
	^ summaryHeader nextSibling / #tr.
]

{ #category : #accessing }
OgNysAssemblyBillWebpage >> text [
	<billField>
	| textHeader |
	textHeader := self soup findTag: [ :t | t id = 'jump_to_Text' ].
	^ textHeader nextSibling asString.
]

{ #category : #private }
OgNysAssemblyBillWebpage >> url [
	| template urlString |
	template := 'http://nyassembly.gov/leg/?default_fld=&leg_video=&bn={billNumber}&term={term}&Summary=Y&Actions=Y&Committee%26nbspVotes=Y&Floor%26nbspVotes=Y&Memo=Y&Text=Y&LFIN=Y&Chamber%26nbspVideo%2FTranscript=Y'.
	urlString := template format: { 
		#billNumber -> self bill number asString.
		#term -> self bill term asString } asDictionary.
	^ urlString asUrl
]
