$(function () {
    new Highcharts.Chart({
        chart: {
          renderTo: "cycling_chart",
        },
        title: {
            text: 'Pace by Mile',
            x: -20 //center
        },
        xAxis: {
            categories: [1,2,3,4,5,6,7,8,9,10,11,12]
        },
        yAxis: {
            title: {
                text: 'Pace'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '°C'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Fastest',
            data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        }, {
            name: 'Most Recent',
            data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
        }]
    });
});
