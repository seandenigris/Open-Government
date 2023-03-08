Class {
	#name : #OgMunisAccountImporter,
	#superclass : #MACSVTwoStageImporter,
	#category : #'OpenGovernment-Munis'
}

{ #category : #accessing }
OgMunisAccountImporter >> convertToDomainObjects: aCollectionOfDictionaries [
	^ aCollectionOfDictionaries 
		collect: [ :rowDict | 
			| account |
			account := OgMunisAccount new.
			
			self 
				initializeDomainObject: account
				fromRecord: rowDict.
				
			self 
				initializeBudgetLinesFor: account
				fromRecord: rowDict.
				
			account ]
]

{ #category : #accessing }
OgMunisAccountImporter >> initializeBudgetLinesFor: anOgMunisAccount fromRecord: aDictionary [
	
	| years |
	years := aDictionary keys asSet
		select: [ :e | e first isDigit ]
		thenCollect: #squeezeOutNumber.
	
	years do: [ :year |
		| yearDict expectedDict line |
		yearDict := aDictionary associationsSelect: [ :assoc |
			assoc key beginsWith: year asString ].
		
		expectedDict := Dictionary new.
		yearDict keysAndValuesDo: [ :k :v |
			| expectedKey |
			expectedKey := k copyAfter: Character space.
			"Clean up inconsistency in field names - Encumbrances vs. Encumbrances/Requisitions"
			expectedKey := expectedKey copyUpTo: $/.
			expectedDict at: expectedKey put: v ].
			
		line := OgMunisBudgetLine new
			year: year;
			yourself.
		self 
				initializeDomainObject: line
				fromRecord: expectedDict.
				
		anOgMunisAccount addBudgetLine: line ]
]
