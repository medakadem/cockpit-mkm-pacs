# MKM PACS - Cockpit Application

[![CI](https://github.com/medakadem/cockpit-mkm-pacs/actions/workflows/ci.yml/badge.svg)](https://github.com/medakadem/cockpit-mkm-pacs/actions/workflows/ci.yml)
[![Build and Test](https://github.com/medakadem/cockpit-mkm-pacs/actions/workflows/build.yml/badge.svg)](https://github.com/medakadem/cockpit-mkm-pacs/actions/workflows/build.yml)

Моніторинг сервера MKM PACS DICOM через Cockpit.

## Встановлення

### Швидке встановлення (для користувачів)

1. **Завантажте та розпакуйте**:
   ```bash
   wget https://github.com/medakadem/cockpit-mkm-pacs/releases/latest/download/cockpit-mkm-pacs.tar.gz
   tar -xzf cockpit-mkm-pacs.tar.gz
   cd cockpit-mkm-pacs
   ```

2. **Встановіть в Cockpit**:
   ```bash
   sudo cp -r dist /usr/share/cockpit/mkm-pacs
   sudo systemctl restart cockpit
   ```

3. **Відкрийте Cockpit** у браузері: `https://localhost:9090`

### Встановлення з вихідного коду (для розробників)

1. **Клонуйте репозиторій**:
   ```bash
   git clone https://github.com/medakadem/cockpit-mkm-pacs.git
   cd cockpit-mkm-pacs
   ```

2. **Встановіть залежності**:
   ```bash
   npm install
   ```

3. **Зберіть додаток**:
   ```bash
   npm run build
   ```

4. **Встановіть в Cockpit**:
   ```bash
   mkdir -p ~/.local/share/cockpit
   ln -sf $(pwd)/dist ~/.local/share/cockpit/mkm-pacs
   ```

## API Endpoints

Додаток моніторить наступні endpoints:

- **Health Status**: `GET http://localhost:7070/api/monitoring/health`
- **System Metrics**: `GET http://localhost:7070/api/monitoring/metrics`

## Конфігурація

За замовчуванням додаток підключається до `localhost:7070`. 
Ви можете змінити налаштування сервера через веб-інтерфейс.

## Розробка

```bash
npm run watch    # Автоматична перезбірка при змінах
npm run lint     # Перевірка коду
npm run build    # Збірка для продакшену
```

## CI/CD

Проект використовує GitHub Actions для автоматичної збірки та тестування:

- **CI**: Автоматична перевірка коду при кожному push/PR
- **Build**: Збірка для різних платформ (Linux, Windows)
- **Release**: Автоматичне створення релізів

## Ліцензія

LGPL v2.1+

## Features

- **Health Monitoring**: Real-time health status and uptime monitoring
- **System Metrics**: CPU time, memory usage, database size, upload statistics
- **Configurable Server**: Easy configuration of server host and port
- **Auto-refresh**: Manual refresh capability for real-time data
- **Error Handling**: Comprehensive error reporting and display

## Usage

1. Open Cockpit in your browser
2. Navigate to the "MKM PACS" menu item
3. Configure your server settings if needed
4. View real-time health status and metrics
5. Use the "Refresh Data" button to update information

## Troubleshooting

### Common Issues

1. **CORS Errors**: Ensure your PACS server allows cross-origin requests from the Cockpit domain
2. **Connection Refused**: Verify the server host and port are correct
3. **Build Errors**: Make sure all dependencies are installed with `npm install`

### Debug Mode

For development, you can run the application in watch mode:
```bash
npm run watch
```

This will automatically rebuild the application when you make changes to the source code.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and linting
5. Submit a pull request

## License

This project is licensed under the LGPL v2.1+ license.

## Support

For issues and questions, please refer to the Cockpit documentation or create an issue in the project repository. 