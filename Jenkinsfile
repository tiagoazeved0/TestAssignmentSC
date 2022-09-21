pipeline {
	agent any
    stages{
        stage("Prepare") {
            steps{
			script {
			
			UI = UI.toBoolean()
			API = API.toBoolean()
			// API_KEY = <YOUR_API_KEY>
			// PROFILE_ID = <YOUR_PROFILE_ID> - This is meant to be used for Calliope.Pro Integration in a future feature.
			
			}
                checkout([$class: 'GitSCM', 
                branches: [[name: 'master']], 
                extensions: [[$class: 'GitLFSPull'], [$class: 'AuthorInChangelog']], 
                userRemoteConfigs: [[credentialsId: 'GitHub', url: 'https://github.com/tiagoazeved0/TestAssignmentSC.git']]])
            }
        }
		stage("Test") {	
			steps{
				script{
				bat "mvn clean"
				if (UI && API) {
								bat "mvn test -Dtest=AllFeaturesRunner"				
				} else if (UI) {
								bat "mvn test -Dtest=UITestsRunner"	
				} else if (API) {
								bat "mvn test -Dtest=APITestsRunner"	
				}
				}
				
			}
		}
    }  
}
