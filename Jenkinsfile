pipeline {
    agent any

    environment {
        ARM_CLIENT_ID       = credentials('415843ea-36bb-4674-9ddf-7afc41978ee5')  // Credentials ID in Jenkins
        ARM_CLIENT_SECRET   = credentials('4Ys8Q~QrKohFBztLKyqDI7IZ5rLOYpt2wR6eWb5n')
        ARM_TENANT_ID       = credentials('41d41ded-1b6f-4e2f-a474-bfeadc70cb39')
        ARM_SUBSCRIPTION_ID = credentials('a36a1195-88fa-4929-957f-e5274a6a346a')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/pratham-s-sengar/terraform-jenkins-lab1.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh """
                        terraform plan \
                            -var "subscription_id=${ARM_SUBSCRIPTION_ID}" \
                            -var "client_id=${ARM_CLIENT_ID}" \
                            -var "client_secret=${ARM_CLIENT_SECRET}" \
                            -var "tenant_id=${ARM_TENANT_ID}"
                    """
                }
            }
        }

        stage('Manual Approval') {
            steps {
                input message: 'Approve deployment?', ok: 'Deploy'
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh """
                        terraform apply -auto-approve \
                            -var "subscription_id=${ARM_SUBSCRIPTION_ID}" \
                            -var "client_id=${ARM_CLIENT_ID}" \
                            -var "client_secret=${ARM_CLIENT_SECRET}" \
                            -var "tenant_id=${ARM_TENANT_ID}"
                    """
                }
            }
        }
    }

    post {
        success {
            echo '✅ Infrastructure provisioned successfully!'
        }
        failure {
            echo '❌ Build failed. Check logs.'
        }
    }
}
