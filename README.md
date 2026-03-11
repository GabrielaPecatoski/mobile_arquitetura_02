# Atividade Guiada 2 – Refatoração Arquitetural

## 📱 Desenvolvimento para Dispositivos Móveis II

**Professor:** Jefferson Rodrigo Speck

---

## 📖 Descrição

Após a implementação inicial da aplicação Flutter que consome a API de produtos, foi realizada uma **refatoração arquitetural** para adicionar funcionalidades essenciais presentes em aplicações modernas.

Esta atividade tem como objetivo melhorar a estrutura do sistema e a experiência do usuário através da implementação de:

* tratamento de erros
* estado de carregamento da interface
* mecanismo simples de cache local

Essas melhorias demonstram como a **arquitetura em camadas** facilita a evolução do sistema sem comprometer sua organização.

A aplicação utiliza a API:

https://fakestoreapi.com/products

---

# 🎯 Objetivo da Atividade

Refatorar o projeto Flutter para que ele seja capaz de:

* Informar ao usuário quando os dados estão sendo carregados
* Tratar falhas de comunicação com a API
* Utilizar dados previamente carregados quando não houver conexão com a API

---

# 🏗️ Arquitetura Utilizada

O projeto segue uma estrutura em camadas inspirada em **Clean Architecture**:

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

Foi criado um **ProductState** que representa o estado da interface:

* carregando dados
* erro ao carregar
* produtos carregados com sucesso

Isso permite que a interface reaja dinamicamente ao estado atual da aplicação.

---

## ❌ Tratamento de erros

Foi criada uma estrutura de erro padronizada na camada **core**:

```
lib/core/errors/failure.dart
```

Essa classe representa falhas na aplicação e pode ser utilizada em diferentes camadas do sistema.

---

# 🚀 Resultado Esperado

Após a refatoração, a aplicação deve:

* mostrar indicador de carregamento ao buscar dados
* tratar falhas de comunicação com a API
* utilizar dados em cache caso a API esteja indisponível
* manter a arquitetura organizada em camadas

---

# 🛠️ Tecnologias Utilizadas

* Flutter
* Dart
* FakeStore API
* MVVM

---

# 📚 API utilizada

Fake Store API

https://fakestoreapi.com/products
