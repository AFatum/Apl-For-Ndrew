INSERT INTO apl (name) VALUES ('Арсенал'),
							('Бернли'),
							('Борнмут'),
							('Вест Бромвич'),
							('Вест Хэм'),
							('Кристал Пэлас'),
							('Лестер Сити'),
							('Ливерпуль'),
							('Манчестер Сити'),
							('Манчестер Юнайтед'),
							('Мидлсбро'),
							('Сандерленд'),
							('Саутгемптон'),
							('Сток Сити'),
							('Суонси'),
							('Тоттенхэм'),
							('Уотфорд'),
							('Халл Сити'),
							('Челси'),
							('Эвертон');
							
INSERT INTO pl (name, code) VALUES 
							('Арсенал', 'ars'),
							('Бернли', 'ber'),
							('Борнмут', 'bor'),
							('Вест Бромвич', 'wbr'),
							('Вест Хэм', 'whe'),
							('Кристал Пэлас', 'kri'),
							('Лестер Сити', 'les'),
							('Ливерпуль', 'liv'),
							('Манчестер Сити', 'mnc'),
							('Манчестер Юнайтед', 'mnu'),
							('Мидлсбро', 'mid'),
							('Сандерленд', 'san'),
							('Саутгемптон', 'sau'),
							('Сток Сити', 'sto'),
							('Суонси', 'suo'),
							('Тоттенхэм', 'tot'),
							('Уотфорд', 'wat'),
							('Халл Сити', 'hal'),
							('Челси', 'che'),
							('Эвертон', 'eve');
							
INSERT INTO rt1 (t1, t2, g1, g2, date) VALUES
				('Халл Сити', 'Лестер Сити', 2, 1, '13.08.2016'),
				('Бернли', 'Суонси', 0, 1, '13.08.2016'),
				('Кристал Пэлас', ' Вест Бромвич', 0, 1, '13.08.2016'),
				('Халл Сити', 'Лестер Сити', 2, 1, '13.08.2016'),
				('Халл Сити', 'Лестер Сити', 2, 1, '13.08.2016'),	
				
INSERT INTO res (t1, t2, date, tour) VALUES
				/*------------- 1 - Первый тур ----------------------*/
				('hal',			'les',			'2016.08.13',	1),
				('ber',				'suo',				'2016.08.13',	1),
				('kri',		'wbr',			'2016.08.13',	1),
				('eve',				'tot',			'2016.08.13',	1),
				('mid',			'sto',			'2016.08.13',	1),
				('sau',			'wat',				'2016.08.13',	1),
				('mnc',		'san',			'2016.08.13',	1),
				('bor',				'mnu',	'2016.08.14',	1),
				('ars',				'liv',			'2016.08.14',	1),
				('che',				'whe',				'2016.08.15',	1);				
				
