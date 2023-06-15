Class {
	#name : #OgMunisAccountImporter,
	#superclass : #MACSVTwoStageImporter,
	#instVars : [
		'municipality',
		'currentYear'
	],
	#category : #'OpenGovernment-Munis'
}

{ #category : #accessing }
OgMunisAccountImporter >> addBudgetLineTo: anOgMunisAccount forExplicitYear: anInteger fromRecord: aDictionary [
	
	| fieldNamePrefix |
	fieldNamePrefix := anInteger asString, ' '.
	self
		addBudgetLineTo: anOgMunisAccount 
		forYear: anInteger 
		fromRecord: aDictionary 
		fieldNamePrefix: fieldNamePrefix
		mapping: [ :builder |
			builder
				map: fieldNamePrefix, 'REVISED BUDGET' fieldTo: #revisedDescription;
				map: fieldNamePrefix, 'ENCUMBRANCES' fieldTo: #encumbrancesDescription;
				map: fieldNamePrefix, 'ACTUAL' fieldTo: #actualDescription;
				map: fieldNamePrefix, 'AVAILABLE' fieldTo: #availableDescription;
				map: fieldNamePrefix, 'ORIGINAL BUDGET' fieldTo: #originalDescription ].
]

{ #category : #accessing }
OgMunisAccountImporter >> addBudgetLineTo: anOgMunisAccount forSymbolicYear: anInteger fromRecord: aDictionary fieldNamePrefix: aString [

	| fieldNamePrefix |
	fieldNamePrefix := aString, '_'.
	
	self
		addBudgetLineTo: anOgMunisAccount 
		forYear: anInteger 
		fromRecord: aDictionary 
		fieldNamePrefix: fieldNamePrefix
		mapping: [ :builder |
			builder
				map: fieldNamePrefix, 'REVISED_BUD' fieldTo: #revisedDescription;
				map: fieldNamePrefix, 'ENCUMB' fieldTo: #encumbrancesDescription;
				map: fieldNamePrefix, 'MEMO_BAL' fieldTo: #actualDescription;
				map: fieldNamePrefix, 'REMAIN_BUD' fieldTo: #availableDescription;
				map: fieldNamePrefix, 'ORIGINAL_BUD' fieldTo: #originalDescription ].
]

{ #category : #accessing }
OgMunisAccountImporter >> addBudgetLineTo: anOgMunisAccount forYear: anInteger fromRecord: aDictionary fieldNamePrefix: aString mapping: mapBlock [

	| yearDict line |
	yearDict := aDictionary associationsSelect: [ :assoc |
		assoc key beginsWith: aString ].
		
	line := OgMunisBudgetLine new
		year: anInteger;
		yourself.
		
	self 
		initializeDomainObject: line
		fromRecord: yearDict
		mapping: mapBlock.
		
	anOgMunisAccount addBudgetLine: line
]

{ #category : #accessing }
OgMunisAccountImporter >> convertToDomainObjects: aCollectionOfDictionaries [
	^ aCollectionOfDictionaries 
		collect: [ :rowDict | 
			| account |
			account := OgMunisAccount ofMunicipality: self municipality.
			
			self 
				initializeDomainObject: account
				fromRecord: rowDict
				mapping: [ :builder |
					builder
						map: 'ORG' 
							fieldTo: #organizationDescription 
							using: [ :trimmed | self municipality munis organizations detect: [ :org | org code = trimmed ] ];
						map: 'OBJECT' 
							fieldTo: #objectDescription 
							using: [ :trimmed | self municipality munis objects detect: [ :org | org code = trimmed ] ];
						map: 'PROJECT' 
							fieldTo: #projectDescription 
							using: [ :trimmed | self municipality munis projects detect: [ :org | org code = trimmed ] ] ].
				
			self 
				initializeBudgetLinesFor: account
				fromRecord: rowDict.
				
			account ] 
]

{ #category : #accessing }
OgMunisAccountImporter >> currentYear [
	^ currentYear
]

{ #category : #accessing }
OgMunisAccountImporter >> currentYear: anObject [
	currentYear := anObject
]

{ #category : #accessing }
OgMunisAccountImporter >> initializeBudgetLinesFor: anOgMunisAccount fromRecord: aDictionary [
	
	| explicitlyNamedPriorYears |
		
	self 
		addBudgetLineTo: anOgMunisAccount 
			forSymbolicYear: self currentYear + 1 
			fromRecord: aDictionary 
			fieldNamePrefix: 'NY';
		addBudgetLineTo: anOgMunisAccount 
			forSymbolicYear: self currentYear 
			fromRecord: aDictionary 
			fieldNamePrefix: 'CY';
		addBudgetLineTo: anOgMunisAccount 
			forSymbolicYear: self currentYear - 1 
			fromRecord: aDictionary 
			fieldNamePrefix: 'LY'.
			
	explicitlyNamedPriorYears := aDictionary keys asSet
		select: [ :e | e first isDigit ]
		thenCollect: #squeezeOutNumber.
	
	explicitlyNamedPriorYears do: [ :year |
		self addBudgetLineTo: anOgMunisAccount 
			forExplicitYear: year 
			fromRecord: aDictionary ]
]

{ #category : #accessing }
OgMunisAccountImporter >> municipality [
	^ municipality
]

{ #category : #accessing }
OgMunisAccountImporter >> municipality: anObject [
	municipality := anObject
]
