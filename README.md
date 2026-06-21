# database_1-postgresql
Relational database project
## Descrição
Este projeto consiste em um banco de dados relacional desenvolvido em PostgreSQL para gerenciamento de documentos e seus respectivos despachos.

O sistema permite classificar documentos por tipo e registrar despachos associados, garantindo integridade referencial entre as tabelas.

---

## Tecnologias
- PostgreSQL
- SQL

- ---

- ## Estrutura do Banco

### Tabelas principais:

- **tipo_documento**
  - nr (PK)
  - nome

- **documento**
  - numero (PK)
  - nome
  - tipo (FK → tipo_documento.nr)

- **tipo_despacho**
  - nr (PK)
  - nome

- **despacho**
  - numero (PK)
  - despacho
  - documento (FK → documento.numero)
  - tipo (FK → tipo_despacho.nr)

---

## Relacionamentos

- Um **tipo_documento** pode estar associado a vários **documentos** (1:N)
- Um **documento** pode possuir vários **despachos** (1:N)
- Um **tipo_despacho** pode estar associado a vários **despachos** (1:N)

---

## Volume de Dados

O projeto foi originalmente concebido para suportar **grande volume de dados**, com aproximadamente:

**15 milhões de registros**

Devido a esse volume, o dump completo do banco pode ser extremamente pesado e não é adequado para versionamento no GitHub.

---

## Otimização de Performance

Para melhorar a performance das consultas, foi criada uma indexação:

```sql
CREATE INDEX inddoc ON public.despacho (documento);
