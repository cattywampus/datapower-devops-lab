#!groovy
node {
  timestamps {
    ansiColor('xterm') {
      stage('Prepare') {
        checkout scm
        sh 'docker ps'
        sh 'docker images'
      }

      stage('Build') {
        sh 'docker-compose build'
      }

      stage('Test') {
        try {
          sh 'docker-compose run client'
        } catch (Exception e) {
          throw e;
        } finally {
          sh 'docker-compose down --remote-orphans || true'
        }
      }
    }
  }
}
