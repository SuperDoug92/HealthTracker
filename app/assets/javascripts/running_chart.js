$(function () {
    new Highcharts.Chart({
        chart: {
          renderTo: "running_chart",
        },
        title: {
            text: 'Pace by Mile',
        },
        xAxis: {
            categories: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],
            title: {
                text: 'Miles'
            },
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
        series: [gon.running_pr_series, gon.running_current_series]
    });
});
