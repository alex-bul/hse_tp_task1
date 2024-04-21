# ТЗ1: Bash-скрипт для копирования файлов

Этот скрипт на bash позволяет "выровнять" структуру директории, копируя все файлы из входной директории (и её поддиректорий) в выходную директорию без сохранения иерархии. *Если выходной директории не существует, то скрипт сам создаст её.*

## Использование

1. **Клонирование репозитория:**

    ```bash
    git clone https://github.com/alex-bul/hse_tp_task1.git
    ```

2. **Запуск скрипта:**

    Перейдите в каталог с клонированным репозиторием и выполните:

    ```bash
    sh copy.sh <входная_директория> <выходная_директория>
    ```

    Замените `<исходная_директория>` и `<выходная_директория>` соответственно путями к вашим входной и выходной директориям.

3. **Пример:**

   ```bash
    sh copy.sh /path/to/input_directory /path/to/output_directory
    ```
## Тестирование
В репозитории содержится папка, которая имитирует сложную файловую структуру
```
dir1
├── 1.txt
├── 4.txt
├── 6.txt
└── a
    ├── 2.txt
    ├── b
    │   ├── 3.txt
    │   └── 5.txt
    └── c
        └── 6.txt
```
После запуска 

```bash
sh copy.sh ./dir1 ./dir2
```
В текущей папке появится директория dir2 со следующей структурой:

```
dir2
├── 1.txt
├── 2.txt
├── 3.txt
├── 4.txt
├── 5.txt
├── 6-1.txt
└── 6.txt
```

## Автор

Бульбенков Александр (ВШЭ, бизнес-информатика, 1 курс, 233)
