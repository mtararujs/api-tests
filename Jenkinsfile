pipeline {
    agent any
    triggers{
       pollSCM('*/1 * * * *') 
    }
    stages {
        stage('docker-build-test-base') {
            when {
                anyOf {
                    changeset 'Gemfile'
                    changeset 'Dockerfile.base'
                }
            }
            steps {
                echo 'Building base image for api-tests..'
                sh "docker build --no-cache -t mtararujs/api-tests-base:latest . -f Dockerfile.base"
                sh "docker push mtararujs/api-tests-base:latest"
            }
        }
        stage('docker-build-test-runner') {
            steps {
                echo 'Building runner image for api-tests'
                sh "docker build --no-cache -t mtararujs/api-tests-runner:latest . -f Dockerfile.runner"
                sh "docker push mtararujs/api-tests-runner:latest"
            }
        }
    }
}