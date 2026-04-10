<?php
// Упражнение 1: Переменные и типы данных

// Строки
$name = "Umed";
$university = "RUDN University";

// Числа
$age = 21;
$gpa = 3.8;

// Булевые значения
$is_student = true;

// Вывод информации
echo "Имя: " . $name . "\n";
echo "Университет: " . $university . "\n";
echo "Возраст: " . $age . "\n";
echo "GPA: " . $gpa . "\n";
echo "Студент: " . ($is_student ? "Да" : "Нет") . "\n";

// Массив
$skills = ["HTML", "CSS", "JavaScript", "PHP"];

echo "\nМои навыки:\n";
foreach ($skills as $skill) {
    echo "- " . $skill . "\n";
}
?>