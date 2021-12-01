#retorna a data atual do servidor
select curdate() as dataAtual;
select current_date() as dataAtual;

#retorna a hora atual do servidor
select curtime() as horaAtual;
select current_time() as horaAtual;

#Retorna a data e hora atual do servidor
select current_timestamp() as dataHoraAtual;

select time_format(curtime(), '%H') as hora;
select time_format(curtime(), '%i') as minuto;
select time_format(curtime(), '%s') as segundo;
select time_format(curtime(), '%H:%i') as horaMinuto;
select time_format(curtime(), '%r') as horaAMPM; #00 até 12
select time_format(curtime(), '%T') as hora24h; #00 até 24

select hour(curtime()) as hora;
select minute(curtime()) as minutos;
select second(curtime()) as segundos;

select timediff(curtime(), '06:00:00') as diferencaHora;

# Funções de formatação de data 
select date_format(curdate(), '%W') as diaSemana;
select date_format(curdate(), '%w') as numeroDiaSemana;
select date_format(curdate(), '%a') as diaSemanaAbrev;
select date_format(curdate(), '%m') as mes;
select date_format(curdate(), '%b') as mes;
select date_format(curdate(), '%M') as mes;
select date_format(curdate(), '%d') as dia;
select date_format(curdate(), '%Y') as ano;

select date_format(curdate(), '%Y-%m-%d') as dataFormatada;
select date_format('2000-10-11', '%d/%m/%Y') as dataFormatada;

#day(), month(), year()
select day(curdate()) as dia;
select month(curdate()) as mes;
select year(curdate()) as ano;

#datediff - calcula a diferença entre datas
select datediff(curdate(), '2021-11-01') as diferencaData;

select week(curdate()) as numeroDaSemana;

# segunda = 0 ..... domingo = 6
select weekday(curdate()) as diadaSemana;


select weekofyear(curdate()) as diadaSemana;

#retorna o ano e o numero da semana
select yearweek('2021-01-04') as anoNumeroSemana;

select dayofyear('2021-12-31') as numeroDiaAno;







