var todate = new Date();
todate.setMonth(todate.getMonth() + 1);
$(function () {
    $('#datetimepicker4').datetimepicker({
      minDate: new Date(), maxDate: todate, locale: 'ru'});
});
