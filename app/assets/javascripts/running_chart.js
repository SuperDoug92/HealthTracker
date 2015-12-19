$(function () {
    new Highcharts.Chart({
        chart: {
          renderTo: "running_chart",
        },
        title: {
            text: 'Pace by Mile',
        },
        xAxis: {
            categories: [1,2,3,4,5,6,7,8,9,10,11,12]
        },
        yAxis: {
            tickInterval: 1,
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
            valueSuffix: ' minutes'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [gon.running_pr_series, {
            name: 'Most Recent',
            data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
        }]
    });
});
