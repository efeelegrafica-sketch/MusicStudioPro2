# 🚀 Build Automático com GitHub Actions

Esta é a forma MAIS FÁCIL de gerar o APK sem precisar instalar nada no seu computador!

## 📋 Passo a Passo

### 1. Crie um Repositório no GitHub

1. Acesse [github.com](https://github.com) e faça login
2. Clique no botão **"+"** → **"New repository"**
3. Nomeie como `MusicStudioPro`
4. Deixe como **"Public"** (ou Private se preferir)
5. Clique em **"Create repository"**

### 2. Faça Upload dos Arquivos

#### Opção A: Via Web (Mais Fácil)

1. No seu repositório, clique em **"Add file"** → **"Upload files"**
2. Arraste e solte a pasta `app/` inteira
3. Certifique-se de que a pasta `.github/workflows/` também está incluída
4. Clique em **"Commit changes"**

#### Opção B: Via Git (Terminal)

```bash
# Extrair o projeto
tar -xzf MusicStudioPro-Complete.tar.gz
cd MusicStudioPro

# Inicializar git
git init
git add .
git commit -m "Initial commit"

# Conectar ao GitHub (substitua SEU_USUARIO)
git remote add origin https://github.com/SEU_USUARIO/MusicStudioPro.git
git branch -M main
git push -u origin main
```

### 3. Aguarde o Build Automático

1. No GitHub, clique na aba **"Actions"**
2. Você verá o workflow "Build APK" em execução
3. Aguarde 5-10 minutos (o build é feito automaticamente)
4. Quando terminar, o status ficará verde ✅

### 4. Baixe o APK

#### Opção A: Via Artifacts

1. Clique no workflow "Build APK" que terminou
2. Role para baixo até **"Artifacts"**
3. Clique em **"MusicStudioPro-APK"** para baixar
4. Descompacte o ZIP e instale o `app-debug.apk`

#### Opção B: Via Releases (Recomendado)

1. Clique na aba **"Releases"** no lado direito
2. Clique na versão mais recente (ex: v1)
3. Baixe o arquivo `app-debug.apk`
4. Transfira para o celular e instale!

---

## 📱 Instalação no Android

### Método 1: Direto no Celular

1. Transfira o APK para o celular (USB, email, WhatsApp, etc.)
2. Abra o arquivo no celular
3. Toque em **"Instalar"**
4. Se aparecer "Fontes desconhecidas", toque em **"Configurações"** e permita
5. Pronto! O app está instalado ✅

### Método 2: Via ADB (Computador)

```bash
# Conecte o celular via USB com depuração ativada
adb install app-debug.apk
```

---

## 🔄 Atualizações

Sempre que você fizer alterações no código e fizer push para o GitHub:

```bash
git add .
git commit -m "Nova versão"
git push
```

O GitHub Actions vai automaticamente:
1. Compilar o novo APK
2. Criar uma nova Release
3. Disponibilizar para download

---

## ⚙️ Configurações Opcionais

### Alterar Nome do App

Edite `app/capacitor.config.ts`:

```typescript
export default {
  appId: 'com.musicstudio.pro',
  appName: 'Music Studio Pro', // <-- Altere aqui
  webDir: 'dist'
};
```

### Alterar Versão

Edite `app/android/app/build.gradle`:

```gradle
android {
    defaultConfig {
        versionCode 1        // <-- Incremente
        versionName "1.0.0"  // <-- Altere
    }
}
```

### Build de Release (Assinado)

Para distribuir na Play Store, você precisa criar uma keystore:

```bash
cd app/android
keytool -genkey -v -keystore musicstudio.keystore -alias musicstudio -keyalg RSA -keysize 2048 -validity 10000
```

Depois configure no `build.gradle` e altere o workflow para:

```yaml
- name: Build Release APK
  working-directory: ./app/android
  run: ./gradlew assembleRelease
```

---

## 🐛 Problemas Comuns

### "Workflow not running"
- Verifique se o arquivo `.github/workflows/build-apk.yml` existe
- Vá em Actions → "I understand my workflows, go ahead and enable them"

### "Build failed"
- Clique no workflow que falhou
- Veja os logs para identificar o erro
- Geralmente é alguma dependência faltando

### "Artifact not found"
- O build pode ainda estar em andamento
- Aguarde o status ficar verde ✅

---

## 📞 Suporte

Se tiver problemas:
1. Verifique os logs do GitHub Actions
2. Confira se todos os arquivos foram enviados
3. Certifique-se de que o Node.js 20 está configurado

---

**Pronto! Agora você tem o APK sendo gerado automaticamente toda vez que atualizar o código! 🎉**
