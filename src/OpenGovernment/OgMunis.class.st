"
# Initial Setup

The easiest way to populate the data is via Munis CSV exports. Here is a sample script for inspiration.
```smalltalk
munis := OgMunis uniqueInstance.
exportFolder := FileLocator imageDirectory / 'Munis'.

objects := OgMunisObject allFromCSV: exportFolder / 'objects.csv'.
munis objects: objects.

projects := OgMunisProject allFromCSV: exportFolder / 'projects.csv'.
munis projects: projects.

organizations := OgMunisProject allFromCSV: exportFolder / 'organizations.csv'.
munis projects: organizations.

accountFiles := exportFolder / 'accounts' filesMatching: '*.csv'. 

accounts := accountFiles flatCollect: [ :file |
	OgMunisAccountImporter new
		source: file;
		execute ].
		
munis accounts: accounts
```
"
Class {
	#name : #OgMunis,
	#superclass : #Object,
	#instVars : [
		'accounts',
		'organizations',
		'projects',
		'municipality',
		'allObjects'
	],
	#classVars : [
		'UniqueInstance'
	],
	#category : #'OpenGovernment-Munis'
}

{ #category : #persistence }
OgMunis class >> restoreFrom: anObject [
	UniqueInstance := anObject
]

{ #category : #persistence }
OgMunis class >> spData [
	^ UniqueInstance.
]

{ #category : #accessing }
OgMunis class >> uniqueInstance [
	^ UniqueInstance ifNil: [ UniqueInstance := self new ]
]

{ #category : #accessing }
OgMunis class >> uniqueInstance: anObject [
	^ UniqueInstance := anObject
]

{ #category : #accessing }
OgMunis >> accounts [
	^ accounts
]

{ #category : #accessing }
OgMunis >> accounts: anObject [
	accounts := anObject
]

{ #category : #accessing }
OgMunis >> accountsGtViewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Accounts';
		priority: 50;
		items: [ self accounts ];
		actionUpdateButtonTooltip: 'Update item list';
		column: 'Account' 
			text: #displayString
			width: 500;
			withHorizontalScrolling";
		column: 'Description' 
			text: #description".
]

{ #category : #accessing }
OgMunis >> accountsSearchFor: aSearch [
	<gtSearch>
	
	^ aSearch list
		priority: 100;
		title: 'Accounts';
		items: [ self accounts ];
		itemName: #displayString;
		matchSubstrings;
		yourself
]

{ #category : #accessing }
OgMunis >> importAccountsFromCSV: aResourceable [
]

{ #category : #accessing }
OgMunis >> municipality [
	^ municipality
]

{ #category : #accessing }
OgMunis >> municipality: anObject [
	municipality := anObject
]

{ #category : #'as yet unclassified' }
OgMunis >> objectWithCode: aString [ 
	
	^ self objects detect: [ :obj | obj code = aString ]
]

{ #category : #accessing }
OgMunis >> objects [
	^ allObjects select: [ :obj | self accounts anySatisfy: [ :act | act object = obj ] ]
]

{ #category : #accessing }
OgMunis >> objects: anObject [
	allObjects := anObject
]

{ #category : #accessing }
OgMunis >> objectsGtViewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Objects';
		priority: 60;
		items: [ self objects ];
		actionUpdateButtonTooltip: 'Update item list';
		column: 'Code' 
			text: #code
			width: 45;
		column: 'Description' 
			text: #description.
]

{ #category : #accessing }
OgMunis >> objectsSearchFor: aSearch [
	<gtSearch>
	
	^ aSearch list
		priority: 300;
		title: 'Objects';
		items: [ self objects ];
		matchSubstrings;
		yourself
]

{ #category : #'as yet unclassified' }
OgMunis >> organizationWithCode: aString [ 
	
	^ self organizations detect: [ :org | org code = aString ]
]

{ #category : #accessing }
OgMunis >> organizations [
	^ organizations
]

{ #category : #accessing }
OgMunis >> organizations: anObject [
	organizations := anObject
]

{ #category : #accessing }
OgMunis >> organizationsGtViewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Organizations';
		priority: 50;
		items: [ self organizations ];
		actionUpdateButtonTooltip: 'Update item list';
		column: 'Code' 
			text: #code
			width: 45;
		column: 'Description' 
			text: #description.
]

{ #category : #accessing }
OgMunis >> organizationsSearchFor: aSearch [
	<gtSearch>
	
	^ aSearch list
		priority: 200;
		title: 'Organizations';
		items: [ self organizations ];
		matchSubstrings;
		yourself
]

{ #category : #'as yet unclassified' }
OgMunis >> projectWithCode: aString [ 
	
	^ self projects detect: [ :project | project code = aString ]
]

{ #category : #accessing }
OgMunis >> projects [
	^ projects
]

{ #category : #accessing }
OgMunis >> projects: anObject [
	projects := anObject
]

{ #category : #accessing }
OgMunis >> projectsGtViewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Projects';
		priority: 70;
		items: [ self projects ];
		actionUpdateButtonTooltip: 'Update item list';
		column: 'Code' 
			text: #code
			width: 45;
		column: 'Description' 
			text: #description.
]

{ #category : #accessing }
OgMunis >> projectsSearchFor: aSearch [
	<gtSearch>
	
	^ aSearch list
		priority: 400;
		title: 'Projects';
		items: [ self projects ];
		matchSubstrings;
		yourself
]
