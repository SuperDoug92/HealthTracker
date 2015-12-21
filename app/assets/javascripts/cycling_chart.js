var N = 45; 
$(function () {
    new Highcharts.Chart({
        chart: {
          renderTo: "cycling_chart",
        },
        title: {
            text: 'Pace by Mile',
        },
        xAxis: {
            categories: Array.apply(null, {length: N}).map(Number.call, Number),
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
        series: [gon.cycling_pr_series, gon.cycling_current_series]
    });
});
