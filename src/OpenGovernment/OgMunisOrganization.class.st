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
