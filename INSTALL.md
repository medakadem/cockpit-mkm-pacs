# Інструкції встановлення MKM PACS Cockpit додатку

## Швидке встановлення

### Linux/Unix системи

1. **Завантажте та розпакуйте**:
   ```bash
   wget https://github.com/medakadem/cockpit-mkm-pacs/releases/latest/download/cockpit-mkm-pacs.tar.gz
   tar -xzf cockpit-mkm-pacs.tar.gz
   cd cockpit-mkm-pacs
   ```

2. **Встановіть залежності та зберіть**:
   ```bash
   npm install
   npm run build
   ```

3. **Запустіть встановлення**:
   ```bash
   sudo ./install.sh
   ```

### Windows системи

1. **Завантажте та розпакуйте** ZIP файл
2. **Відкрийте PowerShell як Administrator**
3. **Встановіть залежності та зберіть**:
   ```powershell
   npm install
   npm run build
   ```
4. **Запустіть встановлення**:
   ```powershell
   .\install.bat
   ```

## Ручне встановлення

### Linux/Unix

```bash
# Зберіть додаток
npm install
npm run build

# Скопіюйте файли
sudo cp -r dist /usr/share/cockpit/mkm-pacs

# Встановіть права доступу
sudo chown -R root:root /usr/share/cockpit/mkm-pacs
sudo chmod -R 755 /usr/share/cockpit/mkm-pacs

# Перезапустіть Cockpit
sudo systemctl restart cockpit
```

### Windows

```powershell
# Зберіть додаток
npm install
npm run build

# Скопіюйте файли (як Administrator)
xcopy /E /I /Y dist "C:\Program Files\Cockpit\mkm-pacs"
```

## Вимоги

### Системні вимоги
- **Cockpit**: Встановлений та запущений
- **Node.js**: Версія 14 або вище
- **npm**: Для збірки додатку

### Встановлення Cockpit

#### Ubuntu/Debian
```bash
sudo apt update
sudo apt install cockpit
sudo systemctl enable --now cockpit.socket
```

#### CentOS/RHEL/Fedora
```bash
sudo yum install cockpit
sudo systemctl enable --now cockpit.socket
```

#### Windows
Завантажте Cockpit з офіційного сайту або використовуйте WSL.

## Перевірка встановлення

1. **Відкрийте браузер**: `https://localhost:9090`
2. **Увійдіть в систему** з вашими обліковими даними
3. **Знайдіть "MKM PACS"** в меню зліва
4. **Перевірте підключення** до вашого PACS сервера

## Налаштування

### Зміна сервера за замовчуванням
За замовчуванням додаток підключається до `http://localhost:7070`

Щоб змінити налаштування:
1. Відкрийте MKM PACS в Cockpit
2. Натисніть "Configure" в розділі "Server Configuration"
3. Введіть новий host та port
4. Натисніть "Save"

### API Endpoints
Додаток очікує наступні endpoints:
- `GET http://<server>:<port>/api/monitoring/health`
- `GET http://<server>:<port>/api/monitoring/metrics`

## Видалення

### Linux/Unix
```bash
sudo rm -rf /usr/share/cockpit/mkm-pacs
sudo systemctl restart cockpit
```

### Windows
Видаліть папку: `C:\Program Files\Cockpit\mkm-pacs`

## Усунення проблем

### Помилка "Cockpit is not running"
```bash
sudo systemctl start cockpit
sudo systemctl enable cockpit.socket
```

### Помилка "Build files not found"
```bash
npm install
npm run build
```

### Помилка CORS
Додайте заголовки CORS до вашого PACS сервера:
```
Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: GET, POST, OPTIONS
Access-Control-Allow-Headers: Content-Type
```

### Додаток не з'являється в меню
1. Перевірте права доступу: `ls -la /usr/share/cockpit/mkm-pacs`
2. Перезапустіть Cockpit: `sudo systemctl restart cockpit`
3. Очистіть кеш браузера

## Підтримка

- **GitHub Issues**: [Створіть issue](https://github.com/medakadem/cockpit-mkm-pacs/issues)
- **Документація**: [README.md](README.md)
- **Ліцензія**: LGPL v2.1+ 