pipeline {
	agent any
    stages{
        stage("Prepare") {
            steps{
			script {
			
			UI = UI.toBoolean()
			API = API.toBoolean()
			API_KEY = "Yzc1OWQ4YTU1ZGZiYjkwNWUxYmIzMWM4ZjI1YjcwN2E4MGIwZWMyZmNkYjBkZjE4MWI4NGE5NzJmNjIxMTMxNjBi"
			PROFILE_ID = "4497"
			
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