// Generated by CoffeeScript 1.6.1
(function() {
  var days_in_month, month_calendar_table, month_calendar_text, month_names, week_days;

  month_names = ['Січень', 'Лютий', 'Березень', 'Квітень', 'Травень', 'Червень', 'Липень', 'Серпень', 'Вересень', 'Жовтень', 'Листопад', 'Грудень'];

  days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  week_days = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Нд'];

  month_calendar_table = function(year, month) {
    var current_day, first_day, i, row, table, _i, _j, _ref;
    first_day = (new Date(year, month, 1)).getDay();
    if (first_day === 0) {
      first_day = 6;
    } else {
      first_day = first_day - 1;
    }
    table = [week_days];
    row = [];
    for (i = _i = 0; 0 <= first_day ? _i < first_day : _i > first_day; i = 0 <= first_day ? ++_i : --_i) {
      row.push(' ');
    }
    for (current_day = _j = 1, _ref = days_in_month[month]; 1 <= _ref ? _j <= _ref : _j >= _ref; current_day = 1 <= _ref ? ++_j : --_j) {
      row.push(current_day);
      if (i === 6) {
        i = 0;
        table.push(row);
        row = [];
      } else {
        i = i + 1;
      }
    }
    if (i > 0) {
      while (i < 7) {
        row.push(' ');
        i++;
      }
      table.push(row);
    }
    return table;
  };

  month_calendar_text = function(year, month) {
    var render_row, tbl;
    tbl = month_calendar_table(year, month);
    render_row = function(row) {
      return row.map(function(x) {
        var s;
        s = x.toString();
        if (s.length < 2) {
          s = ' ' + s;
        }
        return s;
      }).join(' ');
    };
    return month_names[month] + ' ' + year + '\n' + tbl.map(render_row).join('\n');
  };

  window.cal = {
    table: month_calendar_table,
    text: month_calendar_text
  };

}).call(this);
