<?php
// Упражнение 2: Функции

// Простая функция
function greet($name) {
    return "Привет, " . $name . "!";
}

// Функция с несколькими параметрами
function calculate_gpa($grades) {
    $total = 0;
    foreach ($grades as $grade) {
        $total += $grade;
    }
    return $total / count($grades);
}

// Функция проверки
function is_passing($gpa) {
    return $gpa >= 2.0 ? "Сдал" : "Не сдал";
}

// Запускаем функции
echo greet("Umed") . "\n";

$my_grades = [85, 90, 78, 92, 88];
$gpa = calculate_gpa($my_grades);

echo "Средний балл: " . $gpa . "\n";
echo "Статус: " . is_passing($gpa) . "\n";
?>