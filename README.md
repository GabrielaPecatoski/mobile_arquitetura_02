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

## 💾 Cache local

Foi implementado um **cache simples em memória** para armazenar os produtos carregados anteriormente.

Arquivo:

```
lib/data/datasources/product_cache_datasource.dart
```

Caso a API esteja indisponível, o sistema utiliza os dados armazenados no cache.

---

# 🔁 Fluxo de funcionamento

1. O **ViewModel** solicita os produtos ao **Repository**
2. O **Repository** tenta buscar os dados na **API**
3. Se funcionar:

   * salva os dados no **cache**
   * retorna os produtos
4. Se falhar:

   * verifica se existe **cache**
   * se existir → usa o cache
   * se não existir → retorna erro

---

# 🖥️ Comportamento da Interface

A interface reage ao estado do `ProductState`:

### ⏳ Carregando

Exibe:

```
CircularProgressIndicator
```

### ❌ Erro

Exibe:

```
Mensagem de erro na tela
```

### 📦 Sucesso

Exibe:

```
Lista de produtos
- nome
- preço
```

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
* Clean Architecture
* MVVM

---

# 📚 API utilizada

Fake Store API

https://fakestoreapi.com/products
