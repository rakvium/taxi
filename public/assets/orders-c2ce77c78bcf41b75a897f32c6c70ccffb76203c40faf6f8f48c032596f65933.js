

var dynamicTable = (function() {

    var _tableId, _table,
        _fields, _headers,
        _defaultText;

    /** Builds the row with columns from the specified names.
     *  If the item parameter is specified, the memebers of the names array will be used as property names of the item; otherwise they will be directly parsed as text.
     */

    function format(item){
            var tagcolor = '<tr>';
            switch (item){
                case 4:tagcolor = '<tr class = "newOrder">';break;
                case 3:
                case 2:tagcolor = '<tr class = "warning">';break;
                case 1:
                case 0:tagcolor = '<tr class = "strongWarning">';break;
                default: tagcolor = '<tr>'; break
            }
            return tagcolor;
        }

    function dateTransform (item){
        var year = item.substr(0,4);
        var month = item.substr(5,2);
        var day = item.substr(8,2);
        var hour = item.substr(11,2);
        var minut = item.substr(14,2);
        item = hour + ":" + minut + " / " + month + "." + day + "." + year;
        return item;
    }

    function translate(item){
        switch (item){
            case 0:item = 'Нет ответа от 2 водителя';break;
            case 1:item = 'Отклонен 2 водителем';break;
            case 2:item = 'Нет ответа от 1 водителя';break;
            case 3:item = 'Отклонен 1 водителем';break;
            case 4:item = 'Новый';break;
            case 5:item = 'Отправлен водителю';break;
            case 6:item = 'отправлен водителю повторно'; break;
            case 7:item = 'Принят водителем';break;
            case 8:item = 'Водитель на месте';break;
            case 9:item = 'Клиент в машине';break;
            case 10:item = 'Выполнен';break;
            case 11:item = 'Отменен';break;
        }
        return item;
    }

    function _buildRowColumns(names, item) {
        var rowSt = '<tr>';
        var row ='';
        var str = 'Обработать';
        if (names && names.length > 0)
        {
            $.each(names, function(index, name) {
                var c = item ? item[name+''] : name;
                if (name === "id"){
                    var l = "/orders/"+c+"/edit"
                    row += '<td class = "alCenter">'+str.link(l)+'</td>'
                } else {
                    if (name === "status"){
                        rowSt = format(c);
                        c=translate(c);
                    }
                    if (name === "date_of_trip"){
                        c=dateTransform(c);
                    }
                    if (c === null) c='';
                    row += '<td class = "alCenter">' + c + '</td>';
                }
            });
        }
        rowSt = rowSt +row + '<tr>';
        return rowSt;
    }

    /** Builds and sets the headers of the table. */
    function _setHeaders() {
        // if no headers specified, we will use the fields as headers.
        _headers = (_headers === null || _headers.length < 1) ? _fields : _headers;
        var h = _buildRowColumns(_headers);
        if (_table.children('thead').length < 1)
            _table.prepend('<thead class = "orderHead"></thead>');
        _table.children('thead').html(h);
    }

    function _setNoItemsInfo() {
        if (_table.length < 1) return; //not configured.
        var colspan = _headers != null && _headers.length > 0 ?
            'colspan="' + _headers.length + '"' : '';
        var content = '<tr><td ' + colspan + ' class = "alCenter">' +
            _defaultText + '</td></tr>';
        if (_table.children('tbody').length > 0)
            _table.children('tbody').html(content);
        else _table.append('<tbody>' + content + '</tbody>');
    }

    function _removeNoItemsInfo() {
        var c = _table.children('tbody').children('tr');
        if (c.length === 1 && c.hasClass('no-items')) _table.children('tbody').empty();
    }

    return {
        /** Configres the dynamic table. */
        config: function(tableId, fields, headers, defaultText) {
            _tableId = tableId;
            _table = $('#' + tableId);
            _fields = fields || null;
            _headers = headers || null;
            _defaultText = defaultText || 'No items to list...';
            _setHeaders();
            _setNoItemsInfo();
            return this;
        },
        /** Loads the specified data to the table body. */
        load: function(data) {
            if (_table.length < 1) return; //not configured.
            _setHeaders();
            _table.children('tbody').empty();
            if (data && data.length > 0) {
                var rows = '';
                $.each(data, function(index, item) {

                    rows += _buildRowColumns(_fields, item);
                });
                _table.children('tbody').html(rows);
            }
            else {
                _setNoItemsInfo();
            }
            return this;
        },
        /** Clears the table body. */
        clear: function() {
            _setNoItemsInfo();
            return this;
        }


    };
}());

var dt = dynamicTable.config('data-table', //id of the table
                             ['id','dispatcher_id', 'driver_id', 'status', 'comment',
                             'phone_number', 'email', 'AdresFrom', 'AdresTo',
                             'number_of_passengers', 'date_of_trip'], //field names
                             ['','ID диспетчера', 'ID Водителя', 'Статус заказа',
                             'Комментарий', 'Номер телефона', 'Email',
                             'Куда подать машину', 'Куда ехать', 'Кол-во пассажиров',
                             'Время подачи'], //set to null for field names to be used as header names instead of custom headers
                             'There are no items to list...'); //default text for no items


function _fillTable(){
    return  $.ajax({ url: "/orders", success: function(data){
    dt.load(data)
  }, dataType: "json"});
}
_fillTable();
setInterval( _fillTable, 20000);
