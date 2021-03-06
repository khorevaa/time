#использовать "../src"
#Использовать asserts
#Использовать logos

Перем юТест;
Перем Лог;

Функция ПолучитьСписокТестов(Знач Тестирование) Экспорт

	юТест = Тестирование;

	ИменаТестов = Новый Массив;

	ИменаТестов.Добавить("ТестДолжен_ПроверитьКонвертациюВМеткуВремени");
	ИменаТестов.Добавить("ТестДолжен_ПроверитьКонвертациюТекущейДатыВМеткуВремени");
	ИменаТестов.Добавить("ТестДолжен_ПроверитьКонвертациюИзМеткиВремени");
	ИменаТестов.Добавить("ТестДолжен_ПроверитьКонвертациюСтрокиВДату");


	Возврат ИменаТестов;

КонецФункции

Процедура ТестДолжен_ПроверитьКонвертациюВМеткуВремени() Экспорт

	ПроцессорДаты = Новый ДатаВремя();

	ПроверяемаяДата = Дата("20180101");

	МеткаВремени = ПроцессорДаты.ВМеткуВремени(ПроверяемаяДата);

	Утверждения.ПроверитьРавенство(МеткаВремени, 1514764800, "Полученные числа должны быть равны");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьКонвертациюТекущейДатыВМеткуВремени() Экспорт

	ПроцессорДаты = Новый ДатаВремя();

	МеткаВремени = ПроцессорДаты.ТекущаяДатаВМеткуВремени();

КонецПроцедуры

Процедура ТестДолжен_ПроверитьКонвертациюИзМеткиВремени() Экспорт

	ПроцессорДаты = Новый ДатаВремя();

	ПроверяемаяДата = Дата("20180101");

	ПолучившаясяДата = ПроцессорДаты.ИзМеткиВремени(1514764800);

	Утверждения.ПроверитьРавенство(ПроверяемаяДата, ПолучившаясяДата, "Полученные числа должны быть равны");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьКонвертациюСтрокиВДату() Экспорт
	
	ПроцессорДаты = Новый ДатаВремя();

	ТестовыеСлучаи = Новый Массив;

	ДатаПроверки = Дата("20180101");

	ТестовыеСлучаи.Добавить("dd MM yy");
	// ТестовыеСлучаи.Добавить("dd MMMM yy");
	ТестовыеСлучаи.Добавить("dd MM yy");
	ТестовыеСлучаи.Добавить("yy-MM-dd HH:mm");
	ТестовыеСлучаи.Добавить("dd MM yy HH mm ss");
	ТестовыеСлучаи.Добавить("dd MM yyyy");
	ТестовыеСлучаи.Добавить("MM dd, yyyy, HH:mm");
	ТестовыеСлучаи.Добавить("dd.MM.yy");
	ТестовыеСлучаи.Добавить("MM, dd, yyyy");
	ТестовыеСлучаи.Добавить("yyyyMMdd");
	ТестовыеСлучаи.Добавить("HH-mm-ss, dd-MM-yy");
	// ТестовыеСлучаи.Добавить("dd");
	ТестовыеСлучаи.Добавить("dd MM HH:mm:ss yyyy");
	// ТестовыеСлучаи.Добавить("HH:mm:ss");
	// ТестовыеСлучаи.Добавить("HH:mm");
	ТестовыеСлучаи.Добавить("yyyy-MM-dd HH:mm:ss");
	ТестовыеСлучаи.Добавить("yyyy-MM-dd");
	ТестовыеСлучаи.Добавить("yyyy/MM/dd");
	ТестовыеСлучаи.Добавить("dd/MM/yy");
	ТестовыеСлучаи.Добавить("MM dd yyyy");
	ТестовыеСлучаи.Добавить("yyyy-MM");
	ТестовыеСлучаи.Добавить("yyyy");
	ТестовыеСлучаи.Добавить("MM, dd, yyyy");
	ТестовыеСлучаи.Добавить("dd-MM-yyyy");
	ТестовыеСлучаи.Добавить("ddMMyyyy");
	
	Для каждого ФорматДатыСтроки Из ТестовыеСлучаи Цикл
		
		ДатаПроверкиПоФормату = Формат(ДатаПроверки, СтрШаблон("ДФ='%1'", ФорматДатыСтроки));
		Лог.Информация("Проверка чтения даты в формате <%1> строка даты <%2>", ФорматДатыСтроки, ДатаПроверкиПоФормату);
		Результат = ПроцессорДаты.СтрокаВДату(ДатаПроверкиПоФормату, ФорматДатыСтроки);
		Утверждения.ПроверитьРавенство(Результат, ДатаПроверки, "Даты должны быть равны");
	
	КонецЦикла;
	
КонецПроцедуры

Лог = Логирование.ПолучитьЛог("oscript.lib.time");


