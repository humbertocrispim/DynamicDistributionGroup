# Criando um grupo de distribuição dinâmico para líderes da GAV Resorts
New-DynamicDistributionGroup -Name "GRUPO - Lideres GAV Resorts" -RecipientFilter {(RecipientType -eq 'UserMailbox') -and (Title -like 'LIDER*')}

# Criando um grupo de distribuição dinâmico para todos os usuários da GAV Resorts
New-DynamicDistributionGroup -Name "All GAV Resorts" -RecipientFilter {(RecipientType -eq 'UserMailbox') -and (userPrincipalName -like '*gavresorts.com.br')}

# Obtendo informações do usuário do Exchange para usuários do SelectClub.com.br
Get-MailGet-User -Filter "userPrincipalName -like '*selectclub.com.br'"
