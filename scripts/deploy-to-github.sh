#!/bin/bash

# Скрипт для завантаження MKM PACS в GitHub
set -e

echo "=== MKM PACS GitHub Deployment ==="
echo ""

# Перевірка чи є git репозиторій
if [ ! -d ".git" ]; then
    echo "🔧 Ініціалізація git репозиторію..."
    git init
fi

# Додавання всіх файлів
echo "📁 Додавання файлів до git..."
git add .

# Створення commit
echo "💾 Створення commit..."
git commit -m "feat: Initial release of MKM PACS Cockpit application

- Add health monitoring for PACS server
- Add system metrics display
- Add server configuration interface
- Add comprehensive documentation
- Add build and deployment scripts"

# Налаштування remote (якщо ще не налаштовано)
if ! git remote get-url origin > /dev/null 2>&1; then
    echo "🔗 Налаштування remote origin..."
    git remote add origin https://github.com/medakadem/cockpit-mkm-pacs.git
fi

# Перевірка чи існує main branch
if ! git show-ref --verify --quiet refs/heads/main; then
    echo "🌿 Створення main branch..."
    git branch -M main
fi

# Push в GitHub
echo "🚀 Завантаження в GitHub..."
git push -u origin main

echo ""
echo "✅ Успішно завантажено в GitHub!"
echo "🌐 Репозиторій: https://github.com/medakadem/cockpit-mkm-pacs"
echo ""
echo "📋 Наступні кроки:"
echo "1. Перейдіть до https://github.com/medakadem/cockpit-mkm-pacs"
echo "2. Створіть перший реліз: npm run release"
echo "3. Завантажте файл з release/ на GitHub Releases"
echo "4. Опублікуйте посилання на репозиторій" 