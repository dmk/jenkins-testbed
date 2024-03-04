folder('ProjectB') {
  description('This is Project B')
}

pipelineJob('ProjectB/B_Build') {
  definition {
    cpsScm {
      scm {
        git {
          remote {
            url('http://gitea:3000/jenkins/repo-b.git')
            credentials('gitea')
          }
          branches('*/main')
        }
      }
      scriptPath('Jenkinsfile')
    }
  }
}
