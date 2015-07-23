INSTANCE_GROUP_ID=$1
NODES=$2

aws emr modify-instance-groups --instance-groups InstanceGroupId=$INSTANCE_GROUP_ID,InstanceCount=NODES
