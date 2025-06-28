# Сприяння розробці MKM PACS

Дякуємо за інтерес до проекту MKM PACS Cockpit додатку! 

## Як сприяти

### Повідомлення про помилки

1. Перевірте, чи проблема вже не повідомлена в [Issues](https://github.com/medakadem/cockpit-mkm-pacs/issues)
2. Створіть нове issue з детальним описом проблеми
3. Включіть інформацію про:
   - Операційну систему
   - Версію Cockpit
   - Версію Node.js
   - Кроки для відтворення проблеми

### Запити функцій

1. Створіть issue з тегом `enhancement`
2. Опишіть бажану функціональність
3. Поясніть, чому ця функція корисна

### Pull Requests

1. **Fork** репозиторій
2. Створіть **feature branch**: `git checkout -b feature/amazing-feature`
3. Внесіть зміни та **commit**: `git commit -m 'Add amazing feature'`
4. **Push** до branch: `git push origin feature/amazing-feature`
5. Відкрийте **Pull Request**

## Стандарти коду

### JavaScript/React
- Використовуйте ES6+ синтаксис
- Дотримуйтесь Airbnb Style Guide
- Запускайте `npm run lint` перед commit
- Додавайте JSDoc коментарі для функцій

### CSS
- Використовуйте PatternFly класи де можливо
- Дотримуйтесь BEM методології для кастомних класів
- Мінімізуйте використання inline стилів

### Git
- Використовуйте зрозумілі commit повідомлення
- Формат: `type(scope): description`
- Приклади:
  - `feat(health): add uptime display`
  - `fix(metrics): resolve memory calculation error`
  - `docs(readme): update installation instructions`

## Налаштування середовища розробки

1. **Клонуйте репозиторій**:
   ```bash
   git clone https://github.com/medakadem/cockpit-mkm-pacs.git
   cd cockpit-mkm-pacs
   ```

2. **Встановіть залежності**:
   ```bash
   npm install
   ```

3. **Запустіть в режимі розробки**:
   ```bash
   npm run watch
   ```

4. **Встановіть в Cockpit для тестування**:
   ```bash
   mkdir -p ~/.local/share/cockpit
   ln -sf $(pwd)/dist ~/.local/share/cockpit/mkm-pacs
   ```

## Тестування

### Локальне тестування
```bash
npm run lint      # Перевірка коду
npm run build     # Збірка
npm run watch     # Автоматична перезбірка
```

### Тестування в Cockpit
1. Відкрийте `https://localhost:9090`
2. Знайдіть "MKM PACS" в меню
3. Перевірте всі функції
4. Тестуйте на різних браузерах

## Структура проекту

```
src/
├── components/          # React компоненти
│   ├── MKMPacs.js      # Головний компонент
│   ├── HealthStatus.js # Відображення здоров'я
│   ├── MetricsDisplay.js # Відображення метрик
│   └── ServerConfig.js # Конфігурація сервера
├── App.js              # Кореневий компонент
├── index.js            # Точка входу
├── index.html          # HTML шаблон
└── index.css           # Основні стилі
```

## API Endpoints

Додаток працює з наступними endpoints:
- `GET /api/monitoring/health` - статус здоров'я
- `GET /api/monitoring/metrics` - системні метрики

При додаванні нових endpoints:
1. Оновіть документацію
2. Додайте обробку помилок
3. Протестуйте з різними відповідями сервера

## Ліцензія

Співпрацюючи з проектом, ви погоджуєтесь, що ваші внески будуть ліцензовані під LGPL v2.1+.

## Контакти

- **Issues**: [GitHub Issues](https://github.com/medakadem/cockpit-mkm-pacs/issues)
- **Discussions**: [GitHub Discussions](https://github.com/medakadem/cockpit-mkm-pacs/discussions)

Дякуємо за сприяння! 🚀 