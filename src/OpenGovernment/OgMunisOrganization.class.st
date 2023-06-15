Class {
	#name : #OgMunisOrganization,
	#superclass : #OgMunisEntity,
	#category : #'OpenGovernment-Munis'
}

{ #category : #accessing }
OgMunisOrganization >> accounts [

	^ self munis accounts select: [ :acct |
		acct organization = self ]
]

{ #category : #accessing }
OgMunisOrganization >> accountsGtViewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Accounts';
		priority: 50;
		items: [ self accounts ];
		column: 'Organization' 
			text: #organization;
		column: 'Object' 
			text: #object;
		column: 'Project' 
			text: [ :acct | acct projectDisplayString ];
		actionUpdateButtonTooltip: 'Update item list'
]

{ #category : #accessing }
OgMunisOrganization >> exportAccountsToCSV [

	^ OgMunisAccount exportToCSVAllAccounts: self accounts
]

{ #category : #accessing }
OgMunisOrganization >> objects [

	^ self accounts collectAsSet: #object
]

{ #category : #accessing }
OgMunisOrganization >> objectsGtViewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Objects';
		priority: 60;
		items: [ self objects asSortedCollection: #code ascending ];
		actionUpdateButtonTooltip: 'Update item list';
		column: 'Code' 
			text: #code
			width: 45;
		column: 'Description' 
			text: #description.
]

{ #category : #accessing }
OgMunisOrganization >> projects [

	^ self accounts asSet
		collect: #project
		thenSelect: #isNotNil
]

{ #category : #accessing }
OgMunisOrganization >> projectsGtViewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Projects';
		priority: 70;
		items: [ self projects asSortedCollection: #code ascending ];
		actionUpdateButtonTooltip: 'Update item list';
		column: 'Code' 
			text: #code
			width: 45;
		column: 'Description' 
			text: #description.
]
