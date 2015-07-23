# AWS EMR

## Provision a cluster

```
$ ./start-hadoop.sh  # Spin up a new cluster (name: ADHOC_QUERY) with 5 number of nodes
$ ./start-hadoop.sh MY_CLUSTER 10  # Spin up a new cluster (MY_CLUSTER) with 10 number of nodes 
```

### Check status of all active clusters

```
./show-active-clusters.sh
```

### Describe cluster details

```
./describe-cluster.sh j-1111111  # Shows the attributes of cluster with ID j-1111111
```

### Terminate a cluster

```
$ ./terminate-cluster.sh j-1111111  # Terminate cluster with ID j-1111111
```

### Check status of all steps defined for a cluster

```
$ ./show-steps-status.sh j-1111111  # show status of all steps defined for cluster j-1111111 
```

### Increment/ decrement number of nodes within a cluster 

```
$ ./update-cluster-nodes.sh ig-1234567 10  # Set number of nodes to 10 for instance group ig-1234567 (See #describe-cluster-details to obtain the instance group ID of a cluster)
```

### SSH into active cluster

```
$ ./ssh-emr.sh j-1111111 ~/directory/file.pem  # SSH into cluster j-1111111 using key pair file file.pem 
```

## Reference

http://docs.aws.amazon.com/cli/latest/reference/emr/index.html
