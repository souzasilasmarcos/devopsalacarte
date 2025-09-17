# DevOps Alacarte 🍽️

Provisionamento modular e inteligente de infraestrutura na **AWS** via **Terraform**, com interface interativa, automações **CI/CD** e integração com práticas de governança e segurança.

Cada recurso é apresentado como um **card** com formulário dinâmico que gera arquivos `.tfvars.json`, utilizados por workflows automatizados com **GitHub Actions**.

---

## Visão Geral

**DevOps Alacarte** é um portal interno que permite o provisionamento de recursos AWS de forma **segura, rastreável, padronizada e auditável**.  
Desenvolvedores escolhem serviços **"à la carte"**, conforme suas necessidades, sem depender diretamente da equipe de infraestrutura.

O portal foi projetado para atender demandas de provisionamento com **baixa fricção**, mantendo conformidade com padrões corporativos e acelerando entregas em ambientes produtivos.

---

## Objetivos

- Simplificar o provisionamento de recursos AWS  
- Garantir segurança, rastreabilidade e conformidade  
- Padronizar configurações via módulos **Terraform**  
- Automatizar deploys com **GitHub Actions**  
- Reduzir dependência direta da equipe de infraestrutura  
- Integrar com práticas de **Gestão de Acesso**, **Secrets Management** e **Auditoria**

---

## Tecnologias Utilizadas

| Camada         | Tecnologias                                      |
|----------------|--------------------------------------------------|
| **Frontend**   | React + JavaScript + Docker                      |
| **Backend**    | Node.js (Express/Fastify) + API Gateway          |
| **Infra**      | Terraform + Módulos AWS                          |
| **CI/CD**      | GitHub Actions + Jenkins + tfsec                 |
| **Segurança**  | IAM, Secrets Manager, OAuth + API Gateway (Auth) |


---

## Recursos Disponíveis

| Serviço      | Módulo Terraform               | Status         |
|--------------|--------------------------------|----------------|
| DynamoDB     | `terraform-aws-dynamodb`       | ✅ Ativo        |
| DocumentDB   | `terraform-aws-documentdb`     | ✅ Ativo        |
| SQS          | `terraform-aws-sqs`            | 🚧 Em teste     |
| SNS          | `terraform-aws-sns`            | 🚧 Em teste     |
| Glue         | `terraform-aws-glue`           | 🆕 Em validação |
| Secrets      | `terraform-aws-secretsmanager` | 🆕 Em validação |

---

## Estrutura do Repositório

```plaintext
devops-alacarte/
├── frontend/          # Interface React
├── backend/           # API para gerar tfvars
├── modules/           # Módulos Terraform
│   ├── dynamodb/
│   ├── documentdb/
│   ├── sqs/
│   ├── glue/
│   └── secretsmanager/
├── tfvars-templates/  # Templates JSON
├── workflows/         # GitHub Actions
└── README.md

## Fluxo de Provisionamento

1. Usuário acessa o portal e escolhe um recurso  
2. Preenche formulário dinâmico com parâmetros e tags  
3. Backend gera o arquivo `.tfvars.json`  
4. GitHub Actions aplica o Terraform com base no módulo e parâmetros  
5. Provisionamento é registrado e auditado

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
    "env": "prod"
  }
}

## Segurança e Governança

- Autenticação via OAuth corporativo  
- Integração com Secrets Manager para credenciais sensíveis  
- Limites de uso por ambiente e por perfil IAM  
- Auditoria de provisionamentos via CloudTrail e GitHub Logs  
- Validação de conformidade com tfsec e políticas internas

---

## Futuras Expansões

- Suporte a múltiplas clouds (Azure, GCP)  
- Provisionamento de arquiteturas completas (ex: VPC + RDS + EC2)  
- Integração com Slack/Teams para notificações  
- Painel de auditoria e métricas de uso  
- Suporte a GMUDs automatizadas com validação de pré-requisitos

---

## Templates `.tfvars.json`

Crie a pasta `tfvars-templates/` com os seguintes arquivos:

### `dynamodb.tfvars.json`

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

## plates `.tfvars.json`

Crie a pasta `tfvars-templates/` com os seguintes arquivos:

### `sqs.tfvars.json`

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

glue.tfvars.json
json
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
secretsmanager.tfvars.json
json
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

Integração via API – Expansão para Ecossistemas DevOps
A API do DevOps Alacarte atua como componente integrador, permitindo que o portal seja consumido por outras ferramentas e pipelines de automação. Por meio de chamadas HTTP autenticadas, é possível enviar dados em formato .tfvars.json para provisionar recursos como SQS, SNS, Glue, Secrets Manager, entre outros.

Essa abordagem transforma o portal em um hub de automação inteligente, permitindo que o provisionamento seja iniciado por sistemas externos, bots internos, orquestradores ou eventos automatizados.

Exemplo de uso da API
http
POST /api/provision
Content-Type: application/json
Authorization: Bearer <token>
json
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

## 🖼️ Protótipo da Interface – DevOps Alacarte

Abaixo está uma prévia da interface do portal **DevOps Alacarte**, projetada para facilitar o provisionamento de recursos AWS de forma modular e intuitiva:

- **Launch Instance**: Provisiona instâncias EC2
- **Create Queue**: Cria filas SQS
- **Create Topic**: Cria tópicos SNS
- **Today's Menu**: Exibe tópicos de homologação

> O layout foi desenvolvido com foco em usabilidade e agilidade para times de desenvolvimento e operações.

📌 *Imagem: Protótipo do portal DevOps Alacarte*

*(Para visualizar, consulte o arquivo anexado ao repositório ou documentação interna.)*



*** Autor: Silas Marcos de Souza