INSERT INTO results (t1, t2, date, tour) VALUES
				/*------------- 1 - Первый тур ----------------------*/
				('Халл Сити',			'Лестер Сити',			'2016.08.13',	1),
				('Бернли',				'Суонси',				'2016.08.13',	1),
				('Кристал Пэлас',		'Вест Бромвич',			'2016.08.13',	1),
				('Эвертон',				'Тоттенхэм',			'2016.08.13',	1),
				('Миддлсбро',			'Сток Сити',			'2016.08.13',	1),
				('Саутгемптон',			'Уотфорд',				'2016.08.13',	1),
				('Манчестер Сити',		'Сандерленд',			'2016.08.13',	1),
				('Борнмут',				'Манчестер Юнайтед',	'2016.08.14',	1),
				('Арсенал',				'Ливерпуль',			'2016.08.14',	1),
				('Челси',				'Вест Хэм',				'2016.08.15',	1),	
				/*------------- 2 - Второй тур ----------------------*/
				('Манчестер Юнайтед',	'Саутгемптон',			'2016.08.19',	2),
				('Сток Сити',			'Манчестер Сити',		'2016.08.20',	2),
				('Бернли',				'Ливерпуль',			'2016.08.20',	2),
				('Суонси',				'Халл Сити',			'2016.08.20',	2),
				('Тоттенхэм',			'Кристал Пэлас',		'2016.08.20',	2),
				('Уотфорд',				'Челси',				'2016.08.20',	2),
				('Вест Бромвич',		'Эвертон',				'2016.08.20',	2),
				('Лестер Сити',			'Арсенал',				'2016.08.20',	2),
				('Сандерленд',			'Миддлсбро',			'2016.08.21',	2),
				('Вест Хэм',			'Борнмут',				'2016.08.21',	2),
				/*------------- 3 - Третий тур ----------------------*/
				('Тоттенхэм',			'Ливерпуль',			'2016.08.27',	3),
				('Челси',				'Бернли',				'2016.08.27',	3),
				('Кристал Пэлас',		'Борнмут',				'2016.08.27',	3),
				('Эвертон',				'Сток Сити',			'2016.08.27',	3),
				('Лестер Сити',			'Суонси',				'2016.08.27',	3),
				('Саутгемптон',			'Сандерленд',			'2016.08.27',	3),
				('Уотфорд',				'Арсенал',				'2016.08.27',	3),
				('Халл Сити',			'Манчестер Юнайтед',	'2016.08.27',	3),
				('Вест Бромвич',		'Миддлсбро',			'2016.08.28',	3),
				('Манчестер Сити',		'Вест Хэм',				'2016.08.28',	3),
				/*------------- 4 - Четвёртый тур ----------------------*/
				('Манчестер Юнайтед',	'Манчестер Сити',		'2016.09.10',	4),
				('Арсенал',				'Саутгемптон',			'2016.09.10',	4),
				('Борнмут',				'Вест Бромвич',			'2016.09.10',	4),
				('Бернли',				'Халл Сити',			'2016.09.10',	4),
				('Миддлсбро',			'Кристал Пэлас',		'2016.09.10',	4),
				('Сток Сити',			'Тоттенхэм',			'2016.09.10',	4),
				('Вест Хэм',			'Уотфорд',				'2016.09.10',	4),
				('Ливерпуль',			'Лестер Сити',			'2016.09.10',	4),
				('Суонси',				'Челси',				'2016.09.11',	4),
				('Сандерленд',			'Эвертон',				'2016.09.12',	4),	
				/*------------- 5 - Пятый тур ----------------------*/
				('Челси',				'Ливерпуль',			'2016.09.16',	5),
				('Халл Сити',			'Арсенал',				'2016.09.17',	5),
				('Лестер Сити',			'Бернли',				'2016.09.17',	5),
				('Манчестер Сити',		'Борнмут',				'2016.09.17',	5),
				('Вест Бромвич',		'Вест Хэм',				'2016.09.17',	5),
				('Эвертон',				'Миддлсбро',			'2016.09.17',	5),
				('Уотфорд',				'Манчестер Юнайтед',	'2016.09.18',	5),
				('Кристал Пэлас',		'Сток Сити',			'2016.09.18',	5),
				('Саутгемптон',			'Суонси',				'2016.09.18',	5),
				('Тоттенхэм',			'Сандерленд',			'2016.09.18',	5),
				/*------------- 6 - Шестой тур ----------------------*/
				('Манчестер Юнайтед',	'Лестер Сити',			'2016.09.24',	6),
				('Борнмут',				'Эвертон',				'2016.09.24',	6),
				('Ливерпуль',			'Халл Сити',			'2016.09.24',	6),
				('Миддлсбро',			'Тоттенхэм',			'2016.09.24',	6),
				('Сток Сити',			'Вест Бромвич',			'2016.09.24',	6),
				('Сандерленд',			'Кристал Пэлас',		'2016.09.24',	6),
				('Суонси',				'Манчестер Сити',		'2016.09.24',	6),
				('Арсенал',				'Челси',				'2016.09.24',	6),
				('Вест Хэм',			'Саутгемптон',			'2016.09.25',	6),
				('Бернли',				'Уотфорд',				'2016.09.26',	6),
				/*------------- 7 - Седьмой тур ----------------------*/
				('Эвертон',				'Кристал Пэлас',		'2016.09.30',	7),
				('Суонси',				'Ливерпуль',			'2016.10.01',	7),
				('Халл Сити',			'Челси',				'2016.10.01',	7),
				('Сандерленд',			'Вест Бромвич',			'2016.10.01',	7),
				('Уотфорд',				'Борнмут',				'2016.10.01',	7),
				('Вест Хэм',			'Миддлсбро',			'2016.10.01',	7),
				('Манчестер Юнайтед',	'Сток Сити',			'2016.10.02',	7),
				('Лестер Сити',			'Саутгемптон',			'2016.10.02',	7),
				('Тоттенхэм',			'Манчестер Сити',		'2016.10.02',	7),
				('Бернли',				'Арсенал',				'2016.10.02',	7),
				/*------------- 8 - Восьмой тур ----------------------*/
				('Челси',				'Лестер Сити',			'2016.10.15',	8),
				('Арсенал',				'Суонси',				'2016.10.15',	8),
				('Борнмут',				'Халл Сити',			'2016.10.15',	8),
				('Манчестер Сити',		'Эвертон',				'2016.10.15',	8),
				('Сток Сити',			'Сандерленд',			'2016.10.15',	8),
				('Вест Бромвич',		'Тоттенхэм',			'2016.10.15',	8),
				('Кристал Пэлас',		'Вест Хэм',				'2016.10.15',	8),
				('Миддлсбро',			'Уотфорд',				'2016.10.16',	8),
				('Саутгемптон',			'Бернли',				'2016.10.16',	8),
				('Ливерпуль',			'Манчестер Юнайтед',	'2016.10.17',	8),
				/*------------- 9 - Девятый тур ----------------------*/
				('Борнмут',				'Тоттенхэм',			'2016.10.22',	2),
				('Арсенал',				'Миддлсбро',			'2016.10.22',	2),
				('Бернли',				'Эвертон',				'2016.10.22',	2),
				('Халл Сити',			'Сток Сити',			'2016.10.22',	2),
				('Лестер Сити',			'Кристал Пэлас',		'2016.10.22',	2),
				('Суонси',				'Уотфорд',				'2016.10.22',	2),
				('Вест Хэм',			'Сандерленд',			'2016.10.22',	2),
				('Ливерпуль',			'Вест Бромвич',			'2016.10.22',	2),
				('Манчестер Сити',		'Саутгемптон',			'2016.10.23',	2),
				('Челси',				'Манчестер Юнайтед',	'2016.10.23',	2),
				/*------------- 10 - Десятый тур ----------------------*/
				('Сандерленд',			'Арсенал',				'2016.10.29',	10),
				('Манчестер Юнайтед',	'Бернли',				'2016.10.29',	10),
				('Миддлсбро',			'Борнмут',				'2016.10.29',	10),
				('Тоттенхэм',			'Лестер Сити',			'2016.10.29',	10),
				('Уотфорд',				'Халл Сити',			'2016.10.29',	10),
				('Вест Бромвич',		'Манчестер Сити',		'2016.10.29',	10),
				('Кристал Пэлас',		'Ливерпуль',			'2016.10.29',	10),
				('Эвертон',				'Вест Хэм',				'2016.10.30',	10),
				('Саутгемптон',			'Челси',				'2016.10.30',	10),
				('Сток Сити',			'Суонси',				'2016.10.31',	10),
				/*------------- 11 - Одиннацтый тур ----------------------*/
				('Борнмут',				'Сандерленд',			'2016.11.05',	11),
				('Бернли',				'Кристал Пэлас',		'2016.11.05',	11),
				('Манчестер Сити',		'Миддлсбро',			'2016.11.05',	11),
				('Вест Хэм',			'Сток Сити',			'2016.11.05',	11),
				('Челси',				'Эвертон',				'2016.11.05',	11),
				('Арсенал',				'Тоттенхэм',			'2016.11.06',	11),
				('Халл Сити',			'Саутгемптон',			'2016.11.06',	11),
				('Ливерпуль',			'Уотфорд',				'2016.11.06',	11),
				('Суонси',				'Манчестер Юнайтед',	'2016.11.06',	11),
				('Лестер Сити',			'Вест Бромвич',			'2016.11.06',	11),
				/*------------- 12 - Двенадцатый тур ----------------------*/
				('Манчестер Юнайтед',	'Арсенал',				'2016.11.19',	12),
				('Кристал Пэлас',		'Манчестер Сити',		'2016.11.19',	12),
				('Эвертон',				'Суонси',				'2016.11.19',	12),
				('Саутгемптон',			'Ливерпуль',			'2016.11.19',	12),
				('Сток Сити',			'Борнмут',				'2016.11.19',	12),
				('Сандерленд',			'Халл Сити',			'2016.11.19',	12),
				('Уотфорд',				'Лестер Сити',			'2016.11.19',	12),
				('Тоттенхэм',			'Вест Хэм',				'2016.11.19',	12),
				('Миддлсбро',			'Челси',				'2016.11.20',	12),
				('Вест Бромвич',		'Бернли',				'2016.11.20',	12),
				/*------------- 13 - Тринадцатый тур ----------------------*/
				('Бернли',				'Манчестер Сити',		'2016.11.26',	13),
				('Халл Сити',			'Вест Бромвич',			'2016.11.26',	13),
				('Лестер Сити',			'Миддлсбро',			'2016.11.26',	13),
				('Ливерпуль',			'Сандерленд',			'2016.11.26',	13),
				('Суонси',				'Кристал Пэлас',		'2016.11.26',	13),
				('Челси',				'Тоттенхэм',			'2016.11.26',	13),
				('Уотфорд',				'Сток Сити',			'2016.08.27',	13),
				('Арсенал',				'Борнмут',				'2016.08.27',	13),
				('Манчестер Юнайтед',	'Вест Хэм',				'2016.08.27',	13),
				('Саутгемптон',			'Эвертон',				'2016.08.27',	13);
				
				
				
