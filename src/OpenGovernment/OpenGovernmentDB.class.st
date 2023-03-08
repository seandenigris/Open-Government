Class {
	#name : #OpenGovernmentDB,
	#superclass : #SpFileDatabase,
	#category : 'OpenGovernment-Persistence'
}

{ #category : #accessing }
OpenGovernmentDB class >> backupDirectoryParent [
	"Re-write this if you'd like your backups to be saved in a location other than the image folder"
	^ FileLocator home / 'Dynabook' / 'User Data'
]

{ #category : #'loading/saving' }
OpenGovernmentDB class >> schema [

	^ { 
		OgBill.
		OgCoogOpinion.
		OgMunis }.
]
