# ⚡ Instalação Rápida - 3 Opções

## 🥇 OPÇÃO 1: GitHub Actions (RECOMENDADO - Não precisa instalar nada!)

**Tempo:** 10 minutos | **Dificuldade:** ⭐ Fácil

1. **Crie conta no GitHub** (grátis): [github.com/signup](https://github.com/signup)

2. **Crie um novo repositório:**
   - Clique em **"+"** → **"New repository"**
   - Nome: `MusicStudioPro`
   - Clique **"Create repository"**

3. **Faça upload dos arquivos:**
   - Clique em **"Add file"** → **"Upload files"**
   - Arraste a pasta `app/` e `.github/`
   - Clique **"Commit changes"**

4. **Aguarde o build:**
   - Clique na aba **"Actions"**
   - Espere 5-10 minutos até ficar verde ✅

5. **Baixe o APK:**
   - Clique no workflow terminado
   - Vá em **"Artifacts"** → **"MusicStudioPro-APK"**
   - Descompacte e instale no celular!

📖 **Guia completo:** Veja `GITHUB_BUILD.md`

---

## 🥈 OPÇÃO 2: Build Local (Precisa instalar ferramentas)

**Tempo:** 30 minutos | **Dificuldade:** ⭐⭐⭐ Médio

### Instalar dependências:

**Windows:**
```powershell
# 1. Instale o Node.js: https://nodejs.org (versão 20+)
# 2. Instale o Java JDK 17: https://adoptium.net
# 3. Instale o Android Studio: https://developer.android.com/studio

# 4. Configure variáveis de ambiente:
[Environment]::SetEnvironmentVariable("ANDROID_HOME", "$env:LocalAppData\Android\Sdk", "User")
[Environment]::SetEnvironmentVariable("JAVA_HOME", "C:\Program Files\Eclipse Adoptium\jdk-17", "User")
```

**Linux/Mac:**
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install -y nodejs npm openjdk-17-jdk

# macOS
brew install node openjdk@17
```

### Compilar:

```bash
# Extrair projeto
tar -xzf MusicStudioPro-Complete.tar.gz
cd MusicStudioPro/app

# Instalar dependências
npm install

# Build
npm run build
npx cap sync android
cd android
./gradlew assembleDebug

# APK gerado em:
# android/app/build/outputs/apk/debug/app-debug.apk
```

---

## 🥉 OPÇÃO 3: Serviço Online (Sem GitHub)

**Tempo:** 15 minutos | **Dificuldade:** ⭐⭐ Médio

Use serviços como:
- **Buildozer** (para Python/Kivy)
- **Ionic Appflow** (pago)
- **Firebase App Distribution**

Ou peça para um amigo desenvolvedor compilar para você!

---

## 📱 Como Instalar o APK no Android

### Método 1: Direto no celular
1. Transfira o APK (USB, email, WhatsApp, Drive)
2. Abra o arquivo no celular
3. Toque **"Instalar"**
4. Permita "Fontes desconhecidas" se pedir
5. ✅ Pronto!

### Método 2: Pelo computador (ADB)
```bash
# Instale o ADB: https://developer.android.com/studio/releases/platform-tools
adb install app-debug.apk
```

---

## ❓ Dúvidas Frequentes

**P: Dá para instalar sem computador?**  
R: Sim! Use a Opção 1 (GitHub Actions) e baixe direto no celular.

**P: Precisa de root?**  
R: Não! Funciona em qualquer Android 8.0+.

**P: É seguro?**  
R: Sim! O código é aberto e você mesmo compila.

**P: Funciona offline?**  
R: Sim! Todo o processamento é local no celular.

---

## 🆘 Precisa de Ajuda?

Se tiver problemas:
1. Verifique se o celular tem Android 8.0+
2. Libere espaço (precisa de 100MB livres)
3. Ative "Fontes desconhecidas" nas configurações

---

**🎉 Recomendamos fortemente a OPÇÃO 1 (GitHub Actions) - é gratuita e não precisa instalar nada!**
