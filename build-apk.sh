#!/bin/bash

# Script para build do APK Music Studio Pro
# Requisitos: Java JDK 17+, Android SDK, Node.js 20+

set -e

echo "=========================================="
echo "Music Studio Pro - APK Build Script"
echo "=========================================="
echo ""

# Verificar dependências
command -v java >/dev/null 2>&1 || { echo "Erro: Java não encontrado. Instale o JDK 17+"; exit 1; }
command -v node >/dev/null 2>&1 || { echo "Erro: Node.js não encontrado. Instale o Node.js 20+"; exit 1; }
command -v npm >/dev/null 2>&1 || { echo "Erro: npm não encontrado"; exit 1; }

JAVA_VERSION=$(java -version 2>&1 | head -1 | cut -d'"' -f2)
echo "Java version: $JAVA_VERSION"

# Verificar se é JDK (tem javac)
if ! command -v javac >/dev/null 2>&1; then
    echo "Erro: JDK não encontrado. Instale o JDK completo (não apenas JRE)"
    echo "Ubuntu/Debian: sudo apt install openjdk-17-jdk"
    echo "macOS: brew install openjdk@17"
    exit 1
fi

echo "JDK encontrado: $(javac -version 2>&1)"
echo ""

# Configurar variáveis de ambiente se necessário
if [ -z "$ANDROID_HOME" ]; then
    if [ -d "$HOME/android-sdk" ]; then
        export ANDROID_HOME="$HOME/android-sdk"
    elif [ -d "$HOME/Android/Sdk" ]; then
        export ANDROID_HOME="$HOME/Android/Sdk"
    elif [ -d "/usr/lib/android-sdk" ]; then
        export ANDROID_HOME="/usr/lib/android-sdk"
    else
        echo "AVISO: ANDROID_HOME não definido e Android SDK não encontrado"
        echo "O Android SDK será baixado automaticamente na primeira execução"
    fi
fi

if [ -n "$ANDROID_HOME" ]; then
    export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools"
    echo "Android SDK: $ANDROID_HOME"
fi

echo ""
echo "=========================================="
echo "Instalando dependências..."
echo "=========================================="
cd "$(dirname "$0")/app"
npm install

echo ""
echo "=========================================="
echo "Build do projeto React..."
echo "=========================================="
npm run build

echo ""
echo "=========================================="
echo "Sincronizando com Android..."
echo "=========================================="
npx cap sync android

echo ""
echo "=========================================="
echo "Build do APK..."
echo "=========================================="
cd android

# Dar permissão ao gradlew (Linux/Mac)
if [ -f "./gradlew" ]; then
    chmod +x ./gradlew
    ./gradlew assembleDebug
else
    echo "Erro: gradlew não encontrado"
    exit 1
fi

echo ""
echo "=========================================="
echo "Build concluído!"
echo "=========================================="
echo ""
echo "APK gerado em:"
echo "  app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "Para instalar no dispositivo:"
echo "  adb install app/build/outputs/apk/debug/app-debug.apk"
echo ""

# Copiar APK para diretório de saída
if [ -f "app/build/outputs/apk/debug/app-debug.apk" ]; then
    cp app/build/outputs/apk/debug/app-debug.apk ../MusicStudioPro-debug.apk
    echo "APK também copiado para: MusicStudioPro-debug.apk"
fi
