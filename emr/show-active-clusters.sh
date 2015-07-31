aws emr list-clusters --active --query "Clusters[*].{Id:Id,Name:Name,State:Status.State}" --output table
