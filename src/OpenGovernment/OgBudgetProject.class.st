Class {
	#name : #OgBudgetProject,
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
OgBudgetProject >> account: aMunisAccount [

	self
		propertyAt: #munisAccount
		putRemovingNil: aMunisAccount
]

{ #category : #accessing }
OgBudgetProject >> accounts [

	| result |
	result := (self budgetRequests collect: #account) asIdentitySet.
	self rootOperatingChildren do: [ :e | result addAll: e accounts ].
	^ result
]

{ #category : #accessing }
OgBudgetProject >> accountsGtViewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Accounts';
		priority: 40;
		items: [ self accounts ];
		actionUpdateButtonTooltip: 'Update item list';
		column: 'Account' 
			text: #displayString
			width: 500;
		inspectButtonFor: [ self accounts ].
]

{ #category : #accessing }
OgBudgetProject >> addBudgetRequest: aBudgetRequest [

	aBudgetRequest ppProjectBasic: self.
	^ self budgetRequests add: aBudgetRequest.
]

{ #category : #accessing }
OgBudgetProject >> addPurchaseOrder: aPurchaseOrder [

	aPurchaseOrder ppProjectBasic: self.
	^ self purchaseOrders add: aPurchaseOrder.
]

{ #category : #accessing }
OgBudgetProject >> budgetRequests [
	^ budgetRequests ifNil: [ budgetRequests := OrderedCollection new ]
]

{ #category : #'GT Views' }
OgBudgetProject >> budgetRequests: anObject [
	budgetRequests := anObject
]

{ #category : #accessing }
OgBudgetProject >> budgetRequestsDescription [
	<magritteDescription>
	
	^ MAToManyRelationDescription new
		accessor: #budgetRequests;
		gtSearchDelegateTo: (MessageSend receiver: self selector: #munis) message: #budgetRequestsSearchFor;
		classes: OgMunisBudgetAccountRequest withAllSubclasses;
		yourself
]

{ #category : #'GT Views' }
OgBudgetProject >> budgetRequestsGtViewFor: aView [
	<gtView>
	^ (OgMunisBudgetAccountRequest gtViewOf: self for: aView)
		priority: 7
]

{ #category : #accessing }
OgBudgetProject >> import [

	self class parent ensureChild: self
]

{ #category : #accessing }
OgBudgetProject >> importDescription [
	<magritteActionDescription>
	^ MAActionDescription new
		gtIcon: BrGlamorousVectorIcons down;
		comment: 'Import into Singleton Library';
		action: #import;
		enableBlock: [ :proj | self class parent isNotNil ];
		yourself
]

{ #category : #accessing }
OgBudgetProject >> munis [

	^ OgMunis uniqueInstance
]

{ #category : #accessing }
OgBudgetProject >> ogIsBudgetary [

	^ true
]

{ #category : #accessing }
OgBudgetProject >> purchaseOrders [
	^ purchaseOrders ifNil: [ purchaseOrders := OrderedCollection new ]
]

{ #category : #accessing }
OgBudgetProject >> purchaseOrders: anObject [
	purchaseOrders := anObject
]

{ #category : #accessing }
OgBudgetProject >> purchaseOrdersDescription [
	<magritteDescription>
	
	^ MAToManyRelationDescription new
		accessor: #purchaseOrders;
		gtSearchDelegateTo: (MessageSend receiver: self selector: #munis) message: #purchaseOrdersSearchFor:;
		classes: OgMunisPurchaseOrder withAllSubclasses;
		yourself
]

{ #category : #'GT Views' }
OgBudgetProject >> purchaseOrdersGtViewFor: aView [
	<gtView>
	
	^ OgMunisPurchaseOrder gtViewOn: self for: aView priority: 8
]

{ #category : #accessing }
OgBudgetProject >> rootBudgetaryChildren [
	^ self rootChildren select: #ogIsBudgetary
]
