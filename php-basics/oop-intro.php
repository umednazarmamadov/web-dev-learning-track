<?php
// Упражнение 3: Основы ООП

class Student {
    // Свойства
    public $name;
    public $university;
    public $grades = [];

    // Конструктор
    public function __construct($name, $university) {
        $this->name = $name;
        $this->university = $university;
    }

    // Добавить оценку
    public function add_grade($grade) {
        $this->grades[] = $grade;
    }

    // Посчитать средний балл
    public function get_gpa() {
        if (count($this->grades) == 0) return 0;
        return array_sum($this->grades) / count($this->grades);
    }

    // Вывести информацию
    public function get_info() {
        echo "Студент: " . $this->name . "\n";
        echo "Университет: " . $this->university . "\n";
        echo "Средний балл: " . $this->get_gpa() . "\n";
    }
}

// Создаём студента
$student = new Student("Umed", "RUDN University");
$student->add_grade(85);
$student->add_grade(90);
$student->add_grade(92);

$student->get_info();
?>