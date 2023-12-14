# Dear Interviewer I am sharing few architecture design that can we done based on my experience.

Architecture design 1:
   This is the simple architecture design for testing and demo purposes.Here the EKS is deployed in a public subnet and the application is deployed using a helm chart. The redis can be deployed using aws redis cache.

![Architecture-1](Two-tier.png)

Architecture design 2:
   This architecture is based on centralized ingress and egress architecture. In this architecture EKS Cluster and DB are in the isolated private VPC having connection through transit gateway.All the ingress and egress packets are scanned by AWS Network Firewall.

![Architecture-2](centrilized-architecture.png)

Architecture design 3:
   This architecture the request is forward from cloudfront to alb of the reverse proxy based on path it will be routed to a private api gateway url. From the API gateway it will be routed to application VPC  NLB. From NLB the request will be routed to appmesh virtual gateway from there it will be reached to corresponding service.

![Architecture-3](secure-architecture.png)