INSERT INTO results (t1, t2, date, tour) VALUES
				('Халл Сити',			'Лестер Сити',			'2016.08.13',	1),
				('Бернли',				'Суонси',				'2016.08.13',	1),
				('Кристал Пэлас',		'Вест Бромвич',			'2016.08.13',	1),
				('Эвертон',				'Тоттенхэм',			'2016.08.13',	1),
				('Миддлсбро',			'Сток Сити',			'2016.08.13',	1),
				('Саутгемптон',			'Уотфорд',				'2016.08.13',	1),
				('Манчестер Сити',		'Сандерленд',			'2016.08.13',	1),
				('Борнмут',				'Манчестер Юнайтед',	'2016.08.14',	1),
				('Арсенал',				'Ливерпуль',			'2016.08.14',	1),
				('Челси',				'Вест Хэм',				'2016.08.15',	1);	
				
INSERT INTO results (t1, t2, date, tour) VALUES
				('Манчестер Юнайтед',	'Саутгемптон',			'2016.08.19',	2),
				('Сток Сити',			'Манчестер Сити',		'2016.08.20',	2),
				('Бернли',				'Ливерпуль',			'2016.08.20',	2),
				('Суонси',				'Халл Сити',			'2016.08.20',	2),
				('Тоттенхэм',			'Кристал Пэлас',		'2016.08.20',	2),
				('Уотфорд',				'Челси',				'2016.08.20',	2),
				('Вест Бромвич',		'Эвертон',				'2016.08.20',	2),
				('Лестер Сити',			'Арсенал',				'2016.08.20',	2),
				('Сандерленд',			'Миддлсбро',			'2016.08.21',	2),
				('Вест Хэм',			'Борнмут',				'2016.08.21',	2);
				
