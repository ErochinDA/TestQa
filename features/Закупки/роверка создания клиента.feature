﻿#language: ru

@tree

Функционал: проверка создания клиента

Как Оператор я хочу
создать клиента
чтобы вести клиентскую базу

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: проверка создания клиента
*открытие формы
	И В командном интерфейсе я выбираю 'Продажи' 'Контрагенты'
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
*заполнить наименование
	Когда открылось окно 'Контрагент (создание)'
	И в поле с именем 'Наименование' я ввожу текст 'Тестовый контрагент'
*заполнить вид цен
	// Когда открылось окно 'Контрагент (создание)'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Закупочная'
*заполнить телефон
	// Когда открылось окно 'Контрагент (создание) *'
	И я разворачиваю группу с именем "Координаты"
	И в поле с именем 'Телефон' я ввожу текст '9531112233'
*сохранить
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	// Когда открылось окно 'Контрагент (создание) *'
	// И я жду закрытия окна 'Контрагент (создание) *' в течение 20 секунд
*запомнить код
	И Я запоминаю значение поля "Код" КАК "$Код$"
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
*проверить сохранение по коду
	И В командном интерфейсе я выбираю 'Продажи' 'Контрагенты'
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И таблица "Список" содержит строки:
		| 'Наименование'              | 'Код'       |
		| 'Тестовый контрагент'       | '$Код$' |	