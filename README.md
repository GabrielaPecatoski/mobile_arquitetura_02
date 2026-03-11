# Questionário de Reflexão (Atividade 2)

## 1️-Em qual camada foi implementado o mecanismo de cache?
R: O cache foi implementado no datasources, dentro do `Product_Cache_Datasource`.
Essa camada é responsável pelo gerenciamento das fontes de dados da aplicação, como APIs, banco de dados e armazenamento local. Com isso, o cache funciona como uma fonte alternativa de dados, permitindo reutilizar informações previamente carregadas quando a API não estiver disponível.

## 2️- Por que o ViewModel não deve realizar chamadas HTTP diretamente?
R: O ViewModel não deve realizar chamadas HTTP diretamente porque isso quebraria o princípio de separação de responsabilidades. 

## 3️- O que poderia acontecer se a interface acessasse diretamente o DataSource?
R: A arquitetura em camadas seria quebrada, haveria forte acoplamento entre interface e acesso a dados, o código se tornaria mais difícil de manter e mudanças na fonte de dados exigiriam alterações na interface.

##4- Como essa arquitetura facilitaria a substituição da API por um banco de dados local?
R: O ViewModel acessa os dados através do Repository, utilizando o método repository.getProducts(), O que significa que o ViewModel não sabe de onde os dados vêm, porém se fosse necessário substituir a API por um banco de dados local, deveria criar um LocalDatasource e alterar a implementação do Repository. Com isso, a interface e o ViewModel não precisariam ser modificados, demonstrando a vantagem da arquitetura em camadas.

# 📱 Mobile Arquitetura 02

Aplicação Flutter desenvolvida para a disciplina **Desenvolvimento para Dispositivos Móveis II**, com foco na aplicação de **arquitetura em camadas** e boas práticas de desenvolvimento.

A aplicação consome a **Fake Store API** para listar produtos e foi evoluída com melhorias arquiteturais como tratamento de erros, estado de carregamento e cache local.

---

Disciplina: **Desenvolvimento para Dispositivos Móveis II**
Professor: **Jefferson Rodrigo Speck**

---

# 📚 API Utilizada

Fake Store API

https://fakestoreapi.com/products

Essa API fornece uma lista de produtos com informações como:

* id
* title
* price
* image

---

# 🎯 Objetivo da Atividade

Refatorar a aplicação Flutter adicionando funcionalidades essenciais em aplicações modernas:

* indicador de carregamento da interface
* tratamento de erros
* mecanismo simples de cache local

Essas melhorias demonstram como a **arquitetura em camadas facilita a evolução do sistema** sem comprometer sua organização.

---

# 🏗️ Arquitetura do Projeto

O projeto segue uma estrutura inspirada em **Clean Architecture** e **MVVM**.

```
lib/
│
├── core
│   └── errors
│       └── failure.dart
│
├── data
│   ├── datasources
│   │   ├── product_remote_datasource.dart
│   │   └── product_cache_datasource.dart
│   │
│   └── repositories
│       └── product_repository_impl.dart
│
├── domain
│   ├── entities
│   │   └── product.dart
│   │
│   └── repositories
│       └── product_repository.dart
│
└── presentation
    ├── pages
    │   └── product_page.dart
    │
    └── viewmodels
        ├── product_viewmodel.dart
        └── product_state.dart
```

---

# ⚙️ Funcionalidades Implementadas

## 🔄 Estado de carregamento

Foi criado um `ProductState` responsável por representar o estado da interface:

* carregando dados
* erro ao carregar
* produtos carregados com sucesso

Isso permite que a interface reaja dinamicamente às mudanças de estado.

---

## ❌ Tratamento de erros

Foi criada uma classe de erro padronizada na camada **core**.

Arquivo:

```
lib/core/errors/failure.dart
```

Essa estrutura permite tratar erros de forma consistente em toda a aplicação.

---


# 🔁 Fluxo de funcionamento

1️⃣ O **ViewModel** solicita os produtos ao **Repository**

2️⃣ O **Repository** tenta buscar os dados na **API**

3️⃣ Se a API responder:

* os dados são salvos no **cache**
* os produtos são retornados

4️⃣ Se a API falhar:

* o sistema verifica se existe **cache**
* se existir → usa os dados armazenados
* se não existir → retorna erro

---

# 🖥️ Comportamento da Interface

A interface reage ao estado do `ProductState`.

### ⏳ Carregando

Exibe um indicador de carregamento:

```
CircularProgressIndicator
```

### ❌ Erro

Exibe uma mensagem de erro na tela.

### 📦 Sucesso

Exibe uma lista de produtos contendo:

* nome
* preço

# 🚀 Tecnologias Utilizadas

* Flutter
* Dart
* FakeStore API
* Clean Architecture
* MVVM
