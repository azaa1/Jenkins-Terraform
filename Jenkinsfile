pipeline {
  stages{

    stage("Pull Repo"){
      steps{
        git "https://github.com/azaa1/Jenkins-Terraform.git"
      }
    }

    stage("Run pwd"){
      steps{
        sh "cd ${workspace}"
        sh "pwd"
      }
    }

    stage("Run whoami"){
      steps{
        sh "cd ${workspace}"
        sh "whoami"
      }
    }

    stage("Interactive_Input"){
      steps{
        script{

           def userInput
   try {
      userInput = input(
          id: 'Proceed1', message: 'Was this successful?', parameters: [
          [$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Please confirm you agree with this']
          ])
    } catch(err) { // input false
       def user = err.getCauses()[0].getUser()
       userInput = false
       echo "Aborted by: [${user}]"
    }

    node {
       if (userInput == true) {
          // do something
          echo "this was successful"
      } else {
          // do something else
          echo "this was not successful"
          currentBuild.result = 'FAILURE'
      }
   }
          }
        }
      }
  }
}
