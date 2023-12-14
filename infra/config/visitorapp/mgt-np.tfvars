cluster_version = "1.24"
project_code = "br2s"
env = "mgt"
zone = "mz"
tier = "np"
agency_code  = "acra"
create_method = "iac-terraform"
region = "ap-southeast-1"
vpc_id = "vpc-0a0bb4b1f63866bbc"
ami_id = "ami-095c83fa069ecff29"              #eks hardend "ami-07b0eb2889351c232"                                     
instance_type = "c5.xlarge"
volume_size = 200
subnet_ids = ["subnet-087e621c6d266e168","subnet-0ede046f88d544f71"]
cluster = "eks-dev"
cross-account-assume_role_arn = "arn:aws:iam::691123998498:role/iam-role-br2s-mgt-crossaccount"
zone_uat = "mz"
vpc_id_uat = "vpc-0a0bb4b1f63866bbc"
subnet_ids_uat = ["subnet-087e621c6d266e168","subnet-0ede046f88d544f71"]
zone_stg = "mz"
vpc_id_stg = "vpc-0a0bb4b1f63866bbc"
subnet_ids_stg = ["subnet-087e621c6d266e168","subnet-0ede046f88d544f71"]
desired_size                     = 1
max_size                         = 1
min_size                         = 1
desired_size_uat                    = 1
max_size_uat                        = 1
min_size_uat                        = 1
desired_size_stg                    = 1
max_size_stg                        = 1
min_size_stg                        = 1
coredns_version                  = "v1.9.3-eksbuild.2"
vpccni_version                   = "v1.12.6-eksbuild.1"
kubeproxy_version                = "v1.24.10-eksbuild.2"
ebs_csi_driver_version           = "v1.17.0-eksbuild.1"


