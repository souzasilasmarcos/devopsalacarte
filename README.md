# DevOps Alacarte 🍽️  
Provisionamento modular de infraestrutura na **AWS** via **Terraform**, com interface interativa e automações **CI/CD**.  

Cada recurso é apresentado como um **card** com formulário dinâmico que gera arquivos `.tfvars.json`, utilizados por workflows automatizados com **GitHub Actions**.  

---

## 📌 Visão Geral  
**DevOps Alacarte** é um portal interno que permite o provisionamento de recursos AWS de forma **segura, rastreável e padronizada**.  
Desenvolvedores escolhem serviços **"à la carte"**, conforme suas necessidades, sem depender diretamente da equipe de infraestrutura.  

---

## 🚀 Objetivos  
- Simplificar o provisionamento de recursos AWS  
- Garantir segurança e rastreabilidade  
- Padronizar configurações via módulos **Terraform**  
- Automatizar deploys com **GitHub Actions**  

---

## 🧪 Tecnologias Utilizadas  

| Camada         | Tecnologias                |
|----------------|----------------------------|
| **Frontend**   | React + Docker             |
| **Backend**    | Node.js ou FastAPI         |
| **Infra**      | Terraform + Módulos AWS    |
| **CI/CD**      | GitHub Actions             |

---

## 🧩 Recursos Disponíveis  

| Serviço      | Módulo Terraform       | Status     |
|--------------|------------------------|------------|
| DynamoDB     | `terraform-aws-dynamodb` | ✅ Ativo    |
| DocumentDB   | `terraform-aws-documentdb` | ✅ Ativo    |
| SQS          | `terraform-aws-sqs`       | 🚧 Em teste |
| SNS          | `terraform-aws-sns`       | 🚧 Em teste |

---

## 📁 Estrutura do Repositório  

```plaintext
devops-alacarte/
├── frontend/          # Interface React
├── backend/           # API para gerar tfvars
├── modules/           # Módulos Terraform
│   ├── dynamodb/
│   ├── documentdb/
│   └── sqs/
├── tfvars-templates/  # Templates JSON
├── workflows/         # GitHub Actions
└── README.md
```

---

## ⚙️ Fluxo de Provisionamento  

1. Usuário acessa o portal e escolhe um recurso  
2. Preenche formulário dinâmico  
3. Backend gera o arquivo `.tfvars.json`  
4. GitHub Actions aplica o Terraform com base no módulo e parâmetros  

---

## 📜 Exemplo de `.tfvars.json`  

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

---

## 🔐 Segurança e Governança  
- Autenticação via OAuth  
- Limites de uso por ambiente  
- Auditoria de provisionamentos  

---

## 📈 Futuras Expansões  
- Suporte a múltiplas clouds  
- Templates de arquitetura  
- Integração com Slack/Teams  

---

## 🧪 Templates `.tfvars.json`  

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
```

### `documentdb.tfvars.json`  
```json
{
  "cluster_identifier": "",
  "instance_class": "db.r5.large",
  "engine_version": "4.0.0",
  "master_username": "",
  "master_password": "",
  "tags": {
    "owner": "",
    "env": "dev"
  }
}
```

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
```

---
✍️ **Autor**: Silas Marcos de Souza