/* Тур - 4 */			
INSERT INTO results (t1, t2, date, tour) VALUES
				('Манчестер Юнайтед',	'Манчестер Сити',		'2016.08.19',	2),
				('Арсенал',				'Саутгемптон',			'2016.08.20',	2),
				('Борнмут',				'Вест Бромвич',			'2016.08.20',	2),
				('Бернли',				'Халл Сити',			'2016.08.20',	2),
				('Миддлсбро',			'Кристал Пэлас',		'2016.08.20',	2),
				('Сток Сити',			'Тоттенхэм',			'2016.08.20',	2),
				('Вест Хэм',			'Уотфорд',				'2016.08.20',	2),
				('Ливерпуль',			'Лестер Сити',			'2016.08.20',	2),
				('Суонси',				'Челси',				'2016.08.21',	2),
				('Сандерленд',			'Эвертон',				'2016.08.21',	2);				
/* Тур - 5-6 */			
INSERT INTO results (t1, t2, date, tour) VALUES
				('Челси',				'Ливерпуль',			'2016.08.19',	2),
				('Халл Сити',			'Арсенал',				'2016.08.20',	2),
				('Лестер Сити',			'Бернли',				'2016.08.20',	2),
				('Манчестер Сити',		'Борнмут',				'2016.08.20',	2),
				('Вест Бромвич',		'Вест Хэм',				'2016.08.20',	2),
				('Эвертон',				'Миддлсбро',			'2016.08.20',	2),
				('Уотфорд',				'Манчестер Юнайтед',	'2016.08.20',	2),
				('Кристал Пэлас',		'Сток Сити',			'2016.08.20',	2),
				('Саутгемптон',			'Суонси',				'2016.08.21',	2),
				('Тоттенхэм',			'Сандерленд',			'2016.08.21',	2),
				('Манчестер Юнайтед',	'Лестер Сити',			'2016.08.19',	2),
				('Борнмут',				'Эвертон',				'2016.08.20',	2),
				('Ливерпуль',			'Халл Сити',			'2016.08.20',	2),
				('Миддлсбро',			'Тоттенхэм',			'2016.08.20',	2),
				('Сток Сити',			'Вест Бромвич',			'2016.08.20',	2),
				('Сандерленд',			'Кристал Пэлас',		'2016.08.20',	2),
				('Суонси',				'Манчестер Сити',		'2016.08.20',	2),
				('Арсенал',				'Челси',				'2016.08.20',	2),
				('Вест Хэм',			'Саутгемптон',			'2016.08.21',	2),
				('Бернли',				'Уотфорд',				'2016.08.21',	2);
