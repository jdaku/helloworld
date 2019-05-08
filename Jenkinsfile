node {

	def app
	def mvnCMD = "/usr/bin/mvn"
    	def Namespace = "default"
  	def ImageName = "ravigajar/helloworld"
	def hostname = InetAddress.localHost.canonicalHostName
	def URL = "curl -sL --connect-timeout 20 --max-time 30 -w '%{http_code}\\n'  ${hostname}:30080/hello  -o /dev/null"
	try{ 
		stage('Clone repository') {
			checkout scm
		}
		stage('Mvn Compile') {	
			sh "${mvnCMD} compile "
		}
		stage('Mvn Package') {			
			sh "${mvnCMD} clean package "
		}
		stage("Build Docker Image") {
			 app = docker.build("ravigajjar/helloworld")
		}
		stage('Push image') {	
	  	         docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-creds') {
	   	         	app.push("${env.BUILD_NUMBER}")
    		        	app.push("latest")
        			}
		} 
		stage('Deploy on K8s'){
		sh "ansible-playbook ansible/deploy.yml"
		} 
		stage('Test URL') {
            		
                		sleep(time:20,unit:"SECONDS")
					sh "${URL} > commandResult"
                    			env.status = readFile('commandResult').trim()
                    			sh "echo ${env.status}"
				script {
                		
				     if (env.status == '200') {
				                echo "URL TEST OK"
                        			currentBuild.result = "SUCCESS"
                        			
                    			}
                    			else {
                    			        echo "URL TEST KO"
                        			currentBuild.result = "FAILURE"
                   			 }
            		
			}
		}
	}
      	catch (err) {
      	currentBuild.result = 'FAILURE'
  	}	
    
}
