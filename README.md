# Music Studio Pro - Aplicativo de Produção Musical

Um aplicativo completo de produção musical para Android, inspirado nas imagens fornecidas.

## Funcionalidades

### Equalizador Gráfico
- 31 bandas de frequência (20Hz - 4kHz)
- Controles independentes para canal LEFT/RIGHT
- Visualização em tempo tempo
- Botão RESET para restaurar configurações

### Módulos de Efeitos (FX)
- **Tremolo**: Controles de frequência, fade, phase e intensity
- **D-Delay**: Delay digital com controles de tempo e feedback
- **SPACE**: Reverb com designer de algoritmos
- **VCA-COMP**: Compressor dinâmico profissional
- **Warmth**: Saturação de válvula para coloração

### Mixer de 9 Tracks
- 9 canais independentes
- Controle de volume e pan
- Botões Mute e Solo
- Acesso rápido aos FX de cada track

### Teclado Virtual
- 5 oitavas completas (C-2 a C8)
- Pitch Bend e Modulation wheels
- Sustain pedal
- Teclas brancas e pretas responsivas

### Drum Pads
- 16 pads editáveis
- 4 páginas de pads
- Edição de som, velocity e volume
- Modo MIDI Learn

### Biblioteca de Soundfonts
- 16 categorias de instrumentos
- Piano, Rhodes, Organ, Strings, Brass, etc.
- Sistema de download
- Mais de 210 soundfonts disponíveis

### Live Set Edit
- Gerenciamento de presets
- 4 bancos de usuário
- 4 páginas por banco
- 16 slots por página

### Configurações Avançadas
- Sample Rate configurável (44.1kHz - 96kHz)
- Buffer Size (64 - 1024 frames)
- Polyphony (1 - 500 voices)
- Velocity Curve (Soft, Linear, Medium, Hard)
- Master Tune
- Master Limiter
- Interpolation Quality
- Line Out

## Requisitos do Sistema

### Para executar o APK:
- Android 8.0 (API 26) ou superior
- 2GB de RAM mínimo
- 100MB de espaço livre

### Para compilar:
- Node.js 20+
- Java JDK 17+
- Android SDK (API 34)
- Gradle 8.5+

## Como Compilar

### Opção 1: Script Automático (Linux/Mac)

```bash
chmod +x build-apk.sh
./build-apk.sh
```

### Opção 2: Passo a Passo Manual

1. **Instalar dependências:**
```bash
cd app
npm install
```

2. **Build do projeto React:**
```bash
npm run build
```

3. **Sincronizar com Android:**
```bash
npx cap sync android
```

4. **Build do APK:**
```bash
cd android
./gradlew assembleDebug
```

O APK será gerado em:
```
android/app/build/outputs/apk/debug/app-debug.apk
```

## Instalação

### Via ADB:
```bash
adb install android/app/build/outputs/apk/debug/app-debug.apk
```

### Via arquivo:
1. Copie o APK para o dispositivo
2. Abra o arquivo no gerenciador de arquivos
3. Permita instalação de fontes desconhecidas se solicitado
4. Toque em "Instalar"

## Estrutura do Projeto

```
MusicStudioPro/
├── app/                    # Projeto React + Capacitor
│   ├── src/
│   │   ├── components/     # Componentes React
│   │   │   ├── equalizer/  # Equalizador gráfico
│   │   │   ├── fx/         # Módulos de efeitos
│   │   │   ├── mixer/      # Mixer de tracks
│   │   │   ├── keyboard/   # Teclado virtual
│   │   │   ├── drumpads/   # Drum pads
│   │   │   ├── settings/   # Configurações
│   │   │   ├── soundfonts/ # Biblioteca de sons
│   │   │   └── live-set/   # Live Set Edit
│   │   ├── store/          # Estado global (Context API)
│   │   ├── types/          # Tipos TypeScript
│   │   ├── App.tsx         # Componente principal
│   │   └── index.css       # Estilos globais
│   ├── android/            # Projeto Android nativo
│   ├── dist/               # Build de produção
│   └── package.json
├── build-apk.sh            # Script de build
└── README.md               # Este arquivo
```

## Tecnologias Utilizadas

- **React 18** - Framework UI
- **TypeScript** - Tipagem estática
- **Tailwind CSS** - Estilização
- **shadcn/ui** - Componentes UI
- **Capacitor** - Bridge para mobile
- **Android SDK** - Plataforma nativa

## Personalização

### Temas
O aplicativo usa um tema escuro por padrão. As cores principais são:
- Background: `#0f172a` (slate-900)
- Surface: `#1e293b` (slate-800)
- Primary: `#06b6d4` (cyan-500)
- Accent: `#8b5cf6` (violet-500)

### Configurações de Áudio
As configurações de áudio podem ser ajustadas em:
- Sample Rate: 44100, 48000, 88200, 96000 Hz
- Buffer Size: 64, 128, 256, 384, 512, 640, 768, 896, 1024 frames
- Latency: Ultra Low (4ms), Medium (8ms), High (16ms)

## Solução de Problemas

### Erro: "JAVA_COMPILER not found"
Instale o JDK completo (não apenas JRE):
```bash
# Ubuntu/Debian
sudo apt install openjdk-17-jdk

# macOS
brew install openjdk@17
```

### Erro: "ANDROID_HOME not set"
Configure a variável de ambiente:
```bash
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools
```

### Erro: "Gradle permission denied"
Dê permissão de execução:
```bash
chmod +x android/gradlew
```

## Licença

Este projeto é fornecido como está para fins educacionais e de demonstração.

## Créditos

Interface inspirada nas imagens fornecidas pelo usuário.
Desenvolvido com React, Capacitor e Android SDK.
