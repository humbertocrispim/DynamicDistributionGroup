# Criando um grupo de distribuição dinâmico para líderes da Exemplo
New-DynamicDistributionGroup -Name "GroupExemplo" -RecipientFilter {(RecipientType -eq 'UserMailbox') -and (Title -like 'EXAMPLE*')}

# Criando um grupo de distribuição dinâmico para todos os usuários da Exemplo
New-DynamicDistributionGroup -Name "GroupExaple" -RecipientFilter {(RecipientType -eq 'UserMailbox') -and (userPrincipalName -like '*example.com.br')}

# Obtendo informações do usuário do Exchange para usuários do exemplo.com.br
Get-MailGet-User -Filter "userPrincipalName -like '*exemplo.com.br'"

####### -------------------------------- ###############################