<img width="800" height="386" alt="image" src="https://github.com/user-attachments/assets/2238c66f-61ef-406e-b956-f4e1808b91cc" />

# DevOps Alacarte 🍽️

Provisionamento modular de infraestrutura na AWS via **Terraform**, com interface interativa e automações **CI/CD**.

Cada recurso é apresentado como um card com formulário dinâmico que gera arquivos `.tfvars.json`, utilizados por workflows automatizados com **GitHub Actions**.

---

## Arquitetura – DevOps Alacarte

Esta seção descreve a arquitetura do **DevOps Alacarte**, ilustrando as principais componentes e suas interações.

![Arquitetura DevOps Alacarte](Devops_Alacarte_Diagram.v2.png)

---


## Visão Geral
**DevOps Alacarte** é um portal interno que permite o provisionamento de recursos AWS de forma **segura, rastreável e padronizada**.  
Desenvolvedores escolhem serviços "à la carte", conforme suas necessidades, sem depender diretamente da equipe de infraestrutura.

---

## Objetivos
- Simplificar o provisionamento de recursos AWS  
- Garantir segurança e rastreabilidade  
- Padronizar configurações via módulos Terraform  
- Automatizar deploys com GitHub Actions  

---

## Tecnologias Utilizadas
| Camada        | Tecnologias |
|---------------|-------------|
| **Frontend**  | React + Docker |
| **Backend**   | Node.js ou FastAPI |
| **Infra**     | Terraform + Módulos AWS |
| **CI/CD**     | GitHub Actions |

---

## Recursos Disponíveis
| Serviço     | Módulo Terraform         | Status |
|-------------|---------------------------|--------|
| DynamoDB    | terraform-aws-dynamodb   | ✅ Ativo |
| DocumentDB  | terraform-aws-documentdb | ✅ Ativo |
| SQS         | terraform-aws-sqs        | 🚧 Em teste |
| SNS         | terraform-aws-sns        | 🚧 Em teste |

---

## Estrutura do Repositório
```plaintext
devops-alacarte/
├── frontend/           # Interface React
├── backend/            # API para gerar tfvars
├── modules/            # Módulos Terraform
│   ├── dynamodb/
│   ├── documentdb/
│   └── sqs/
├── tfvars-templates/   # Templates JSON
├── workflows/          # GitHub Actions
└── README.md
```

