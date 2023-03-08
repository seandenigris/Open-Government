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
		'objects',
		'projects'
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
OgMunis >> importAccountsFromCSV: aResourceable [
]

{ #category : #'as yet unclassified' }
OgMunis >> objectWithCode: aString [ 
	
	^ self objects detect: [ :obj | obj code = aString ]
]

{ #category : #accessing }
OgMunis >> objects [
	^ objects
]

{ #category : #accessing }
OgMunis >> objects: anObject [
	objects := anObject
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
