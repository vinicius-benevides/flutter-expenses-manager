# 💸 Expenses Manager - App Flutter de Controle de Despesas

Este é um projeto prático de **controle de despesas pessoais**, desenvolvido com o objetivo de praticar a construção de interfaces ricas, responsivas e adaptáveis usando **Flutter** e **Dart**.

---

## 🎯 Objetivo

O aplicativo foi criado com foco educacional e funcional, para consolidar conhecimentos sobre:

* 📱 Criação de interfaces adaptativas para Android e iOS
* 🔄 Gerenciamento de estado com `StatefulWidget`
* 🧩 Componentização e reutilização de widgets
* 💾 Manipulação e exibição de listas dinâmicas
* 🧠 Aplicação de boas práticas de arquitetura Flutter
* 📊 Visualização de dados com gráficos e resumos

---

## 📸 Capturas de Tela

<p float="left">
  <img src="https://github.com/user-attachments/assets/631fbeb5-f22c-4cb0-943f-b631ecedddec" width="45%" />
  <img src="https://github.com/user-attachments/assets/59a5e4fe-3786-4b8d-a8ba-a2c7502bfc7b" width="45%" />
</p>
<p float="left">
  <img src="https://github.com/user-attachments/assets/8486536c-e1cf-4da8-94ae-124adab2abde" width="45%" />
  <img src="https://github.com/user-attachments/assets/e7bcd789-f9ed-412b-b743-61b6a6754453" width="45%" />
</p>

---

## 🧠 Como funciona

O app permite que o usuário:

* Adicione novas transações (com título, valor e data)
* Visualize uma lista de todas as transações
* Exclua transações individualmente
* Veja um gráfico com o total de despesas dos últimos 7 dias
* Alterne entre lista e gráfico no modo paisagem (landscape)

Principais funcionalidades:

✅ Interface adaptativa com widgets Cupertino e Material

✅ Tema personalizado com `ThemeData`

✅ Gráfico de barras com resumo semanal

✅ Responsividade e adaptação automática à orientação da tela

✅ Formulário de entrada adaptável ao teclado

---

## 🧩 Estrutura do Projeto

```bash
lib/
├── main.dart                               # Ponto de entrada da aplicação
├── models/
│   └── transaction.dart                    # Modelo de transação
├── pages/
│   └── home.dart                           # Página principal com lógica de estado
├── theme/
│   └── main.dart                           # Tema principal da aplicação
├── components/
│   ├── transaction_form/                   # Formulário de nova transação
│   │   └── transaction_form.dart
│   ├── transaction_list/                   # Listagem e card de transações
│   │   ├── transaction_list.dart
│   │   ├── transaction_card.dart
│   │   └── empty_list.dart
│   ├── chart/                              # Gráfico de despesas por dia
│   │   ├── chart.dart
│   │   └── chart_bar.dart
│   └── adaptative/                         # Componentes reutilizáveis e adaptativos
│       ├── adaptative_button.dart
│       ├── adaptative_date_picker.dart
│       └── adaptative_text_field.dart
├── utils/
│   ├── format_currency.dart                # Utilitário para formatação de valores
│   ├── is_same_day.dart                    # Comparação de datas
│   └── capitalize.dart                     # Função auxiliar para capitalização
```

---

## 🚀 Como executar

### Pré-requisitos:

* ✅ [Flutter SDK](https://flutter.dev/docs/get-started/install)
* ✅ Editor de código (como [VS Code](https://code.visualstudio.com/) ou Android Studio)

### Passos:

1. Clone este repositório:

```bash
https://github.com/vinicius-benevides/flutter-expenses-manager.git
```

2. Instale as dependências do projeto:

```bash
flutter pub get
```

3. Execute a aplicação:

```bash
flutter run
```

> Certifique-se de estar com um emulador Android/iOS ou dispositivo conectado.

---

## 📘 Aprendizados

Durante o desenvolvimento deste projeto, foram aplicados e reforçados os seguintes conceitos:

* Separação de responsabilidades com arquivos e pastas organizados
* Composição de layouts com `Column`, `Row`, `Flexible`, `SizedBox`, etc.
* Responsividade com `MediaQuery`, `LayoutBuilder` e widgets adaptativos
* Criação de gráficos com `Stack`, `FractionallySizedBox` e `ChartBar`
* Controle de estado com `setState`
* Validação e manipulação de formulários

---

## 🛠️ Melhorias futuras

* 💾 Persistência de dados com SQLite ou Hive
* ☁️ Sincronização com armazenamento em nuvem (Firebase)
* 📈 Exportação de relatórios em PDF/Excel
* 🌗 Suporte a tema escuro (dark mode)
* 🌍 Internacionalização (i18n)
* 🔍 Filtros por categoria, valor ou data
* 📊 Gráficos com mais opções de visualização

