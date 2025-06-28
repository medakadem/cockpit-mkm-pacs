# Інструкції по публікації MKM PACS Cockpit додатку

## 1. Підготовка до публікації

### 1.1 Оновлення версії
```bash
# Відредагуйте версію в package.json
npm version patch  # або minor, major
```

### 1.2 Тестування
```bash
npm run lint
npm run build
npm test  # якщо є тести
```

## 2. Публікація через GitHub

### 2.1 Створення репозиторію
1. Репозиторій вже створений: [https://github.com/medakadem/cockpit-mkm-pacs.git](https://github.com/medakadem/cockpit-mkm-pacs.git)
2. Завантажте код:
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/medakadem/cockpit-mkm-pacs.git
git push -u origin main
```

### 2.2 Створення релізу
```bash
# Створіть реліз пакет
npm run release

# Завантажте файл на GitHub Releases
# Перейдіть до: https://github.com/medakadem/cockpit-mkm-pacs/releases
# Натисніть "Create a new release"
# Завантажте файл: release/cockpit-mkm-pacs-1.0.0.tar.gz
```

## 3. Публікація через npm (опціонально)

```bash
npm login
npm publish
```

## 4. Створення RPM пакету (для Red Hat/Fedora)

### 4.1 Створення .spec файлу
```bash
# Створіть файл cockpit-mkm-pacs.spec
```

### 4.2 Збірка RPM
```bash
rpmbuild -bb cockpit-mkm-pacs.spec
```

## 5. Публікація в Cockpit App Catalog

### 5.1 Підготовка метаданих
Створіть файл `metadata.json`:
```json
{
  "name": "mkm-pacs",
  "label": "MKM PACS",
  "description": "Monitor MKM PACS DICOM server health and metrics",
  "version": "1.0.0",
  "author": "MKM PACS Team",
  "license": "LGPL-2.1+",
  "homepage": "https://github.com/medakadem/cockpit-mkm-pacs",
  "repository": "https://github.com/medakadem/cockpit-mkm-pacs.git"
}
```

### 5.2 Відправка на розгляд
- Створіть issue в [cockpit-project/cockpit](https://github.com/cockpit-project/cockpit)
- Додайте посилання на ваш репозиторій
- Опишіть функціональність додатку

## 6. Альтернативні способи розповсюдження

### 6.1 Docker образ
```dockerfile
FROM cockpit/ws:latest
COPY dist/ /usr/share/cockpit/mkm-pacs/
```

### 6.2 Snap пакет
Створіть `snapcraft.yaml` для Ubuntu Snap Store

### 6.3 Flatpak
Створіть `org.cockpit.mkm-pacs.yml` для Flathub

## 7. Підтримка та документація

### 7.1 Створення документації
- `INSTALL.md` - детальні інструкції встановлення
- `CONTRIBUTING.md` - як сприяти розробці
- `CHANGELOG.md` - історія змін

### 7.2 Налаштування CI/CD
Створіть `.github/workflows/build.yml` для автоматичної збірки

## 8. Після публікації

1. **Тестування**: Перевірте встановлення на чистій системі
2. **Документація**: Оновіть README з правильними посиланнями
3. **Підтримка**: Відповідайте на issues та pull requests
4. **Оновлення**: Регулярно випускайте нові версії

## 9. Корисні команди

```bash
# Створення релізу
npm run release

# Перевірка коду
npm run lint

# Збірка для продакшену
npm run build

# Тестування встановлення
sudo ./release/install.sh
``` 