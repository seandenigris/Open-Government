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
			baseline: 'LivingLibrary' with: [
				spec repository: 'github://seandenigris/Living-Library' ];
			baseline: 'Magritte' with: [
				spec repository: 'github://seandenigris/Magritte' ];
			baseline: 'Mocketry' with: [
				spec repository: 'github://dionisiydk/Mocketry' ];
			baseline: 'MyPeople' with: [
				spec repository: 'github://SeanDeNigris/My-People' ];
			baseline: 'PharoEnhancements' with: [
				spec repository: 'github://seandenigris/Pharo-Enhancements' ];
			baseline: 'SimplePersistence' with: [
				spec repository: 'github://seandenigris/Simple-Persistence' ];
			baseline: 'TheProjectProject' with: [
				spec repository: 'github://seandenigris/The-Project-Project' ].
		spec package: #OpenGovernment with: [
				spec requires: #('ExternalWebBrowser' 'LivingLibrary' 'Mocketry' 'MyPeople' 'PharoEnhancements' 'SimplePersistence' 'TheProjectProject'). ]. ]
]