/* Тур - 7-8-9 */			
INSERT INTO results (t1, t2, date, tour) VALUES
				('Эвертон',				'Кристал Пэлас',		'2016.08.19',	2),
				('Суонси',				'Ливерпуль',			'2016.08.20',	2),
				('Халл Сити',			'Челси',				'2016.08.20',	2),
				('Сандерленд',			'Вест Бромвич',			'2016.08.20',	2),
				('Уотфорд',				'Борнмут',				'2016.08.20',	2),
				('Вест Хэм',			'Миддлсбро',			'2016.08.20',	2),
				('Манчестер Юнайтед',	'Сток Сити',			'2016.08.20',	2),
				('Лестер Сити',			'Саутгемптон',			'2016.08.20',	2),
				('Тоттенхэм',			'Манчестер Сити',		'2016.08.21',	2),
				('Бернли',				'Арсенал',				'2016.08.21',	2),
				('Челси',				'Лестер Сити',			'2016.08.19',	2),
				('Арсенал',				'Суонси',				'2016.08.20',	2),
				('Борнмут',				'Халл Сити',			'2016.08.20',	2),
				('Манчестер Сити',		'Эвертон',				'2016.08.20',	2),
				('Сток Сити',			'Сандерленд',			'2016.08.20',	2),
				('Вест Бромвич',		'Тоттенхэм',			'2016.08.20',	2),
				('Кристал Пэлас',		'Вест Хэм',				'2016.08.20',	2),
				('Миддлсбро',			'Уотфорд',				'2016.08.20',	2),
				('Саутгемптон',			'Бернли',				'2016.08.21',	2),
				('Ливерпуль',			'Манчестер Юнайтед',	'2016.08.21',	2),
				('Борнмут',				'Тоттенхэм',			'2016.08.19',	2),
				('Арсенал',				'Миддлсбро',			'2016.08.20',	2),
				('Бернли',				'Эвертон',				'2016.08.20',	2),
				('Халл Сити',			'Сток Сити',			'2016.08.20',	2),
				('Лестер Сити',			'Кристал Пэлас',		'2016.08.20',	2),
				('Суонси',				'Уотфорд',				'2016.08.20',	2),
				('Вест Хэм',			'Сандерленд',			'2016.08.20',	2),
				('Ливерпуль',			'Вест Бромвич',			'2016.08.20',	2),
				('Манчестер Сити',		'Саутгемптон',			'2016.08.21',	2),
				('Челси',				'Манчестер Юнайтед',	'2016.08.21',	2);
				
/* Тур - 10-11-12 */			
INSERT INTO results (t1, t2, date, tour) VALUES
				('Сандерленд',			'Арсенал',				'2016.10.29',	10),
				('Манчестер Юнайтед',	'Бернли',				'2016.10.29',	10),
				('Миддлсбро',			'Борнмут',				'2016.10.29',	10),
				('Тоттенхэм',			'Лестер Сити',			'2016.10.29',	10),
				('Уотфорд',				'Халл Сити',			'2016.10.29',	10),
				('Вест Бромвич',		'Манчестер Сити',		'2016.10.29',	10),
				('Кристал Пэлас',		'Ливерпуль',			'2016.10.29',	10),
				('Эвертон',				'Вест Хэм',				'2016.10.30',	10),
				('Саутгемптон',			'Челси',				'2016.10.30',	10),
				('Сток Сити',			'Суонси',				'2016.10.31',	10),
				('Борнмут',				'Сандерленд',			'2016.11.05',	11),
				('Бернли',				'Кристал Пэлас',		'2016.11.05',	11),
				('Манчестер Сити',		'Миддлсбро',			'2016.11.05',	11),
				('Вест Хэм',			'Сток Сити',			'2016.11.05',	11),
				('Челси',				'Эвертон',				'2016.11.05',	11),
				('Арсенал',				'Тоттенхэм',			'2016.11.06',	11),
				('Халл Сити',			'Саутгемптон',			'2016.11.06',	11),
				('Ливерпуль',			'Уотфорд',				'2016.11.06',	11),
				('Суонси',				'Манчестер Юнайтед',	'2016.11.06',	11),
				('Лестер Сити',			'Вест Бромвич',			'2016.11.06',	11),
				('Манчестер Юнайтед',	'Арсенал',				'2016.11.19',	12),
				('Кристал Пэлас',		'Манчестер Сити',		'2016.11.19',	12),
				('Эвертон',				'Суонси',				'2016.11.19',	12),
				('Саутгемптон',			'Ливерпуль',			'2016.11.19',	12),
				('Сток Сити',			'Борнмут',				'2016.11.19',	12),
				('Сандерленд',			'Халл Сити',			'2016.11.19',	12),
				('Уотфорд',				'Лестер Сити',			'2016.11.19',	12),
				('Тоттенхэм',			'Вест Хэм',				'2016.11.19',	12),
				('Миддлсбро',			'Челси',				'2016.11.20',	12);
				
