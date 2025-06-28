# GitHub Actions Setup

## Огляд

Цей проект використовує GitHub Actions для автоматичної збірки, тестування та створення релізів.

## Workflow файли

### 1. `ci.yml` - Основний CI
- **Тригери**: push до main, pull requests
- **Функції**: 
  - Встановлення залежностей
  - Перевірка коду (lint)
  - Збірка додатку
  - Перевірка результатів збірки

### 2. `build.yml` - Повна збірка
- **Тригери**: push до main, pull requests, релізи
- **Функції**:
  - Тестування на різних версіях Node.js (16.x, 18.x, 20.x)
  - Збірка артефактів
  - Автоматичне створення релізів

### 3. `build-windows.yml` - Windows збірка
- **Тригери**: push до main, pull requests, релізи
- **Функції**:
  - Збірка на Windows runners
  - Створення Windows-специфічних релізів

## Налаштування

### 1. Включення Actions

1. Перейдіть до Settings > Actions > General
2. Виберіть "Allow all actions and reusable workflows"
3. Збережіть налаштування

### 2. Налаштування Secrets

Для автоматичного створення релізів потрібно налаштувати:

```bash
# GITHUB_TOKEN автоматично доступний
# Додаткові secrets можна додати в Settings > Secrets and variables > Actions
```

### 3. Permissions

Переконайтеся, що workflow має необхідні permissions:

```yaml
permissions:
  contents: read
  actions: read
  packages: write  # для публікації npm пакетів (опціонально)
```

## Вирішення проблем

### Помилка з застарілими actions

Якщо бачите помилку про застарілі actions:

```yaml
# Замість
- uses: actions/upload-artifact@v3

# Використовуйте
- uses: actions/upload-artifact@v4
```

### Помилка з Node.js версією

Якщо потрібна інша версія Node.js:

```yaml
- name: Use Node.js
  uses: actions/setup-node@v4
  with:
    node-version: '18.x'  # змініть на потрібну версію
```

### Помилка з npm cache

Якщо є проблеми з кешем:

```yaml
- name: Use Node.js
  uses: actions/setup-node@v4
  with:
    node-version: '18.x'
    cache: 'npm'  # або видаліть цей рядок
```

## Локальне тестування

Для тестування workflow локально:

```bash
# Встановіть act (для Linux/macOS)
curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

# Запустіть workflow
act -j test
```

## Корисні команди

```bash
# Перевірка статусу Actions
gh run list

# Перегляд логів
gh run view <run-id>

# Перезапуск failed workflow
gh run rerun <run-id>
```

## Налаштування для різних платформ

### Linux
- Використовує `ubuntu-latest`
- Створює `.tar.gz` архіви

### Windows
- Використовує `windows-latest`
- Створює `.zip` архіви

### macOS (опціонально)
Додайте в `build.yml`:

```yaml
build-macos:
  runs-on: macos-latest
  # ... інші кроки
```

## Моніторинг

- **Actions tab**: Перегляд всіх запусків
- **Insights**: Аналітика використання
- **Settings > Actions**: Налаштування та permissions

## Безпека

- Використовуйте `GITHUB_TOKEN` замість personal tokens
- Обмежуйте permissions до мінімуму необхідних
- Регулярно оновлюйте actions до останніх версій 