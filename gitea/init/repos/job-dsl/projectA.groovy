folder('ProjectA') {
  description('This is Project A')
}

pipelineJob('ProjectA/A_Build') {
  definition {
    cpsScm {
      scm {
        git {
          remote {
            url('http://gitea:3000/jenkins/repo-a.git')
            credentials('gitea')
          }
          branches('*/main')
        }
      }
      scriptPath('Jenkinsfile')
    }
  }
}
