# Швидкий старт - MKM PACS

## 🚀 Швидке встановлення (5 хвилин)

### 1. Завантажте та встановіть

```bash
# Клонуйте репозиторій
git clone https://github.com/medakadem/cockpit-mkm-pacs.git
cd cockpit-mkm-pacs

# Встановіть залежності та зберіть
npm install
npm run build

# Встановіть в Cockpit
sudo ./install.sh
```

### 2. Відкрийте Cockpit

Перейдіть до `https://localhost:9090` та знайдіть "MKM PACS" в меню.

### 3. Налаштуйте сервер

За замовчуванням додаток підключається до `http://localhost:7070`. 
Якщо ваш PACS сервер працює на іншому порту, змініть налаштування в веб-інтерфейсі.

## 🔧 Розробка

```bash
# Автоматична перезбірка при змінах
npm run watch

# Перевірка коду
npm run lint

# Створення релізу
npm run release
```

## 📦 Публікація

```bash
# Завантаження в GitHub
npm run deploy

# Створення релізу
npm run release
```

## 🆘 Проблеми?

- **Cockpit не запущений**: `sudo systemctl start cockpit`
- **Помилка збірки**: `npm install && npm run build`
- **CORS помилки**: Додайте заголовки CORS до вашого PACS сервера

## 📖 Детальна документація

- [Повна інструкція встановлення](INSTALL.md)
- [Інструкції публікації](PUBLISHING.md)
- [Сприяння розробці](CONTRIBUTING.md) 