
var todate = new Date();
todate.setMonth(todate.getMonth() + 1);
$(function () {
  $('#datetimepicker4').removeClass('hide_if_no_js');
  $('#datetimepicker4').datetimepicker({
    minDate: new Date(), maxDate: todate, locale: 'ru'});
});
