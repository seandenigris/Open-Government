Class {
	#name : #OgOperatingProject,
	#superclass : #PpProject,
	#instVars : [
		'budgetRequests',
		'purchaseOrders'
	],
	#classVars : [
		'Parent'
	],
	#category : #'OpenGovernment-Budgeting'
}

{ #category : #accessing }
OgOperatingProject class >> parent [
	^ Parent
]

{ #category : #accessing }
OgOperatingProject class >> parent: anObject [
	Parent := anObject
]

{ #category : #persistence }
OgOperatingProject class >> restoreFrom: anObject [
	Parent := anObject
]

{ #category : #persistence }
OgOperatingProject class >> spData [
	^ Parent
]

{ #category : #accessing }
OgOperatingProject >> account: aMunisAccount [

	self
		propertyAt: #munisAccount
		putRemovingNil: aMunisAccount
]

{ #category : #accessing }
OgOperatingProject >> accounts [

	| result |
	result := (self budgetRequests collect: #account) asIdentitySet.
	self rootOperatingChildren do: [ :e | result addAll: e accounts ].
	^ result
]

{ #category : #accessing }
OgOperatingProject >> accountsGtViewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Accounts';
		priority: 9;
		items: [ self accounts asOrderedCollection ];
		actionUpdateButton;
		column: 'Account' 
			text: #displayString
			width: 500;
		inspectButtonFor: [ self accounts asOrderedCollection ].
]

{ #category : #accessing }
OgOperatingProject >> addBudgetRequest: aBudgetRequest [

	aBudgetRequest ppProjectBasic: self.
	^ self budgetRequests add: aBudgetRequest.
]

{ #category : #accessing }
OgOperatingProject >> addPurchaseOrder: aPurchaseOrder [

	aPurchaseOrder ppProjectBasic: self.
	^ self purchaseOrders add: aPurchaseOrder.
]

{ #category : #accessing }
OgOperatingProject >> budgetRequests [
	^ budgetRequests ifNil: [ budgetRequests := OrderedCollection new ]
]

{ #category : #accessing }
OgOperatingProject >> budgetRequests: anObject [
	budgetRequests := anObject
]

{ #category : #accessing }
OgOperatingProject >> budgetRequestsDescription [
	<magritteDescription>
	
	^ MAToManyRelationDescription new
		accessor: #budgetRequests;
		gtSearchDelegateTo: (MessageSend receiver: self selector: #munis) message: #budgetRequestsSearchFor;
		classes: OgMunisBudgetAccountRequest withAllSubclasses;
		yourself
]

{ #category : #'GT Views' }
OgOperatingProject >> budgetRequestsGtViewFor: aView [
	<gtView>
	^ (OgMunisBudgetAccountRequest gtViewOf: self for: aView)
		priority: 7
]

{ #category : #accessing }
OgOperatingProject >> import [

	self class parent ensureChild: self
]

{ #category : #accessing }
OgOperatingProject >> importDescription [
	<magritteActionDescription>
	^ MAActionDescription new
		gtIcon: BrGlamorousVectorIcons down;
		comment: 'Import into Singleton Library';
		action: #import;
		enableBlock: [ :proj | self class parent isNotNil ];
		yourself
]

{ #category : #accessing }
OgOperatingProject >> munis [

	^ OgMunis uniqueInstance
]

{ #category : #accessing }
OgOperatingProject >> ogIsBudgetary [

	^ true
]

{ #category : #accessing }
OgOperatingProject >> purchaseOrders [
	^ purchaseOrders ifNil: [ purchaseOrders := OrderedCollection new ]
]

{ #category : #accessing }
OgOperatingProject >> purchaseOrders: anObject [
	purchaseOrders := anObject
]

{ #category : #accessing }
OgOperatingProject >> purchaseOrdersDescription [
	<magritteDescription>
	
	^ MAToManyRelationDescription new
		accessor: #purchaseOrders;
		gtSearchDelegateTo: (MessageSend receiver: self selector: #munis) message: #purchaseOrdersSearchFor:;
		classes: OgMunisPurchaseOrder withAllSubclasses;
		yourself
]

{ #category : #'GT Views' }
OgOperatingProject >> purchaseOrdersGtViewFor: aView [
	<gtView>
	
	^ OgMunisPurchaseOrder gtViewOn: self for: aView priority: 8
]

{ #category : #'as yet unclassified' }
OgOperatingProject >> rootOperatingChildren [
	^ self rootChildren select: #ogIsBudgetary
]
