# Criação de Grupos Dinâmicos no Exchange Online

Created By: humberto cunha
Last Edited By: humberto cunha
Status: Completed 🏁
Type: Technical Spec

# **Criação de Grupos Dinâmicos no Exchange Online**

Recentemente, precisei criar uma lista de distribuição dinâmica no Exchange Online no trabalho. Pensei que seria fácil fazê-lo por meio do painel de administração da Microsoft, mas percebi que o EAC não era tão intuitivo assim. Após algumas pesquisas, encontrei uma documentação no site da Microsoft que explicava praticamente o que eu gostaria de fazer: criar uma lista de distribuição que utilizasse um filtro de domínio.

Exemplo: todo e qualquer colaborador que tivesse o domínio de e-mail @exemplo.com.br iria ser membro desta lista.

## **Pré-requisitos**

- Tempo estimado para conclusão: 2 a 5 minutos.
- Para abrir o centro de administração do Exchange, consulte **[Centro de administração do Exchange no Exchange Online](https://learn.microsoft.com/pt-br/exchange/exchange-admin-center)**.
- Para se conectar ao PowerShell do Exchange Online, confira **[Conectar ao PowerShell do Exchange Online](https://learn.microsoft.com/pt-br/powershell/exchange/connect-to-exchange-online-powershell)**.
- Você precisa de permissões para fazer esse procedimento ou procedimentos. Para ver quais permissões você precisa, consulte a entrada "Destinatários" nas **[permissões de recurso em Exchange Online](https://learn.microsoft.com/pt-br/exchange/permissions-exo/feature-permissions)** artigo.

### I**nstalação do módulo do PowerShell**

Antes de começar, você precisa instalar o módulo do PowerShell do Exchange Online. Para saber como fazer isso, consulte o tópico **[Conectar ao PowerShell do Exchange Online](https://learn.microsoft.com/pt-br/powershell/exchange/connect-to-exchange-online-powershell)**.

**Passo a passo**

1. Conecte-se ao EAC via PowerShell:

```powershell
Connect-ExchangeOnline -UserPrincipalName exemplo@exemplodominio.com.br
```

Será exibido um pop-up para você fazer login com suas credenciais.

2. Use o comando **[Get-User](https://learn.microsoft.com/pt-br/powershell/module/exchange/get-user?view=exchange-ps)** para filtrar os usuários:

```powershell
Get-User -Filter "userPrincipalName -like '*exeplo.com.br'"
```

Este comando retorna todos os usuários que possuem o atributo **`userPrincipalName`**
 igual a **`exemplo.com.br`**.

1. Use o filtro acima para criar o grupo dinâmico:

```powershell
New-DynamicDistributionGroup -Name "<NomeDoGrupo>" -RecipientFilter {(RecipientType -eq 'UserMailbox') -and (userPrincipalName -like '<NomeDoDominio>')}
```

### **Parâmetros**

- **`Name`**: O nome do grupo que será criado.
- **`RecipientFilter`**: A expressão usada para filtrar os destinatários que serão adicionados automaticamente ao grupo.

### **Exemplo**

```powershell
New-DynamicDistributionGroup -Name "GrupoDeExemplo" -RecipientFilter {(RecipientType -eq 'UserMailbox') -and (userPrincipalName -like '*exemplo.com.br')}
```

Este exemplo cria um novo grupo de distribuição dinâmico chamado "GrupoDeExemplo" e filtra os destinatários com base em sua propriedade “userPrincipalName” igual a "UserMailbox" e seu título começando com a palavra "Grupo".

Os membros do grupo serão atualizados automaticamente com base nesses critérios.

- Documentação do Microsoft Exchange Online: **[https://docs.microsoft.com/en-us/exchange/](https://docs.microsoft.com/en-us/exchange/)**
- Documentação do Microsoft PowerShell para Exchange Online: **[https://docs.microsoft.com/en-us/powershell/exchange/exchange-online-powershell?view=exchange-ps](https://docs.microsoft.com/en-us/powershell/exchange/exchange-online-powershell?view=exchange-ps)**
- Artigo sobre permissões de recurso em Exchange Online: **[https://docs.microsoft.com/en-us/exchange/permissions-exo/feature-permissions](https://docs.microsoft.com/en-us/exchange/permissions-exo/feature-permissions)**
- Documentação sobre o cmdlet New-DynamicDistributionGroup: **[https://docs.microsoft.com/en-us/powershell/module/exchange/new-dynamicdistributiongroup?view=exchange-ps](https://docs.microsoft.com/en-us/powershell/module/exchange/new-dynamicdistributiongroup?view=exchange-ps)**
- Documentação sobre o cmdlet Get-User: **[https://docs.microsoft.com/en-us/powershell/module/exchange/get-user?view=exchange-ps](https://docs.microsoft.com/en-us/powershell/module/exchange/get-user?view=exchange-ps)**