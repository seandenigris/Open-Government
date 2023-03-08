Class {
	#name : #NYSCitation,
	#superclass : #Object,
	#instVars : [
		'caseTitle',
		'volume',
		'report',
		'firstPage',
		'jumpPage',
		'court',
		'year'
	],
	#category : 'OpenGovernment'
}

{ #category : #'as yet unclassified' }
NYSCitation class >> PERB [
'(31 PERB ¶ 3050 [1998])'
]

{ #category : #'as yet unclassified' }
NYSCitation class >> introductorySignals [
	<sampleInstance>
	| fields |
	fields := {
			{ 'e.g.'. 2. true. nil. 'For example' }.
			{'see'. 4. true. 'https://www.law.cornell.edu/wex/see'. 'In formal legal writing, a signal indicating that the cited source clearly supports the preceding statement, even though an inference is required to draw the connection.  If the statement repeats an idea directly from the source or quotes the source, no signal is used before giving the citation.' }.
			{ 'cf'. 6. true. 'https://www.law.cornell.edu/wex/cf'. 'compare - Abbreviation for the Latin word confer, meaning "compare."  Cf. is a signal indicating that the cited source supports a different claim than the one just made, but that it is worthwhile to compare the two claims and assess the difference.  Parenthetical explanations are encouraged to explain how a cf. source relates to the text.

It is sometimes said that while a cf. source supports a different claim than the author, it should be sufficiently similar so as to lend support to the author''s claim.  However, a better explanation might be that a cf. source simply offers a different yet non-contradictory claim; actual support should not be assumed.  If the source gives a contradictory claim, a negative signal should be used.' }.
			{ 'accord'. 3. true. 'https://www.law.cornell.edu/wex/accord'. 'A signal indicating that the cited source conforms in some way to a source already identified in the author''s previous sentence.  Thus, if a participant in negotiations reported a very heated debate, an accord citation could point to a matching report from another participant.' }.
			{ 'see also'. 5. true. 'https://www.law.cornell.edu/wex/see_also'. 'In formal legal writing, a signal indicating that the cited source provides additional support for the statement after primary supporting sources have already been cited.  Thus, see also citations most appropriately follow sources that have been cited with the see signal or no signal at all.' }.
			{ 'compare with'. 7. true. 'https://www.law.cornell.edu/wex/compare_with'. 'A signal encouraging readers to compare at least two cited sources.  Comparing the sources should either support or illuminate the author''s preceding statements. 

This signal gets used as follows:  Compare [source 1] with [source 2].

Or, with more sources on each side of the comparison:  Compare [source 1] and [source 2] with [source 3] and [source 4].' }.
			{ 'contra'. 8. false. 'https://www.law.cornell.edu/wex/contra'. 'Latin, "against."  A signal indicating that the cited source directly states the opposite of whatever the author just said.  In other words, assuming an objective truth, the two claims are mutually exclusive and one must be false.' }.
			{ 'but see'. 9. false. 'https://www.law.cornell.edu/wex/but_see'. 'A signal indicating that the cited source clearly supports the opposite of whatever the author just said, although an inference is required to see the contradiction.  But see is the strongest negative signal after contra.  Whereas contra indicates a direct contradiction, but see indicates a very likely contradiction.

Note that if a but see citation follows another cited source, the but see source will be construed as contradicting the previous source - and not the statements in the present piece of writing.  Therefore, to prevent confusion, a but see citation should be converted into a see citation if it is placed after another source with a negative signal.  For more on this rule, see order of signals.' }.
			{ 'but cf.'. 10. false. nil. 'Negative of cf.' }.
			"{ 'see e.g.' }."
			{ 'see generally'. 11. true. 'https://www.law.cornell.edu/wex/see_generally'. 'A signal indicating that the cited source contains helpful background material.  In this way, a reader searching for an overview of the general topic under discussion can know a good place to look.' } }.
			
	^ fields collect: [ :e |
			NYSIntroductorySignal new
				text: e first;
				order: e second;
				isPositive: e third;
				sourceURL: e fourth;
				description: e fifth;
				yourself ]
]

{ #category : #'as yet unclassified' }
NYSCitation class >> styleGuide [
	'http://www.courts.state.ny.us/reporter/new_Styman.htm' asUrl
]

{ #category : #accessing }
NYSCitation >> caseTitle [
	^ caseTitle
]

{ #category : #accessing }
NYSCitation >> caseTitle: anObject [
	caseTitle := anObject
]

{ #category : #accessing }
NYSCitation >> court [
	^ court
]

{ #category : #accessing }
NYSCitation >> court: anObject [
	court := anObject
]

{ #category : #accessing }
NYSCitation >> firstPage [
	^ firstPage
]

{ #category : #accessing }
NYSCitation >> firstPage: anObject [
	firstPage := anObject
]

{ #category : #accessing }
NYSCitation >> jumpPage [
	^ jumpPage
]

{ #category : #accessing }
NYSCitation >> jumpPage: anObject [
	jumpPage := anObject
]

{ #category : #printing }
NYSCitation >> printString [
	| optionalJumpPage courtAndYear |
	optionalJumpPage := self jumpPage ifNil: [ '' ] ifNotNil: [ ', ', self jumpPage asString ].
	courtAndYear := self court ifNil: [ self year asString ] ifNotNil: [ :c | c, ' ', self year asString ].
	^ self printTemplate format: {
		#caseTitle -> self caseTitle.
		#volume -> self volume.
		#report -> self report.
		#firstPage -> self firstPage.
		#optionalJumpPage -> optionalJumpPage.
		#courtAndYear -> courtAndYear }.
]

{ #category : #printing }
NYSCitation >> printTemplate [
	^ '{caseTitle}, {volume} {report} {firstPage} {optionalJumpPage} [{courtAndYear}]'. "Plus history and subsequent citation. See style guide"
]

{ #category : #accessing }
NYSCitation >> report [
	^ report
]

{ #category : #accessing }
NYSCitation >> report: anObject [
	report := anObject
]

{ #category : #accessing }
NYSCitation >> volume [
	^ volume
]

{ #category : #accessing }
NYSCitation >> volume: anObject [
	volume := anObject
]

{ #category : #accessing }
NYSCitation >> year [
	^ year
]

{ #category : #accessing }
NYSCitation >> year: anObject [
	year := anObject
]
