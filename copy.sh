#!/bin/bash

# Проверяем число аргументов. В случае ошибки - сообщаем пользователю и даём краткую инструкцию по работе со скриптом
if [ "$#" -ne 2 ]; then
    echo "Ошибка: неверное количество аргументов. Пример использования: $0 <входная_директория> <выходная_директория>"
    exit 1
fi

input_dir="$1"
output_dir="$2"

directories=$(find "$input_dir" -mindepth 1 -type d)

# Проверяем, существует ли входная аудитория
if [ ! -d "$input_dir" ]; then
    echo "Директория '$input_dir' не существует"
    exit 1
fi

# Создание выходной директории, если она не существует
mkdir -p "$output_dir"

# Получение списка файлов, находящихся непосредственно во входной директории
files=$(find "$input_dir" -maxdepth 1 -type f)

# Копирование файлов в выходную директорию
for file in $files; do
    filename=$(basename "$file")
    if [ -e "$output_dir/$filename" ]; then
        # Если файл с таким именем уже существует, добавляем к имени файла уникальный суффикс
        # Пример: если в обеих аудиториях существуем main.py, то в выходную скопируется main-1.py.
        # Если повторить действия с папками, то в выходной появится main-2.py и т.д.
        extension="${filename##*.}"
        filename="${filename%.*}"
        counter=1
        while [ -e "$output_dir/$filename-$counter.$extension" ]; do
            counter=$((counter + 1))
        done
        cp "$file" "$output_dir/$filename-$counter.$extension"
    else
        cp "$file" "$output_dir/$filename"
    fi
done

# Получение списка всех файлов, вложенных во входную директорию, и копирование их в выходную директорию
nested_files=$(find "$input_dir"  -mindepth 2 -type f)

# Идем по списку файлов и каждый из них копируем
for file in $nested_files; do
    filename=$(basename "$file")

    # Проверка наличия файла с таким же именем в выходной директории
    if [ -e "$output_dir/$filename" ]; then
        # Если файл с таким именем уже существует, добавляем к имени файла уникальный суффикс
        # Пример: если в обеих аудиториях существуем main.py, то в выходную скопируется main-1.py.
        # Если повторить действия с папками, то в выходной появится main-2.py и т.д.
        extension="${filename##*.}"
        filename="${filename%.*}"
        counter=1
        while [ -e "$output_dir/$filename-$counter.$extension" ]; do
            counter=$((counter + 1))
        done
        cp "$file" "$output_dir/$filename-$counter.$extension"
    else
        cp "$file" "$output_dir/$filename"
    fi
done

echo "Копирование завершено успешно!"