/* Тур - 13-14-15 */			
INSERT INTO results (t1, t2, date, tour) VALUES
				('Сандерленд',			'Арсенал',				'2016.10.29',	10),
				('Манчестер Юнайтед',	'Бернли',				'2016.10.29',	10),
				('Миддлсбро',			'Борнмут',				'2016.10.29',	10),
				('Тоттенхэм',			'Лестер Сити',			'2016.10.29',	10),
				('Уотфорд',				'Халл Сити',			'2016.10.29',	10),
				('Вест Бромвич',		'Манчестер Сити',		'2016.10.29',	10),
				('Кристал Пэлас',		'Ливерпуль',			'2016.10.29',	10),
				('Эвертон',				'Вест Хэм',				'2016.10.30',	10),
				('Саутгемптон',			'Челси',				'2016.10.30',	10),
				('Сток Сити',			'Суонси',				'2016.10.31',	10),
				('Борнмут',				'Сандерленд',			'2016.11.05',	11),
				('Бернли',				'Кристал Пэлас',		'2016.11.05',	11),
				('Манчестер Сити',		'Миддлсбро',			'2016.11.05',	11),
				('Вест Хэм',			'Сток Сити',			'2016.11.05',	11),
				('Челси',				'Эвертон',				'2016.11.05',	11),
				('Арсенал',				'Тоттенхэм',			'2016.11.06',	11),
				('Халл Сити',			'Саутгемптон',			'2016.11.06',	11),
				('Ливерпуль',			'Уотфорд',				'2016.11.06',	11),
				('Суонси',				'Манчестер Юнайтед',	'2016.11.06',	11),
				('Лестер Сити',			'Вест Бромвич',			'2016.11.06',	11),
				('Манчестер Юнайтед',	'Арсенал',				'2016.11.19',	12),
				('Кристал Пэлас',		'Манчестер Сити',		'2016.11.19',	12),
				('Эвертон',				'Суонси',				'2016.11.19',	12),
				('Саутгемптон',			'Ливерпуль',			'2016.11.19',	12),
				('Сток Сити',			'Борнмут',				'2016.11.19',	12),
				('Сандерленд',			'Халл Сити',			'2016.11.19',	12),
				('Уотфорд',				'Лестер Сити',			'2016.11.19',	12),
				('Тоттенхэм',			'Вест Хэм',				'2016.11.19',	12),
				('Миддлсбро',			'Челси',				'2016.11.20',	12);
				
/* Тур - 13 */			
INSERT INTO results (t1, t2, date, tour) VALUES
				('Бернли',				'Манчестер Сити',		'2016.11.26',	13),
				('Халл Сити',			'Вест Бромвич',			'2016.11.26',	13),
				('Лестер Сити',			'Миддлсбро',			'2016.11.26',	13),
				('Ливерпуль',			'Сандерленд',			'2016.11.26',	13),
				('Суонси',				'Кристал Пэлас',		'2016.11.26',	13),
				('Челси',				'Тоттенхэм',			'2016.11.26',	13),
				('Уотфорд',				'Сток Сити',			'2016.08.27',	13),
				('Арсенал',				'Борнмут',				'2016.08.27',	13),
				('Манчестер Юнайтед',	'Вест Хэм',				'2016.08.27',	13),
				('Саутгемптон',			'Эвертон',				'2016.08.27',	13);	
				
SELECT * FROM results;