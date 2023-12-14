#####TAGS###########
agency_code = "test"
project_code = "vsapp"
environment = "dev"
zone = "ez"
tier = "app"
create_method = "iac-terraform"
aws_region = "ap-southeast-1"
function_name_ = "app"
folder_name = "visitorapp"
vpc_cidr = "100.120.108.0/22"
app-subnet = {
        "a" = {
                cidr = "100.120.108.0/25"
                az   = "ap-southeast-1a"
                az_name = "a"
                tier = "app"
        },
        "b" = {
                cidr = "100.120.108.128/25"
                az   = "ap-southeast-1b"
                az_name = "b"
                tier = "app"
        }
}

db-subnet = {
        "a" = {
                cidr = "100.120.109.0/27"
                az   = "ap-southeast-1a"
                az_name = "a"
                tier = "appdb"
        },
        "b" = {
                cidr = "100.120.109.32/27"
                az   = "ap-southeast-1b"
                az_name = "b"
                tier = "appdb"
        }
}



app_nacl_ingress_rule = [
        {
                rule_number = 100
                protocol    = "all"
                rule_action = "allow"
                cidr_block  = "0.0.0.0/0"
                from_port   = 0
                to_port     = 0
        }
]

app_nacl_egress_rule = [
        {
                rule_number = 100
                protocol    = "all"
                rule_action = "allow"
                cidr_block  = "0.0.0.0/0"
                from_port   = 0
                to_port     = 0
        }
]

db_nacl_ingress_rule = [
        {
                rule_number = 100
                protocol    = "all"
                rule_action = "allow"
                cidr_block  = "100.120.108.0/25"
                from_port   = 0
                to_port     = 0
        },
        {
                rule_number = 110
                protocol    = "all"
                rule_action = "allow"
                cidr_block  = "100.120.128.0/25"
                from_port   = 0
                to_port     = 0
        }
]

db_nacl_egress_rule = [
        {
                rule_number = 100
                protocol    = "all"
                rule_action = "allow"
                cidr_block  = "100.120.108.0/25"
                from_port   = 0
                to_port     = 0
        },
        {
                rule_number = 110
                protocol    = "all"
                rule_action = "allow"
                cidr_block  = "100.120.128.0/25"
                from_port   = 0
                to_port     = 0
        }
]

security_group_rules_albcontroller = {
    name = "AllowAccess",
    ingress = [
      {
        type        = "ingress"
        description = "Node groups to cluster API"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
        
      }
    ],
    egress = [
       {
        type        = "egress"
        description = "Node groups to cluster API"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
        
      }
      
    ]
  }

  security_group_rules_eks_worker = {
    name = "AllowAccess",
    ingress = [
      {
        type        = "ingress"
        description = "Node groups to cluster API"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = "0.0.0.0/0"
        
      }
    ],
    egress = [
       {
        type        = "egress"
        description = "Node groups to cluster API"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = "0.0.0.0/0"
        
      }
      
    ]
  }


# Cloud One Integration

policyfile_name_ecr = "policy_ecr_dev"
policyfile_name_redis = "policy_redis_dev"

################## EKS #######################################
cluster_version = "1.24"
env = "mgt"
ami_id = "ami-0c8721819b05f8b97"              #                                 
instance_type = "t3.micro"
volume_size = 50
cluster = "eks-dev"
desired_size                     = 1
max_size                         = 1
min_size                         = 1
coredns_version                  = "v1.9.3-eksbuild.2"
vpccni_version                   = "v1.12.6-eksbuild.1"
kubeproxy_version                = "v1.24.10-eksbuild.2"
ebs_csi_driver_version           = "v1.17.0-eksbuild.1"


###IAM Role ###
managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy","arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"]
managed_policy_arns_nodes = ["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy","arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy","arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly","arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
role_policy_file_name_eks    = "assumerolepolicy" 
role_policy_file_name_nodes    = "assumerolepolicy_nodes" 
service_name1 = "eks-clusterdev"
service_name2 = "eks-clusterdev-nodes"
resource ="eks-cluster"
vmname = "eksdev"
retention_in_days = 0
policyid           = 102
###Security-group###
function_name = "eksdev"
security_group_rules_eks_master = {
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
        cidr_blocks      = ["0.0.0.0/0"]
        
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
  

  file_name_policy_sm = "secret-policy"
  
  repository_policyfile_name = "ecr_policy_file"
  lifecycle_policyfile_name  = "lifecycle_policy_file"
  #ecr_kms_key                = ""