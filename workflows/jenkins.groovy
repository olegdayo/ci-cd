pipeline {
  agent any

  tools { go '1.22' }

  stages {
    stage('Build') {
      steps {
        git 'https://github.com/olegdayo/bruh'
        sh 'go build -ldflags "-s -w" -o ./bin/bruh ./cmd'
      }
    }
    
    stage('Test') {
      steps {
        git 'https://github.com/olegdayo/bruh'
        sh 'go test `go list ./...`'
      }
    }
  }
}
