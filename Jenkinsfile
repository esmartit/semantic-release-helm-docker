
    withCredentials([usernamePassword(
        credentialsId: 'github',
        usernameVariable: 'username', passwordVariable: 'gitToken')]){
            env.GITHUB_TOKEN=gitToken
        }
    withCredentials([usernamePassword(
        credentialsId: 'docker-credentials',
        usernameVariable: 'dockerUser', passwordVariable: 'dockerPass')]){
            env.DOCKER_USER=dockerUser
            env.DOCKER_PASS=dockerPass
        }

    def repoUrl = "https://github.com/esmartit/smartpoke-dashboard.git"
    def label = "worker-${UUID.randomUUID().toString()}"

    podTemplate(label: label, serviceAccount: 'jenkins',
            containers: [
            containerTemplate(name: 'semantic-release', image: 'esmartit/semantic-release:1.0.3', ttyEnabled: true, command: 'cat',envVars: [envVar(key: 'GITHUB_TOKEN', value: env.GITHUB_TOKEN)])
            ]
    ) {

        node(label) {

            container('semantic-release'){

                stage('Checkout code') {
                    checkout scm
                }

                stage('Prepare release') {
                    sh "chmod +x prepare-release.sh"
                    sh "npx semantic-release"
                }
            }
        }
    }
