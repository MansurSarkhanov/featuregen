# 📦 feature_structure

**feature_structure** is a lightweight Dart CLI tool that helps you generate a clean, scalable feature-first folder structure for your Flutter projects.

If you follow a structure like `lib/features/feature_name/{domain,data,presentation}`, this tool will save you a ton of setup time.

---

## ✨ Features

- 📂 Auto-generates folders for `domain`, `data`, and `presentation`
- 🧱 Follows clean architecture pattern
- ⚡ Simple CLI usage — works in any Flutter project
- 🛠️ Zero configuration required

---

## 📁 Generated Structure

```bash
lib/
└── features/
    └── login/
        ├── domain/
        │   ├── entities/
        │   └── repositories/
        ├── data/
        │   ├── models/
        │   └── sources/
        └── presentation/
            ├── pages/
            └── widgets/
   ```          



 
## 🚀 Getting Started
1. Activate globally
```bash
dart pub global activate feature_structure
```
2. Run inside any Flutter project root
```bash
feature_structure create your_feature_name
```

This will generate the folder structure at lib/features/your_feature_name/.

⚠️ PATH Issue? (Important)

If you get this error:

command not found: feature_structure


Add this to your shell config file (~/.zshrc, ~/.bashrc, ~/.bash_profile):
```bash
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

Then restart your terminal (or run):
```bash
source ~/.zshrc
```

Try again:
```bash
feature_structure create login
```
💡 Coming Soon

Automatic template .dart file generation

Configurable structure (e.g. JSON or YAML-based)

VSCode extension