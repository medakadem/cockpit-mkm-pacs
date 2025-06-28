# Changelog

Всі важливі зміни в цьому проекті будуть документуватися в цьому файлі.

Формат базується на [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
і цей проект дотримується [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Додати підтримку WebSocket для real-time оновлень
- Додати графіки для історичних даних
- Додати підтримку множинних серверів
- Додати експорт даних в CSV/JSON

## [1.0.0] - 2025-01-XX

### Added
- Початковий реліз MKM PACS Cockpit додатку
- Моніторинг здоров'я сервера через `/api/monitoring/health`
- Відображення системних метрик через `/api/monitoring/metrics`
- Конфігурація сервера через веб-інтерфейс
- Автоматичне оновлення даних
- Обробка помилок та відображення статусів
- Responsive дизайн з PatternFly CSS
- Підтримка Linux та Windows

### Features
- **Health Status**: Відображення статусу здоров'я та uptime
- **System Metrics**: CPU time, memory usage, database size, upload statistics
- **Server Configuration**: Налаштування host та port
- **Error Handling**: Комплексна обробка та відображення помилок
- **Auto-refresh**: Можливість ручного оновлення даних

### Technical
- React 18.2.0 компоненти
- Webpack 5 збірка
- ESLint для якості коду
- Babel для транспіляції
- PatternFly 4 для UI

## [0.1.0] - 2025-01-XX

### Added
- Базова структура проекту
- Налаштування webpack та babel
- Основні React компоненти
- Cockpit manifest файл

---

## Типи змін

- **Added** для нових функцій
- **Changed** для змін в існуючій функціональності
- **Deprecated** для функцій, які будуть видалені
- **Removed** для видалених функцій
- **Fixed** для виправлення помилок
- **Security** для виправлень безпеки 