---

	## Fluxo de Provisionamento
	1. Usuário acessa o portal e escolhe um recurso  
	2. Preenche formulário dinâmico  
	3. Backend gera o arquivo `.tfvars.json`  
	4. GitHub Actions aplica o Terraform com base no módulo e parâmetros  

	---

	## Exemplo de `.tfvars.json`
	```json
	{
	  "table_name": "Pedidos",
	  "read_capacity": 5,
	  "write_capacity": 5,
	  "hash_key": "pedido_id",
	  "tags": {
		"owner": "silas",
		"env": "dev"
	  }
	}
	```

	### Explicação dos campos
	- **table_name**: Nome da tabela DynamoDB  
	- **read_capacity / write_capacity**: Capacidade de leitura e escrita  
	- **hash_key**: Chave primária da tabela  
	- **tags**: Metadados para controle de owner e ambiente  

	---

	## Segurança e Governança
	O sistema incorpora práticas de **segurança corporativa e conformidade**:

	- Autenticação via OAuth corporativo  
	- Integração com **AWS Secrets Manager** para gestão de credenciais sensíveis  
	- Limites de uso por ambiente e por perfil IAM  
	- Auditoria de provisionamentos via **AWS CloudTrail** e **GitHub Logs**  
	- Validação de conformidade com **tfsec** e políticas internas  

	---

	## Futuras Expansões
	O roadmap inclui:

	- Suporte a múltiplas clouds (**Azure, GCP**)  
	- Provisionamento de arquiteturas completas (ex: VPC + RDS + EC2)  
	- Integração com **Slack/Teams** para notificações de provisionamento  
	- Painel de auditoria e métricas de uso em tempo real  
	- Suporte a **GMUDs automatizadas** com validação de pré-requisitos  

	---

	## Templates `.tfvars.json`

	Todos os recursos suportados possuem templates padrão, armazenados em `tfvars-templates/`, para facilitar a criação de variáveis.

	### dynamodb.tfvars.json
	```json
	{
	  "table_name": "",
	  "read_capacity": 5,
	  "write_capacity": 5,
	  "hash_key": "",
	  "tags": {
		"owner": "",
		"env": "dev"
	  }
	}
	```

	### sqs.tfvars.json
	```json
	{
	  "queue_name": "",
	  "visibility_timeout_seconds": 30,
	  "message_retention_seconds": 345600,
	  "tags": {
		"owner": "",
		"env": "dev"
	  }
	}
	```

	### glue.tfvars.json
	```json
	{
	  "job_name": "",
	  "role_arn": "",
	  "script_location": "",
	  "glue_version": "3.0",
	  "tags": {
		"owner": "",
		"env": "prod"
	  }
	}
	```

	### secretsmanager.tfvars.json
	```json
	{
	  "secret_name": "",
	  "description": "",
	  "secret_string": {
		"username": "",
		"password": ""
	  },
	  "tags": {
		"owner": "",
		"env": "prod"
	  }
	}
	```

	---

	## Integração via API – Expansão para Ecossistemas DevOps
	A API do **DevOps Alacarte** atua como um hub integrador, permitindo que outras ferramentas (pipelines, bots, orquestradores) consumam os serviços.

	Por meio de chamadas HTTP autenticadas, é possível enviar dados `.tfvars.json` para provisionar recursos como **SQS, SNS, Glue, Secrets Manager** e outros.

	### Exemplo de uso da API
	```
	POST /api/provision
	Content-Type: application/json
	Authorization: Bearer <token>

	{
	  "resource": "sqs",
	  "parameters": {
		"queue_name": "fila-pedidos",
		"visibility_timeout_seconds": 30,
		"message_retention_seconds": 345600,
		"tags": {
		  "owner": "silas",
		  "env": "prod"
		}
	  }
	}
	```

	### Descrição
	- **resource**: Tipo de recurso a ser provisionado  
	- **parameters**: Parâmetros necessários para o módulo Terraform correspondente  

	---

	## Protótipo da Interface – DevOps Alacarte
	O portal foi projetado para **usabilidade e agilidade**.

	### Funcionalidades principais:
	- **Launch Instance** → Provisiona instâncias EC2  
	- **Create Queue** → Cria filas SQS  
	- **Create Topic** → Cria tópicos SNS  
	- **Today's Menu** → Lista serviços em homologação  

  
  ![Protótipo do portal DevOps Alacarte](https://github.com/souzasilasmarcos/devopsalacarte/blob/main/devops-alacarte-prototipo.png)    
  
	---

	## Upload de Variáveis de Ambiente `.tfvars.json` via API (S3 Gateway Privado)

	Esse recurso permite o **upload seguro** de arquivos `.tfvars.json` para um bucket **S3 privado**, garantindo **segregação de ambientes e rastreabilidade**.

	### 🔹 Método HTTP
	```
	PUT
	```

	### 🔹 Endpoint
	```
	https://xptomz8mb2-vpce-0aa64cf3a6cedc7babcde.execute-api.us-east-1.amazonaws.com/dev/upload/{bucket}
	```

	Substitua `{bucket}` pelo nome do bucket S3 de destino.  
	O nome do arquivo enviado deve indicar o contexto do recurso (ex: `sqs-devops-dev.tfvars.json`).

	### 🔹 Headers obrigatórios
	| Header        | Valor |
	|---------------|-------|
	| Content-Type  | application/json |
	| x-api-key     | Chave de acesso da API privada |

	### 🔹 Corpo da Requisição (Exemplo)
	```json
	{
	  "name": "alacarte-devops",
	  "delay_seconds": 0,
	  "receive_wait_time_seconds": 20,
	  "visibility_timeout_seconds": 30,
	  "message_retention_seconds": 86400,
	  "max_receive_count": 10,
	  "environment": "sit",
	  "workload": "infra_pipelines",
	  "cost_center": "10002102",
	  "owner": "infraestrutura",
	  "iaac": "yes",
	  "bu": "infraestrutura",
	  "application": "devops-alacarte",
	  "monitoring": "dynatrace"
	}
	```

	### 🔹 Exemplo com múltiplas filas SQS
	```json
	{
	  "sqs_queues": [
		{
		  "name": "cd-account-instant-payment-schedule",
		  "delay_seconds": 10
		}
	  ]
	}
	```

	---

##


	## Explicação dos campos

	- **table_name**: Nome da tabela DynamoDB  
	- **read_capacity / write_capacity**: Capacidade de leitura e escrita  
	- **hash_key**: Chave primária da tabela  
	- **tags**: Metadados para controle de owner e ambiente  

	---

	## Segurança e Governança

	O sistema incorpora práticas de segurança corporativa e conformidade:

	- Autenticação via OAuth corporativo  
	- Integração com AWS Secrets Manager para gestão de credenciais sensíveis  
	- Limites de uso por ambiente e por perfil IAM  
- Auditoria de provisionamentos via AWS CloudTrail e GitHub Logs  
- Validação de conformidade com tfsec e políticas internas  

---

## Futuras Expansões

O roadmap inclui:

- Suporte a múltiplas clouds (Azure, GCP)  
- Provisionamento de arquiteturas completas (ex: VPC + RDS + EC2)  
- Integração com Slack/Teams para notificações de provisionamento  
- Painel de auditoria e métricas de uso em tempo real  
- Suporte a GMUDs automatizadas com validação de pré-requisitos  

---

## Templates `.tfvars.json`

Todos os recursos suportados possuem templates padrão, armazenados em `tfvars-templates/`, para facilitar a criação de variáveis.

### dynamodb.tfvars.json
```json
{
  "table_name": "",
  "read_capacity": 5,
  "write_capacity": 5,
  "hash_key": "",
  "tags": {
    "owner": "",
    "env": "dev"
  }
}
```

### sqs.tfvars.json
```json
{
  "queue_name": "",
  "visibility_timeout_seconds": 30,
  "message_retention_seconds": 345600,
  "tags": {
    "owner": "",
    "env": "dev"
  }
}
```

### glue.tfvars.json
```json
{
  "job_name": "",
  "role_arn": "",
  "script_location": "",
  "glue_version": "3.0",
  "tags": {
    "owner": "",
    "env": "prod"
  }
}
```

### secretsmanager.tfvars.json
```json
{
  "secret_name": "",
  "description": "",
  "secret_string": {
    "username": "",
    "password": ""
  },
  "tags": {
    "owner": "",
    "env": "prod"
  }
}
```

---

## Integração via API – Expansão para Ecossistemas DevOps

A API do **DevOps Alacarte** atua como um hub integrador, permitindo que outras ferramentas (pipelines, bots, orquestradores) consumam os serviços.  

Por meio de chamadas HTTP autenticadas, é possível enviar dados `.tfvars.json` para provisionar recursos como **SQS, SNS, Glue, Secrets Manager** e outros.

### Exemplo de uso da API
```http
POST /api/provision
Content-Type: application/json
Authorization: Bearer <token>

{
  "resource": "sqs",
  "parameters": {
    "queue_name": "fila-pedidos",
    "visibility_timeout_seconds": 30,
    "message_retention_seconds": 345600,
    "tags": {
      "owner": "silas",
      "env": "prod"
    }
  }
}
```

### Descrição dos campos
- **resource**: Tipo de recurso a ser provisionado  
- **parameters**: Parâmetros necessários para o módulo Terraform correspondente  

---

## Protótipo da Interface – DevOps Alacarte

O portal foi projetado para **usabilidade** e **agilidade**.  

Funcionalidades principais:

- **Launch Instance** → Provisiona instâncias EC2  
- **Create Queue** → Cria filas SQS  
- **Create Topic** → Cria tópicos SNS  
- **Today's Menu** → Lista serviços em homologação  

📌 Imagem: Protótipo do portal DevOps Alacarte (disponível no repositório ou documentação interna).

---

## Upload de Variáveis de Ambiente `.tfvars.json` via API (S3 Gateway Privado)

Esse recurso permite o **upload seguro** de arquivos `.tfvars.json` para um bucket **S3 privado**, garantindo segregação de ambientes e rastreabilidade.

- 🔹 **Método HTTP**: `PUT`  
- 🔹 **Endpoint**:  
  ```
  https://xptomz8mb2-vpce-0aa64cf3a6cedc7babcde.execute-api.us-east-1.amazonaws.com/dev/upload/{bucket}
  ```  
  Substitua `{bucket}` pelo nome do bucket S3 de destino.  
- O nome do arquivo enviado deve indicar o contexto do recurso (ex: `sqs-devops-dev.tfvars.json`).  

### Headers obrigatórios
| Header        | Valor                        |
|---------------|------------------------------|
| Content-Type  | application/json             |
| x-api-key     | Chave de acesso da API privada |

### Corpo da Requisição (Exemplo)
```json
{
  "name": "alacarte-devops",
  "delay_seconds": 0,
  "receive_wait_time_seconds": 20,
  "visibility_timeout_seconds": 30,
  "message_retention_seconds": 86400,
  "max_receive_count": 10,
  "environment": "sit",
  "workload": "infra_pipelines",
  "cost_center": "10002102",
  "owner": "infraestrutura",
  "iaac": "yes",
  "bu": "infraestrutura",
  "application": "devops-alacarte",
  "monitoring": "dynatrace"
}
```

### Exemplo com múltiplas filas SQS
```json
{
  "sqs_queues": [
    {
      "name": "cd-account-instant-payment-schedule",
      "delay_seconds": 10
    }
  ]
}
```

---

✍️ **Autor**: Silas Marcos de Souza  
📌 **Status**: Projeto em desenvolvimento com módulos dinâmicos e expansão planejada para multi-cloud.
