# Provision a 5 node Hadoop cluster (put this in a shell script)
export AWS_DEFAULT_REGION=us-west-1

BID_PRICE=0.40

NAME=${1-ADHOC_QUERY}
NODES=${2-5}

export CLUSTER_ID=`aws emr create-cluster \
--name "$NAME" \
--tags Name="prod-emr" Environment="production" Product="elasticmapreduce" Role="elasticmapreduce" Task="ad-hoc" \
--applications Name=Hive \
--use-default-roles \
--ec2-attributes KeyName=denis.lowe-us-west-1,\
SubnetId=subnet-d3ef2cb6,\
AdditionalMasterSecurityGroups=[sg-4d0ac528,sg-3f0ac55a],\
AdditionalSlaveSecurityGroups=[sg-4d0ac528,sg-3f0ac55a] \
--ami-version 3.5.0 \
--instance-groups \
InstanceGroupType=MASTER,InstanceCount=1,InstanceType=c3.2xlarge \
InstanceGroupType=CORE,InstanceCount="$NODES",InstanceType=c3.2xlarge \
--bootstrap-actions \
Path=s3://findly.production/analytics/hive/scripts/configure-hosts.sh,Name="Configure Hosts" \
Path=s3://findly.production/analytics/hive/scripts/install-mongodb-cert.sh,Name="Install Certs" \
Path=s3://findly.production/analytics/hive/scripts/configure-mtu.sh,Name="Configure MTU" \
--enable-debugging --log-uri s3://findly.production/analytics/debug \
--query 'ClusterId' --output text`

echo "Spin up new EMR cluster: $NAME - $CLUSTER_ID"
echo "Number of nodes: $NODES" 
