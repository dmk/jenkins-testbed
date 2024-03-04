FROM jenkins/jenkins:lts

# Disable the setup wizard as we will configure Jenkins programmatically
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Install specific Jenkins plugins
# Replace 'git,job-dsl' with the list of plugins you need
RUN jenkins-plugin-cli --plugins \
    job-dsl git configuration-as-code workflow-job workflow-cps \
    workflow-aggregator pipeline-stage-view pipeline-model-definition \
    pipeline-build-step pipeline-utility-steps workflow-scm-step \
    workflow-cps-global-lib

# Optionally, add your custom Jenkins configuration as Code (JCasC) file
# COPY jenkins-local.yml /var/jenkins_home/casc_configs/jenkins-local.yml

# Set environment variable to point to the JCasC configuration file
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs/jenkins-local.yml
