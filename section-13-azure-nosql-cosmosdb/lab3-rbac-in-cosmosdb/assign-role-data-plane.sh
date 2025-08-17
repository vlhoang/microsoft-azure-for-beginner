# Xem các role có thể gán cho data plane
az cosmosdb sql role definition list --resource-group "udemy-cosmos-rg" --account-name "udemycosmosdb"

# Lấy id của role Cosmos DB Built-in Data Contributor
roleDefinitionId=$(az cosmosdb sql role definition list \
    --resource-group "udemy-cosmos-rg" \
    --account-name "udemycosmosdb" \
    --query "[?roleName=='Cosmos DB Built-in Data Contributor'].id" -o tsv)

# Lấy id của cosmosdb account
cosmosdbAccountId=$(az cosmosdb show \
    --name "udemycosmosdb" \
    --resource-group "udemy-cosmos-rg" \
    --query "id" -o tsv)

# Gán role cho user
az cosmosdb sql role assignment create \
    --resource-group "udemy-cosmos-rg" \
    --account-name "udemycosmosdb" \
    --role-definition-id "$roleDefinitionId" \
    --principal-id "user-object-id" \
    --scope "$cosmosdbAccountId"

#liệt kê các role đã gán cho user
az cosmosdb sql role assignment list \
    --resource-group "udemy-cosmos-rg" \
    --account-name "udemycosmosdb" \