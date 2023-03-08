Class {
	#name : #BaselineOfOpenGovernment,
	#superclass : #BaselineOf,
	#category : #BaselineOfOpenGovernment
}

{ #category : #baselines }
BaselineOfOpenGovernment >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec
			baseline: 'ExternalWebBrowser' with: [
				spec repository: 'github://seandenigris/Pharo-Web-Browser' ];
			baseline: 'Magritte' with: [
				spec repository: 'github://seandenigris/Magritte' ];
			baseline: 'Mocketry' with: [
				spec repository: 'github://dionisiydk/Mocketry' ];
			baseline: 'PharoEnhancements' with: [
				spec repository: 'github://seandenigris/Pharo-Enhancements' ];
			baseline: 'SimplePersistence' with: [
				spec repository: 'github://seandenigris/Simple-Persistence' ].
		spec package: #OpenGovernment with: [
				spec requires: #('ExternalWebBrowser' 'Mocketry' 'PharoEnhancements' 'SimplePersistence'). ]. ]
]
