
  $(function () {
    // # Place all the behaviors and hooks related to the matching controller here.
    // # All this logic will automatically be available in application.js.
    // # You can use CoffeeScript in this file: http://coffeescript.org/
    //

    new Highcharts.Chart({
        chart: {
          renderTo: "container",
          type: 'bar'
        },
        title: {
            text: 'Excercise over time'
        },
        xAxis: {

            categories: [activity_types],
            title: {
                text: 'Date'
            }
        },
        yAxis: {
            opposite: true,
            min: 0,
            title: {
                text: 'Miles'
            }
        },
        legend: {
            reversed: true
        },
        plotOptions: {
            series: {
                stacking: 'normal'
            }
        },
        series: [{
            name: 'Run',
            data: [5, 3, 4, 7, 2]
        }, {
            name: 'Bike',
            data: [2, 2, 3, 2, 1]
        }, {
            name: 'Swim',
            data: [3, 4, 4, 2, 5]
        }]
    });
});