###IAM Role ###
managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy","arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"]
managed_policy_arns_nodes = ["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy","arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy","arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly","arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
role_policy_file_name    = "assumerolepolicy" 
role_policy_file_name_nodes    = "assumerolepolicy_nodes" 
service_name1 = "eks-clusterdev"
service_name2 = "eks-clusterdev-nodes"
service_name1_uat = "eks-clusteruat"
service_name2_uat = "eks-clusteruat-nodes"
service_name1_stg = "eks-clusterstg"
service_name2_stg = "eks-clusterstg-nodes"
folder_name = "eks_mgmt"
resource ="eks-cluster"
vmname = "eksdev"
vmname_uat = "eksuat"
cluster_uat = "eks-uat"
vmname_stg = "eksstg"
cluster_stg = "eks-stg"
retention_in_days = 365
policyid           = 102
###Security-group###
function_name = "eksdev"
function_name_uat = "eksuat"
function_name_stg = "eksstg"
security_group_rules = {
    name = "AllowAccess",
    ingress = [
      {
        type        = "ingress"
        description = "Node groups to cluster API"
        from_port   = "443"
        to_port     = "443"
        protocol    = "tcp"
        self        = "true"
        
      },
      {
        type        = "ingress"
        description = "Cluster API to node kubelets"
        from_port   = "10250"
        to_port     = "10250"
        protocol    = "tcp"
        self        = "true"
        
      },
      {
        type        = "ingress"
        description = "Cluster API to node dns"
        from_port   = "53"
        to_port     = "53"
        protocol    = "tcp"
        self        = "true"
        
      },
      {
        type        = "ingress"
        description = "Cluster API to node dns"
        from_port   = "53"
        to_port     = "53"
        protocol    = "udp"
        self        = "true"
        
      },
      {
        type        = "ingress"
        description = "Access-from-mgmt"
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
        cidr_blocks      = ["10.211.47.0/24"]
        
      },
      {
        type        = "ingress"
        description = "Access-from-devsecops"
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
        cidr_blocks      = ["100.120.55.0/24"]
        
      },
      {
        type        = "ingress"
        description = "Access-from-devsecops"
        from_port   = "443"
        to_port     = "443"
        protocol    = "tcp"
        cidr_blocks      = ["100.120.55.0/24"]
        
      }
      
    ],
    egress = [
      {
        type        = "egress"
        description = "Cluster API to node dns"
        from_port   = "53"
        to_port     = "53"
        protocol    = "udp"
        self        = "true"
      },
      {
        type        = "egress"
        description = "Cluster API to node dns"
        from_port   = "53"
        to_port     = "53"
        protocol    = "tcp"
        self        = "true"
      },
      {
        type        = "egress"
        description = "Cluster API to node kubelets"
        from_port   = "10250"
        to_port     = "10250"
        protocol    = "tcp"
        self        = "true"
      },
       {
        type        = "egress"
        description = "Node groups to cluster API"
        from_port   = "443"
        to_port     = "443"
        protocol    = "tcp"
        self        = "true"
        
      },
       {
        type        = "egress"
        description = "Egress NTP/TCP"
        from_port   = "123"
        to_port     = "123"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
      },
       {
        type        = "egress"
        description = "Egress NTP/TCP"
        from_port   = "123"
        to_port     = "123"
        protocol    = "udp"
        cidr_blocks = ["0.0.0.0/0"]  
      }
      
    ]
  }

security_group_rules_uat = {
    name = "AllowAccess",
    ingress = [
      {
        type        = "ingress"
        description = "Node groups to cluster API"
        from_port   = "443"
        to_port     = "443"
        protocol    = "tcp"
        self        = "true"
        
      },
      {
        type        = "ingress"
        description = "Cluster API to node kubelets"
        from_port   = "10250"
        to_port     = "10250"
        protocol    = "tcp"
        self        = "true"
        
      },
      {
        type        = "ingress"
        description = "Cluster API to node dns"
        from_port   = "53"
        to_port     = "53"
        protocol    = "tcp"
        self        = "true"
        
      },
      {
        type        = "ingress"
        description = "Cluster API to node dns"
        from_port   = "53"
        to_port     = "53"
        protocol    = "udp"
        self        = "true"
        
      },
      {
        type        = "ingress"
        description = "Access-from-mgmt"
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
        cidr_blocks      = ["10.211.47.0/24"]
        
      },
      {
        type        = "ingress"
        description = "Access-from-devsecops"
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
        cidr_blocks      = ["100.120.55.0/24"]
        
      },
      {
        type        = "ingress"
        description = "Access-from-devsecops"
        from_port   = "443"
        to_port     = "443"
        protocol    = "tcp"
        cidr_blocks      = ["100.120.55.0/24"]
        
      }
      
    ],
    egress = [
      {
        type        = "egress"
        description = "Cluster API to node dns"
        from_port   = "53"
        to_port     = "53"
        protocol    = "udp"
        self        = "true"
      },
      {
        type        = "egress"
        description = "Cluster API to node dns"
        from_port   = "53"
        to_port     = "53"
        protocol    = "tcp"
        self        = "true"
      },
      {
        type        = "egress"
        description = "Cluster API to node kubelets"
        from_port   = "10250"
        to_port     = "10250"
        protocol    = "tcp"
        self        = "true"
      },
       {
        type        = "egress"
        description = "Node groups to cluster API"
        from_port   = "443"
        to_port     = "443"
        protocol    = "tcp"
        self        = "true"
        
      },
       {
        type        = "egress"
        description = "Egress NTP/TCP"
        from_port   = "123"
        to_port     = "123"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
      },
       {
        type        = "egress"
        description = "Egress NTP/TCP"
        from_port   = "123"
        to_port     = "123"
        protocol    = "udp"
        cidr_blocks = ["0.0.0.0/0"]  
      }
      
    ]
  }

security_group_rules_stg = {
    name = "AllowAccess",
    ingress = [
      {
        type        = "ingress"
        description = "Node groups to cluster API"
        from_port   = "443"
        to_port     = "443"
        protocol    = "tcp"
        self        = "true"
        
      },
      {
        type        = "ingress"
        description = "Cluster API to node kubelets"
        from_port   = "10250"
        to_port     = "10250"
        protocol    = "tcp"
        self        = "true"
        
      },
      {
        type        = "ingress"
        description = "Cluster API to node dns"
        from_port   = "53"
        to_port     = "53"
        protocol    = "tcp"
        self        = "true"
        
      },
      {
        type        = "ingress"
        description = "Cluster API to node dns"
        from_port   = "53"
        to_port     = "53"
        protocol    = "udp"
        self        = "true"
        
      },
      {
        type        = "ingress"
        description = "Access-from-mgmt"
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
        cidr_blocks      = ["10.211.47.0/24"]
        
      },
      {
        type        = "ingress"
        description = "Access-from-devsecops"
        from_port   = "22"
        to_port     = "22"
        protocol    = "tcp"
        cidr_blocks      = ["100.120.55.0/24"]
        
      },
      {
        type        = "ingress"
        description = "Access-from-devsecops"
        from_port   = "443"
        to_port     = "443"
        protocol    = "tcp"
        cidr_blocks      = ["100.120.55.0/24"]
        
      }
      
    ],
    egress = [
      {
        type        = "egress"
        description = "Cluster API to node dns"
        from_port   = "53"
        to_port     = "53"
        protocol    = "udp"
        self        = "true"
      },
      {
        type        = "egress"
        description = "Cluster API to node dns"
        from_port   = "53"
        to_port     = "53"
        protocol    = "tcp"
        self        = "true"
      },
      {
        type        = "egress"
        description = "Cluster API to node kubelets"
        from_port   = "10250"
        to_port     = "10250"
        protocol    = "tcp"
        self        = "true"
      },
       {
        type        = "egress"
        description = "Node groups to cluster API"
        from_port   = "443"
        to_port     = "443"
        protocol    = "tcp"
        self        = "true"
        
      },
       {
        type        = "egress"
        description = "Egress NTP/TCP"
        from_port   = "123"
        to_port     = "123"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
      },
       {
        type        = "egress"
        description = "Egress NTP/TCP"
        from_port   = "123"
        to_port     = "123"
        protocol    = "udp"
        cidr_blocks = ["0.0.0.0/0"]  
      }
      
    ]
  }

  kms_key_sm = "arn:aws:kms:ap-southeast-1:691123998498:key/61a66f30-ac37-4075-b924-fb3ce8135d7d"  
  kms_key_ec2 = "arn:aws:kms:ap-southeast-1:691123998498:key/17f50e2b-0cf8-4a6b-b12e-abf1458bc4ed"
  cw_kms_key_arn = "arn:aws:kms:ap-southeast-1:691123998498:key/89512a01-eef4-4440-9a87-8fba6378b44a" 
  
  kms_key_sm_uat = "arn:aws:kms:ap-southeast-1:691123998498:key/61a66f30-ac37-4075-b924-fb3ce8135d7d"  
  kms_key_ec2_uat = "arn:aws:kms:ap-southeast-1:691123998498:key/17f50e2b-0cf8-4a6b-b12e-abf1458bc4ed"
  cw_kms_key_arn_uat = "arn:aws:kms:ap-southeast-1:691123998498:key/89512a01-eef4-4440-9a87-8fba6378b44a" 

  kms_key_sm_stg = "arn:aws:kms:ap-southeast-1:691123998498:key/61a66f30-ac37-4075-b924-fb3ce8135d7d"  
  kms_key_ec2_stg = "arn:aws:kms:ap-southeast-1:691123998498:key/17f50e2b-0cf8-4a6b-b12e-abf1458bc4ed"
  cw_kms_key_arn_stg = "arn:aws:kms:ap-southeast-1:691123998498:key/89512a01-eef4-4440-9a87-8fba6378b44a" 

  file_name_policy_sm = "secret-policy"
  
  repository_policyfile_name = "ecr_policy_file"
  lifecycle_policyfile_name  = "lifecycle_policy_file"
  #ecr_kms_key                = ""
  description_secret         = "Secret manager"

  ###s3############

  s3_filename = "s3-policy.json"
  kmskey_filename = "s3-key-policy.json"
  #encrypted    = true
  kms_key_s3_stg = "arn:aws:kms:ap-southeast-1:691123998498:key/cee7dfc3-beb8-452b-afae-9a9fb4e02745"
  kms_key_s3_uat = "arn:aws:kms:ap-southeast-1:691123998498:key/cee7dfc3-beb8-452b-afae-9a9fb4e02745"
  kms_key_s3 = "arn:aws:kms:ap-southeast-1:691123998498:key/cee7dfc3-beb8-452b-afae-9a9fb4e02745"
  create_lifecycle = false
  create_acl = false
  ownership = "BucketOwnerEnforced"
  logging_enable = false
  create_newkmskey = false
  central_bucket = {}
