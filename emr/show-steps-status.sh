aws emr list-steps --cluster-id $1 --query "reverse(Steps[*].{Id:Id,Name:Name,State:Status.State})" --output table
