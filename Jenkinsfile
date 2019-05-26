pipeline {
  agent any
  stages{

    stage("Pull Repo"){
      steps{
        git "https://github.com/azaa1/Jenkins-Terraform.git"
      }
    }

    stage("Set Terraform Path"){
      steps{
        script{
          def tfHome = tool name: "Terraform"
            env.PATH = "${tfHome}:${env.PATH}"
        }
      }
    }

    stage("Terraform Format"){
      steps{
        sh "cd ${workspace}"
        sh "terraform fmt"
      }
    }

    stage("Terraform Init"){
      steps{
        sh "cd ${workspace}"
        sh "terraform init"
      }
    }

    stage("Terraform Get"){
      steps{
        sh "cd ${workspace}"
        sh "terraform get -update=true"
      }
    }

    stage("Terraform Validate"){
      steps{
        print "Validating the TF files"
          sh "cd ${workspace}"
          sh "terraform validate \
              -var=do_token=${do_token}"
      }
    }

    stage("Terraform Plan"){
      steps{
        print "Creating Terraform Plan File"
          sh "cd ${workspace}"
          sh "terraform plan \
              -var=do_token=${do_token} \
              -out=plan.tfplan"
      }
    }

    stage("Input Required"){
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
          // Approved by user
          echo "Approved by: [${user}]"
        } else {
            // Fail if NOT approved
            echo "this was not successful"
            currentBuild.result = 'FAILURE'
          }
    }
        }
      }
    }

    stage("Terraform Apply"){
      steps{
        print "Applying Terraform Plan"
          sh "cd ${workspace}"
          sh "terraform apply plan.tfplan"
      }
    }
  }
}
