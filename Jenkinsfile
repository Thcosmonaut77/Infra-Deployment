pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION="us-east-1"     
    }
        
    stages {
        stage('Infrastructure Deployment') {
           environment {
             AWS_ACCESS_KEY_ID = credentials('aws_access_key_id')
             AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')

             TF_REGION = credentials('tf_region')
             TF_AZ1 = credentials('tf_az1')
             TF_ALLOWED_IP = credentials('tf_allowed_ip')
             TF_INSTANCE_TYPE = credentials('tf_instance_type')
             TF_KP = credentials('tf_kp')
             TF_SERVER_NAMES = credentials('tf_server_names')

           }
           steps {
              script {
                  // Write tfvars from Jenkins credentials
                    writeFile file: 'terraform.tfvars', text: """
                    region        = "${env.TF_REGION}"
                    az1           = "${env.TF_AZ1}"
                    allowed_ip    = "${env.TF_ALLOWED_IP}"
                    instance_type = "${env.TF_INSTANCE_TYPE}"
                    kp            = "${env.TF_KP}"
                    server_names  = ${env.TF_SERVER_NAMES}
                    """

                    sh """
                        terraform init
                        terraform validate
                        terraform plan -var-file=terraform.tfvars
                        terraform ${action} -var-file=terraform.tfvars --auto-approve
                    """
            }
        }
               
     }
    }
    
}